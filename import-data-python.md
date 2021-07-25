
#### 1. Import + Load + Tạo HTTP/GET REQUEST
* Lưu file mềm xuống local:
``urlretrieve(url, 'filename.csv')``

Trước tiên phải ``from urllib.request import urlretrieve``


* Mở và đọc file mềm trên web:
``
df = pd.read_csv(url, sep=';')
``
* Show các dòng đầu tiên của df:
``
print(df.head())
``

* URL (Uniform/Universal Resource Locator)
phần lớn là các địa chỉ web, ngoài ra còn là FTP (file transfer protocol)


URL gồm 2 phần:

* Protocol Identifier : http hoặc https
* Tên resource: datacamp.com
=> tạo thành 1 địa chỉ web

* HTTP (HyperText Transfer Protocol)
Là protocol ứng dụng cho các hệ thống thông tin phân tán, cộng tác và siêu phương tiện, nền tảng giao tiếp dữ liệu cho WWW.
HTTPS - có độ an toàn bảo mật cao hơn HTTP

* Mỗi khi truy cập vào 1 trang web nghĩa là bạn đang gửi 1 HTTP request cho 1 server. Request này được gọi là GET request, đây là loại request phổ biến nhất.

> urlretrieve : gửi GET request và lưu dữ liệu xuống local máy

* HTML (HyperText Markup Language)

#### 2. Các cách gửi GET request:

* **Cách 1**: sử dụng ``urllib.request``
=> ``from urllib.request import urlopen, Request``

Một số functions của package ``urllib.request``

* ``request = Request(url)`` : đóng gói GET request
* ``response = urlopen(request)`` : 
gửi request và catch phản hồi => trả về HTTP response object có tích hợp method read() và close()
* ``html = response.read()`` : trả về HTML định dạng string
* ``response.close()``: dùng xong nhớ đóng lại

* **Cách 2**: rất phổ biến, sử dụng package ``requests``

Cho phép gửi HTTP request có tổ chức mà ko cần làm thủ công 

requests.get(url) : sau khi import package requests, hàm request.get() sẽ đóng gói request thông qua url, gửi request đi và nhận lại phản hồi và lưu vào biến r.
> Ở đây hàm ``request.get()`` sẽ làm nhiệm vụ của ``Request(url)`` và ``urlopen(request đã đóng gói)``của cách 1

r.text : r là biến lưu response của hàm trên, sử dụng method .text cho response để chuyển HTML của url sang dạng string. 

#### 3. Scraping web trong Python

HTML là sự kết hợp của data có cấu trúc và không cấu trúc.

* Function ``BeautifulSoup`` có tác dụng parse và trích xuất data từ HTML, và làm cho các tag được biểu diễn đẹp hơn.

Cách sử dụng: 
``from bs4 import BeautifulSoup``

Sau khi gửi nhận phản hồi của GET request, ta được file html như trên.

Sau đó, ta dùng hàm ``BeautifulSoup`` để extract các data có cấu trúc của file html, lưu kết quả vào một biến mới. Kết quả của hàm ``BeautifulSoup``có tích hợp hàm prettify() để làm đẹp kết quả.

```soup = BeautifulSoup(html_doc)
print(soup.prettify())
```
