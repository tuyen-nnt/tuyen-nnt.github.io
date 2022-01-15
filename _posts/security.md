
* Lấy private key: ``cat ~/.ssh/id_rsa``

* Lấy public key: ``cat ~/.ssh/id_rsa.pub``

* Generate cặp key mới cho máy: ssh-keygen
Nếu muốn dùng thuật toán khác thì thêm ``-t <loại thuật toán tra cứu ở --help>``

* Lệnh truy cập server ssh ubuntu@3.0.175.170 

*Mặc định phải truy cập từ user ubuntu rồi ``sudo su`` để upgrade lên quyền giống root.*
 
ssh root@3.0.175.170
*Mặc định ko cho dùng user root để ssh vì để đảm bảo security*


* Truy cập server công ty cần user, ip và port:
``ssh tuyennnt@ssh.ep-eng.io -p 51889``


* Cấu hình ssh cho mỗi lần ssh chỉ cần dùng từ rút gọn là được: ``nano .ssh/config``
 
Ở ví dụ bên dưới là ``me.ep``:

```
Host *
    AddressFamily inet

Host me.ep
    Hostname ssh.ep-eng.io
    Port 61461
    #ProxyCommand /usr/bin/nc -X 5 -x 103.82.22.155:55142 %h %p
    User root
    IdentityFile ~/.ssh/id_rsa

```
=> sau đó chỉ cần ``ssh me.ep``


-----------------------
Các bước truy cập server EP:

* ssh -i tuyennnt.key -p 61461 tuyennnt@ssh.ep-eng.io

* sudo su
=> cat /home/tuyennnt/.ssh/authorized_keys > .ssh/authorized_keys

=> ``pwd`` phải là /root

=> cat .ssh/authorized_keys

=> exit 

* ``ssh -L 8080:127.0.0.1:80 -N -f root@ssh.ep-eng.io -p 61461 -i .ssh/id_rsa``

Thiết lập ssh tunnel. Ánh xạ port 80 của application lên port 8080 của máy chủ localhost.

Mở browser và truy cập thử xem kết quả: ``http://localhost:8080/``

* Optional: ``ssh me.ep`` vào chỉnh sửa nội dung Nginx nếu cần ``nano /var/www/html/index.nginx-debian.html``
