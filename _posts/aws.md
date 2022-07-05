#### API Gateway:
AWS hỗ trợ các loại



##### Upload code cho Lambda func
* Dùng inline code editor
* Upload ZIP file chứa code
* Store ZIP code file trên S3 và point Lambda đến file đó

Dựa trên nhu cầu của Lambda function của bạn thì bạn có thể cấp quyền cho Lambda access các AWS services khác.
=> Setup permission của Lambda func trên mục Identity and Access Manager Role
> Ví dụ role để lấy log,... Các log được in ra console sẽ được gửi đến CloudWatch Logs service (dịch vụ thu thập log).


Có nhiều service AWS có thể trigger Lambda funct như S3, CloudFront, API Gateway, etc.
> Ví dụ function có thể được S3 trigger khi object mới được upload trên S3. 
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