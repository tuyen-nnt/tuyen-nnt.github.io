
Quy trình truy cập server:
- Liên hệ system add public key
- Truy cập VPN
- ssh user@ip 

* Generate ssh key mới : ssh-keygen
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



-----------

### Chọn cấu hình server phù hợp


Đặt câu hỏi: Chương trình có thể ăn tối đa bao nhiêu resource => chọn cấu hình server để đáp ứng hơn 20-30%, với critical hệ thống thì dư 50% resource


Dùng htop để xem chương trình chạy thử coi dùng bao nhiêu process
=> ko có cách nào estimate được memory, CPU thì estimate dựa trên số process của chương trình với đk chương trình ko đẻ thêm process :P
=> chỉ có cách limit cho memory và CPU thông qua docker (trên cmd) hoặc systemd (gọi systemctl status <tên chương trình> để bik thêm chi tiết)

Sau đó ``nano /lib/systemd/system/nginx.service`` sửa file ví dụ như thêm MemoryMax=bytes vào 

Sau đó phải chạy ``systemctl daemon-reload`` để load lại chương trình

Cuối cùng restart lại chương trình ``systemctl restart nginx``


https://www.freedesktop.org/software/systemd/man/systemd.resource-control.html

Nếu máy bị hết memory thì HDH sẽ dùng cơ chế OOM killer để kill ngẫu nhiên 1 chương trình đang chạy.

Hết RAM thì có thể tạo thêm swap xuống đĩa.


* Cú pháp ssh vào server:
```
ssh <tên account>@<địa chỉ IP>
```

* Các câu lệnh:

``htop``: xem các tiến trình đang chạy

``whoami`` : xem user hiện tại

``su - tuyennnt`` : dùng để chuyển từ user root sang user tuyennnt

 
``cat /etc/sudoers`` : dùng để xem danh sách các acc có quyền upgrade lên sudo hoặc gọi sudo

``sudo su``: upgrade lên sudo


* Tùy chương trình, nếu chương trình chạy ở port < 1024 thì phải run ở user ``root`` còn lại có thể run ở user thường.

``ps -aux | grep nginx`` : xem chương trình nginx đang chạy tốn bao nhiêu CPU, Memory, dưới user gì.