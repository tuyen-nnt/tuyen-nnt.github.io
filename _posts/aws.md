---
layout: post
title:  "AWS - Integrate API Gateway and Lambda function"
author: tuyennnt
categories: [ Data Engineering]
image: assets/images/aws-api.png

---
### Introduction

Lambda cho phép một số dịch vụ trong AWS services như   S3, CloudFront, API Gateway trigger để thực thi các tác vụ xử lý tính toán. Document này sẽ trình bày về việc tính hợp giữa REST API với Lambda function và các đánh giá khi ứng dụng thực tế.

#### API Gateway:
Trong một tổ chức với microservices architecture với mục đích tăng khả năng scale và tốc độ develop của hệ thống/sản phẩm thì API gateway là một sự lựa chọn với các điểm mạnh sau:

* Easy monitoring: theo dõi các metrics như số lần calls, latency, error rate.
* Efficient API Development: cho phép iterate, test và release version mới của API.
* Performance at scale: với lợi thế là aws có edge location từ dịch vụ Cloudfont thì có thể giúp latency ở mức thấp nhất có thể, điều tiết traffic và cache các lần call giúp backend không cần phải gọi lại và giúp tăng khả năng chịu đựng được traffic lớn (resiliene). 
* Cost-saving: trả theo nhu cầu sử dụng, bạn có thể control được chi phí bởi chỉ trả tiền cho số request gọi, và lượng data transfer.
* Flexible Security controls: có IAM role cũng như OAuth token hoặc authorization giúp verify các request gọi tới API.


#### Lambda function
Khi có một trigger gọi vào Lambda function thì code trong function sẽ được thực thi sau đó trả về kết quả cho service khác hoặc gửi kết quả lại cho service yêu cầu.

API Gateway có cung cấp interface cho code chạy trên AWS Lambda cũng như một số services khác.
##### Upload code cho Lambda func
* Dùng inline code editor
* Upload ZIP file chứa code
* Store ZIP code file trên S3 và point Lambda đến file đó

Dựa trên nhu cầu của Lambda function của bạn thì bạn có thể cấp quyền cho Lambda access các AWS services khác.
=> Setup permission của Lambda func trên mục Identity and Access Manager Role (IAM role).
> Ví dụ: role để lấy log,... Các log được in ra console sẽ được gửi đến CloudWatch Logs service (dịch vụ thu thập log).


Có nhiều service AWS có thể trigger Lambda funct như S3, CloudFront, API Gateway, etc.
> Ví dụ: function có thể được S3 trigger khi object mới được upload trên S3. 
> Thông thường ta sẽ có server bên ngoài poll liên tục vào S3 bucket để trigger khi có object mới upload trên S3 bucket input để xử lý và send kết quả đến S3 bucket output. Với serverless ta có thể cấu hình cho S3 được phép  trigger Lambda function bằng cách tạo function policy. Nếu dùng AWS Management Console thì policy sẽ được tạo tự động.

![](/assets/images/trigger-upload-s3.png)

Khi Lambda function bắt đầu thực thi, thì chúng cần entry point để chạy code. Lúc này chúng ta cần ``handler`` để service Lambda biết được cái code nào mà nó cần chạy. Handler sẽ cho Lambda biết là file nào hay class nào chứa func mà nó cần chạy cũng như cái tên của nó. Lambda sẽ dùng handler để chạy lambda func từ cái trigger mà nó nhận được.

Code của bạn có thể cần biết chi tiết các trigger mà nó nhận được là gì và thông tin đó được đưa vào bên trong handler gọi là ``event payload``.

> Lấy ví dụ object tam giác trong bucket, event payload chứa bucket name và object key của hình tam giác sẽ được transform bằng cách lật lại.


###### Asynchronous invocation

Khi S3 trigger Lambda function, S3 sẽ không quan tâm về việc Lambda trả về kết quả gì.

###### Synchronous invocation
API Gateway gửi request đến Lambda khi gọi REST API method. API Gateway hoàn toàn quan tâm đến việc nhận phản hồi từ Lambda để gửi kết quả về cho user.


#### Lambda compute time:

Chúng ta không thể allocate CPU power mà chỉ có thể allocate RAM, nhưng khi allocate RAM thì CPU power cũng sẽ được tăng khả năng xử lý của nó.

RAM có thể được allocate từ 128MB đến 3GB.

AWS Lambda sẽ charge phí cho mỗi 100ms xử lý tính toán và limit 15 phút tối đa. Sau 15p thì aws sẽ rút resource.

Nếu function của bạn chạy 15p thì sẽ bị charge 15p (trường hợp infinite loop chẳng hạn). Tuy nhiên, ta có thể cấu hình timeout để function chạy tối đa số thời gian ta quy định và tự ngưng xử lý tránh trường hợp này xảy ra.