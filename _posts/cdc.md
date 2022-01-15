### Change Data Capture (CDC)
Có khoảng 4 loại CDC, trong đó ``Log-based CDC`` là method phổ biến và ưa dùng nhất hiện nay.
 
 ![](/assets/images/log-based-cdc.jpg)

Là quá trình stream data từ source database có transaction.log (redo.log), capture gần như real-time các data được thêm/xóa/sửa trong file log đó đưa lên Kafka và sau đó được sink vào 1 target (database).

**Ưu điểm nổi trội:** không cần phải đụng đến operational database làm ảnh hưởng hoạt động của db chính.

**Thách thức:** nếu có sự thay đổi cấu trúc db OLTP thì file log sẽ thay đổi data type theo, dẫn đến cơ chế/app read data từ file log khó control được dễ gây ra lỗi. Do vậy cần resource để control và đảm bảo hạn chế sửa đổi cấu trúc dữ liệu.


 ![](/assets/images/cdc.jpg)