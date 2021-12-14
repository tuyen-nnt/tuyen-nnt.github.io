Mở socket >> connect đến đường dẫn và port >> Tạo biến string cmd request GET, POST,... >> encode string cmd thành dạng byte >> gửi request đi.

Nhận response về từ thế giới bên ngoài (ngầm hiểu là UTF-8 >> decode response từ dạng byte thành dạng unicode.

![](/assets/images/unicode.png)  

*UTF-8 là bảng mã tham chiếu có thể detect được bảng mã ASCII hay UTF-8 (xét từ ASCII trước) mà allocate động kích thước của ký tự trong khoảng từ 1-4 bytes. Được recommend để dùng cho việc encode data giữa 2 hệ thống khác nhau.*


*Trong Python 3 thì tất cả kiểu dữ liệu string đều dùng bảng mã unicode. Còn Python 2 thì phân rõ 1 string bất kỳ đang được mã hóa thành kiểu dữ liệu là unicode hay string, còn byte và string thì giống nhau là kiểu string thôi.*


#### Beautiful soup
Cài đặt vào chương trình python hoặc extract thư mục bs4.zip bỏ vào cùng folder chứa file code sử dụng thư viện này.
![](/assets/images/install-bs4.png) 

``from bs4 import BeautifulSoup``
  
read() : hàm đọc nguyên block data bao gồm cả \n

``soup = BeautifulSoup(html, 'html.parser')``

với html là data được read() từ url nhập vào
sau đó sẽ được beautifulsoup parse (biến đổi) thành 1 soup object được clean sạch sẽ, xinh đẹp.

![](/assets/images/bs4.png) 

Sau đó, chúng ta sẽ parse ra list danh sách tất cả các thẻ ``<a>`` và đọc từng object trong list ``tags`` để get và in ra attribute ``href`` hoặc None.

#### Summary
* Web scraping là lấy data từ web về, có 2 ngữ cảnh để diễn tả:
	* Là khi 1 chương trình hay đoan script giả vờ như là 1 browser thu thập data của web, extract, và tìm kiếm web khác để làm thu thập tiếp.
	* Web Crawling data là như 1 cỗ máy tìm kiếm đi thu thập rà data trên mạng từ nơi này đến nơi khác như spider (chú ý về pháp lý).
	* 
* TCP/IP cung cấp pipes/sockets giữa các ứng dụng
* Người ta tạo ra protocol cho application để sử dụng các pipes này.
* HTTP là 1 giao thức powerful đơn giản.

=> Với sự hỗ trợ cho HTML, HTTP và socket, Python đã giúp đơn giản hóa quá trình gửi và nhận dữ liệu từ web chỉ với vài dòng code khi dùng lib ``urllib``. 