# Chapter 1 : Các công cụ làm việc trong mảng Data Engineering

## I. Database

### 1. Database là gì?

Database là tập hợp dữ liệu lớn được tổ chức đặc biệt để tìm kiếm và rút trích dữ liệu nhanh.

//Up hình database ở đây

Các đặc điểm của nó:
* Lưu trữ dữ liệu
* Tổ chức dữ liệu
* Rút trích/Tìm kiến dữ liệu thông qua DBMS

### 2. Phân biệt dữ liệu **có cấu trúc** và dữ liệu **không cấu trúc**

#### Có cấu trúc: 
Database có schema, ví dụ như các relational database

#### Bán cấu trúc (semi-structured): 
Ví dụ như file JSON
```
 { “key” : “value” }
```

#### Không cấu trúc: 
Không có schema, giống như các tập tin : videos, hình ảnh


### 3. Phân biệt SQL và NoSQL
#### SQL database có những đặc điểm sau:
* Có các bảng để truy vấn
* Có Database schema (xác định sự liên hệ và thuộc tính của database)
* Có các Relational database (có quan hệ với nhau)
* Các hệ quản trị cơ sở dữ liệu phổ biến của ngôn ngữ này: MySQL, PostgreSQL


#### NoSQL database có những đặc điểm sau:
* Có các Non-relational database
* Thường gắn với các dữ liệu không có schema (unstructured), nhưng đôi khi có các dữ liệu có schema (structured)
* Lưu trữ các cặp key-value (e.g. dùng cho caching hoặc cấu hình phân tán “distributed configuration”)
* Những ứng dụng thường dùng NoSQL là những ứng dụng chứa cặp key-value như Redis hoặc MongoDB có model là document database.

*Các giá trị trong document database thường là các object có cấu trúc hoặc bán cấu trúc, ví dụ như JSON object.


### 4. SQL: Tìm hiểu về Database chema

#### Database schema có vai trò gì?
> Có nhiệm vụ mô tả cấu trúc và các mối quan hệ của các bảng trong database thông qua SQL code và sơ đồ schema


### Star schema
Trong datawarehouse database, thường những schema chúng ta thấy là star schema có sơ đồ giống như hình ngôi sao.

Fact table ở giữa và xung quanh là các Dimension tables, trong đó:
* Fact table: là table chứa các dữ liệu xảy ra trên thế giới như product orders, v.v	
* Dimension table: là các table mang thuộc tính để mô tả cho fact table như màu sắc, kích thước, v.v

Tìm hiểu thêm về Star chema [tại đây](https://en.wikipedia.org/wiki/Star_schema)


*Ví dụ thực tế:*
Giả sử ta có database mô tả cấu trúc dữ liệu cho hệ thống bán hàng ở 1 cửa hàng quần áo:


****************


## II. Parallel computing 

### Parallel computing là gì?

Trước tiên ta đi từ ý tưởng của việc tạo ra parallel computing.
* Nó hình thành nên nền móng cho các công cụ xử lý data hiện đại (data processing tool)
* Tuy nhiên lí do quan trọng nhất phải nói đến là để tối ưu **Bộ nhớ và hiệu năng xử lý dữ liệu**

#### Cách thức hoạt động:
* Chia task thành nhiều task phụ
* Phân tán task phụ trên một vài máy tính (thường là các [commodity computer](https://whatis.techtarget.com/definition/commodity-computer#:~:text=A%20commodity%20computer%20is%20a,no%2Dfrills%20but%20functional%20machines.) hoặc đã có sẵn để ít tốn phí thay vì sử dụng các siêu máy tính)
* Các máy tính làm việc song song với nhau trên các task phụ, do đó các task được hoàn thành nhanh hơn

Chúng ta hãy cùng xem ví dụ vận hành shop may đồ:
<chèn hình ảnh>

Đặt mục tiêu may 100 cái áo, thì shop nhận thấy:
* Nhân viên may giỏi nhất nhóm may 1 cái áo trong 20 phút => 12 cái áo trong 4 tiếng
* Những nhân viên khác thì may 1 cái áo trong 1 tiếng

Sau khi áp dụng mô hình parallel bằng cách:
* Chia ra 4 chu kỳ
* Mỗi chu kì 25 cái áo và 4 nhân viên may làm việc song song
Thì ta thấy được nếu các nhân viên may có khả năng thấp hơn khi cùng làm việc song song với nhau thì sẽ làm được 16 cái áo trong 4 tiếng.

Nói về thực tế máy tính, 4 nhân viên may có năng lực thấp hơn thì sẽ giống như là các máy tính có sẵn, ít tốn phí, thay vì ta phải thuê 1 nhân viên giỏi hay có thể nói là siêu máy tính thì chi phí sẽ cao hơn nhiều nhưng không chắc chắc hiệu quả bằng.

Tóm lại, lợi ích của parallel computing:
* Hiệu suất xử lý
* Bộ nhớ: chia dữ liệu thành các tập hợp con và đưa vào bộ nhớ của các máy tính khác nhau
=> mức chiếm dụng bộ nhớ tương đối nhỏ và dữ liệu được đưa vào trong bộ nhớ gần RAM nhẩt

#### Những rủi ro khi áp dụng
**Overhead due to communication**
* Yêu cầu chưa đủ lớn để áp dụng
* Cần nhiều processing units hơn
* Đôi khi tách ra sẽ gặp vấn đề về program runtime, yêu cầu tốn nhiều thời gian để xử lý giao tiếp giữa các processes hơn so với không tách ra. Việc có nhiều chương trình hơn sẽ khiến thời gian contact switch giữa các chương trình nhiều hơn không phù hợp khi yêu cầu chưa đủ lớn. Xem hình bên dưới:
"chèn hình ảnh"

#### Code Python để chia thành nhiều task phụ
##### Sử dụng API **multiprocessing.Pool**

"chèn hình ảnh"

##### Sử dụng DASK framework để tránh viết API dưới hệ thống 

"chèn hình ảnh"



Một số ghi chú cho Parallel computing:

> * Không phải lúc nào cũng tăng thời gian xử lý công việc, do hiệu ứng của overhead communication ở phần contact switch giữa các ứng dụng.
> * GIúp tối ưu việc sử dụng bộ xử lý đa nhiệm (multiple processing unit)
> * Giúp tối ưu bộ nhớ giữa một số hệ thống 

Bài viết về Parallel computing đến đây là kết thúc, các bạn có thể xem qua 1 số đoạn code liên quan đến chủ đề này ở repo data-engineering của mình nhé! 


