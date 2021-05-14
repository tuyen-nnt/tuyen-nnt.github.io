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
> { “key” : “value” }


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
Trong data_warehouse database, thường những schema chúng ta thấy là star schema có sơ đồ giống như hình ngôi sao.

Fact table ở giữa và xung quanh là các Dimension tables, trong đó:
* Fact table: là table chứa các dữ liệu xảy ra trên thế giới như product orders, v.v	
* Dimension table: là các table mang thuộc tính để mô tả cho fact table như màu sắc, kích thước, v.v

Tìm hiểu thêm về Star chema [tại đây](https://en.wikipedia.org/wiki/Star_schema)


*Ví dụ thực tế:*
Giả sử ta có database mô tả cấu trúc dữ liệu cho hệ thống bán hàng ở 1 cửa hàng quần áo:

