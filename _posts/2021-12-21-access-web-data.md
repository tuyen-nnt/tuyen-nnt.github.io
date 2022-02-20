---
layout: post
title:  "Làm được gì từ web data?"
author: tuyennnt
categories: [ Data ]
image: assets/images/web-data.png
---


Mở socket >> connect đến đường dẫn và port >> Tạo biến string cmd request GET, POST,... >> encode string cmd thành dạng byte >> gửi request đi.

Nhận response về từ thế giới bên ngoài (ngầm hiểu là UTF-8 >> decode response từ dạng byte thành dạng unicode.

![](/assets/images/unicode.png)  

*UTF-8 là bảng mã tham chiếu có thể detect được bảng mã ASCII hay UTF-8 (xét từ ASCII trước) mà allocate động kích thước của ký tự trong khoảng từ 1-4 bytes. Được recommend để dùng cho việc encode data giữa 2 hệ thống khác nhau.*


*Trong Python 3 thì tất cả kiểu dữ liệu string đều dùng bảng mã unicode. Còn Python 2 thì phân rõ 1 string bất kỳ đang được mã hóa thành kiểu dữ liệu là unicode hay string, còn byte và string thì giống nhau là kiểu string thôi.*


#### Beautiful soup (for HTML)
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


-------------------------------
### Data on Web

Việc trao đổi dữ liệu giữa 2 ứng dụng có network độc lập được support tốt khi sử dụng giao thức HTTP.
Vậy tiếp theo ta phải thống nhất dữ liệu ở format nào để mà trao đổi giữa 2 ứng dụng (ví dụ 2 app xài 2 ngôn ngữ khác nhau chẳng hạn). Có 2 format phổ biến là XML và JSON.

![](/assets/images/wire-protocol.png) 


#### XML
Dùng để share structure data giữa các system.

Gồm các thành phần cơ bản sau:
![](/assets/images/xml-basic.png) 

Các tag trong XML không quan trọng khoảng trắng như code, chỉ phân biệt khoảng trắng của text trong tag.

Serialization/De-serialization: là quá trình chuyển đổi data từ 1 system ra cấu trúc chung và chuyển đổi ngược lại để gửi cho system khác.

XML như 1 cái cây nhị phân.
![](/assets/images/xml-tree.png) 

XML cũng có cấu trúc đường dẫn như thư mục a/b/c sẽ lấy được data bất kỳ.

#### XML Schema 
Như một cái hợp đồng giữa 2 ứng dụng trao đổi kết nối với nhau. Schema sẽ check cú pháp của XML thỏa các điều kiện đã đặt ra ban đầu. Điều này giúp 2 ứng dụng không bàn cãi về lỗi do XML hay do bản thân của ứng dụng khiến kết nối bị lỗi. (Ta phải xác định lỗi và chặn đứng ngay thời điểm trao đổi dữ liệu.)
![](/assets/images/xml-schema.png) 
=> XML Schema được thiết lập để giải quyết những bất đồng giữa các ứng dụng hợp tác.
Đuôi file là ``.XSD``

* XML Validation: là hành động lấy từ XML Document và XML Schema Contract và gửi đến XML Validator.

![](/assets/images/xml-validation.png) 

#### Parsing XML
Có 2 xu hướng khi parsing đó là:
* Hành trình đi từ đầu cây đến cuối cây.
![](/assets/images/xml-parsing1.png) 

* Tạo ra list các cây rồi đi từ đầu cây đến cuối cây.
![](/assets/images/xml-parsing2.png) 

=> XML schema rất quan trọng, đặc biệt khi cây trở nên phức tạp và có ai đó chỉnh sửa XML không theo cú pháp quy định làm ảnh hưởng đến code parsing. Khi đó Schema sẽ là thứ hỗ trợ tốt việc phân định nguyên nhân gây lỗi khi parsing.


#### JSON 

Là định dạng phổ biến nhất hiện tại vì nó đơn giản, ánh xạ trực tiếp vào cấu trúc nội bộ của các ngôn ngữ lập trình. Nó gần với các kiểu dữ liệu lập trình nên thân thiện và dễ sử dụng. JSON sẽ không bao giờ thay đổi mà chỉ có cái khác thay thế nó thôi.

JSON là object literal notation in Javascript, được biểu diễn bằng kiểu dữ liệu "lists" và "dictionaries".

![](/assets/images/json.png) 


#### API
Là specification để chỉ ra pattern của URL, cú pháp của dữ liệu mà ta dự định gửi đi và cú pháp dữ liệu ta muốn nhận về.

Implementation của API là những người mà sử dụng API đó:
* Nhà sản xuất API: là người giữ data và tạo ra API sau đó xuất khẩu nó và định nghĩa, đưa ra luật lệ.
* Người dùng API: là người đọc document của nhà sản xuất, viết mã code và tuân thủ các quy tắc của nhà sản xuất đối với API đó.

API sẽ trả về định dạng JSON, sau đó chúng ta sẽ parse nó để phục vụ mục đích riêng.

![](/assets/images/api-parsing.png) 

*uh là handler, nó không thực sự kéo data về mà chỉ mới mở ra.*

*data có kiểu dữ liệu là Python unicode string*

*js là 1 Python dictionary (object) vì dùng hàm ``json.loads``*

#### Securing API request 
Nhà cung cấp API họ phải tốn nhiều nguồn lực để lưu trữ, nghiên cứu dữ liệu nên data được cung cấp bởi API thường rất có giá trị.

Nhà cung cấp thường giới hạn truy cập hoặc yêu cầu có API key, hoặc charge phí. Họ sẽ thay đổi rule của API khi mọi thứ phát triển hơn.

##### Authentification & authorization
Đọc documentation của API và nó sẽ nói bạn sẽ cần làm gì.

Dòng dưới đây execute phần authorization, ``twurl`` import từ file code tự viết ``twurl.py``:
![](/assets/images/twurl.png) 

Sau khi đọc data từ bên ngoài trở thành dạng string biểu diễn cho dictionary, để biết limit còn lại của việc pull data từ API của bên khác. Ta chỉ cần cast thành dict, đọc header và chỉ số ``x-rate-limit-remaining``.


OK, để setup authentication, ta cần tạo 1 file ở đây ví dụ là file hidden.py lấy trên trang web document API:
![](/assets/images/oauth.png) 

Để làm điều này ta đã phải sử dụng giao thức OAuth, thực tế là chúng ta đang ký tên lên URL. Kết quả trả về sẽ là URL + chữ ký trên URL.
![](/assets/images/twurl2.png) 
*import oauth là thư viện của Python*

Và đây là file main hoàn chỉnh:
![](/assets/images/twitter2.png) 

*json.dumps là hàm convert 1 Python dictionary (object) thành json string*
