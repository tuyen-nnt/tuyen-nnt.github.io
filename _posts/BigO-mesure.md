tạo mảng => tìm chỗ trống (memory lookup), dọn dẹp chỗ để có chỗ trống

gán giá trị cho 1 phần tử trong mảng => tải lên con trỏ tại vị trí cần gán, có thể thực hiện 1 số phép toán, lưu trữ giá trị vào vị trí đó trong bộ nhớ

vòng lặp: incre giá trị i, so sánh i với n để thoát ra khỏi vòng lặp, chạy lệnh bên trong loop

phép cộng phần tử mảng: tìm kiếm 2 giá trị trong mảng, ghi kết quả vào 1 phần tử khác trong mảng.

#### Computing runtime : 

Để biết chương trình này chạy trên máy tính thật mất bao lâu, cần quan tâm đến các thứ sau đây:

##### Speed of the Computer:

Chạy trên siêu máy tính lớn sẽ nhanh hơn nhiều so với chạy trên điện thoại.

##### The system Architecture:

![](/assets/images/system-arch.png)

CPU hỗ trợ hoạt động nào và chúng mất bao lâu để kết nối với các phần khác
=> ảnh hưởng đến runtime của chương trình.

##### The compiler being used:

Trình biên dịch sẽ xử lý để biến code của bạn thành code máy, và chúng làm nhiều thứ để tối ưu code của bạn. Điều này sẽ ảnh hưởng đến runtime.

##### Details of the Memory Hierachy:
![](/assets/images/memory-hierarchy.png)

Nếu quá trình tính toán khớp với bộ nhớ đệm thì mọi chuyện diễn ra rất nhanh khi cần lookups.
Nếu phải tra cứu đến RAM thì sẽ chậm hơn nhiều.
Nếu hết bộ nhớ trong RAM thì phải bắt đầu ghi thao tác vào hard disk, và sẽ chậm hơn rất nhiều.

Việc tra cứu hark disk có thể mất vài mili giây (đây là khoảng rất lâu đối với computing runtime)

=> runtime cũng phụ thuộc vào việc bộ nhớ được lưu như thế nào trong mô hình memory hierachy này, nó sẽ ảnh hưởng đến thời gian xử lý, và thuật toán dự đoán xử lý memory trong bộ nhớ như thế nào.
