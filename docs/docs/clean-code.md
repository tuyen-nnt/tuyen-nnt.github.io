
Quy tắc chung:
* CÓ ý nghĩa
* Nhỏ
* Làm 1 thứ
* Sử dụng cmt thích hợp



Clean code: 
* Ko những máy mà người đều đọc hiểu
* Chạy đúng theo biz requirement
* Teamwork
* Có khả năng maintain, lâu ngày đọc lại vẫn hiểu
* Tăng giá trị của programmer


Cách viết clean code:
* Xem chuẩn chung của team là gì và follow theo
* Đoạn code phải đơn giản
* Cố gắng tìm ra gốc rễ của vấn đề

Cách đặt tên:
* Đặt tên biến có ý nghĩa, đừng đặt a,b,c,d,v.v
* Tên biến phải phát âm và dễ search được từ biz term như accountIndex, v.v
* Thay thế những con số magic numbers bằng hằng số như MAX_AT_ONE, v.v
* Tránh viết tắt

Cách viết hàm:
* Tên có mô tả, các câu lệnh phải bổ trợ cho cái tên hàm
* Gọn, Đơn giản
* Làm 1 thứ thôi, group các câu lệnh lại thành interface/method nhỉ
* Đặt tên đúng nội dung trong hàm, không có ẩn ý trong hàm, tránh vô tình tạo ra hiệu ứng khác những gì có thể thấy trong code.
* Không dùng flag argument kiểu funtion(bool var) 

Chú thích:
* Không được dư thừa
* Đừng cmt cho ngooặc đóng
* Đừng cmt cho code

* Thể hiện bản thân trong code
* Sử dụng để làm rõ code
* Sử dụng để cảnh báo những code quan trọng nếu sửa sẽ ảnh hưởng lớn
![](img/clean-warning.png)
* Sử dụng để giải thích dự định intention
* Comment bản quyền cho code, hoặc cmt đây là api của bên khác


Format code:

![](formatcode.png)


Cách viết class:
* Small
* Single responsibility
* Maximize using


