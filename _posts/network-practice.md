 ![](/assets/images/diagram-network.jpg)
 
Từ 1 link, để tra xem ta có thể truy cập được nó hay không, ta dựa trên mô hình network OSI (mô hình chuẩn) hoặc 5-layer (thường dùng trong phần mềm):
 
 
  ![](/assets/images/five-layer-network.png)
 
 
 Ví dụ: https://tuyennnt-tuyen-postgres-pg.ep-eng.io
 
 Để từ 1 server đưa dữ liệu đến máy của bạn (vật lý) thì cần đi qua 5 tầng, chuẩn hơn thì 7 tầng.
 
 
 * Tầng 5: Xác định giao thức là ``HTTPS`` suy ra app dùng port 443.
 * Tầng 4: Đã có port là 443 dựa vào giao thức http.
 
* Tầng 3: cần IP, và để phân giải domain thành IP cần DNS server.
```
dig @1.1.1.1 <link không bao gồm http>
```
Dùng DNS public server 1.1.1.1 để tra cứu xem link đó đã được authorize chưa. 
Nếu chưa (không thấy ``ANSWER SECTION`` thì khả năng là chưa được cấp IP hoặc vì lí do gì đó.

=> Bị stuck ở khúc này

* Tiếp theo, ta sẽ tìm cách khác đó là tra trên EP platform thì thấy địa chỉ IP của app chạy chương trình postgres là ở 103.160.6.85. Ứng dụng https thì port 443. Vậy là đã có đủ IP+port.

Nếu thử truy cập trên browser = IP+port trên thì ta vẫn sẽ không vào được vì để truy cập phải thông qua server của ISO :) 

* Ta dùng kỹ thuật tunnel để nối port 443 của máy localhost thông qua app ``ssh`` của localhost nối với server ảo tuyennnt đã tạo resource trên EP platform (IP: 172.25.148.178:22), resource này sẽ dùng app ``sshd`` khác với ``ssh`` vì là server để quản trị truy cập server.
``sshd`` sẽ giúp quản trị port, trong đó port 8443 được tạo để nối với máy tính localhost:443 của ta thông qua lệnh:

Note: Trước khi đi đến được resource tuyennnt, ta phải đi ngang qua ``ssh.ep-eng.io:61461`` (server của ISO), điều này là bắt buộc theo policy của ISO để kiểm tra security.

```
sudo ssh -L 443:127.0.0.1:8443 -N -f root@ssh.ep-eng.io -p 61461 -i .ssh/id_rsa
```
=> Xem cục ở giữa hình.

* Cuối cùng ta sẽ đi nối resource tuyennnt trên server ảo với port 8443 với địa chỉ đang chạy app postgres là 103.160.6.85:443 bằng cách dùng ``socat``.

```
socat TCP-LISTEN:8443, fork TCP:103.160.6.85:443
```

* Tiếp theo, define domain ứng với localhost máy mình để mở domain trên browser thì nó sẽ chạy ứng dụng đã tunnel đến localhost máy mình:
```
sudo nano /etc/hosts
Điền vô cuối file: 127.0.0.1 tuyennnt-tuyen-postgres-pg.ep-eng.io
```


* Done, bây giờ ta đã có thể truy cập link https://tuyennnt-tuyen-postgres-pg.ep-eng.io để truy cập ứng dụng rồi!!

Lưu ý: Không truy cập localhost:443 được vì server nó đang cung cấp service cho domain chứ không phải cho localhost:443. Nên buộc phải nhập domain trên browser, rồi máy sẽ tunnel qua.


#### Một số cmd test network:

* ``sudo kill - 9 <PID> ``: Xóa chương trình đang chạy ở port có pid=PID (trường hợp trùng port,...)
 
* ``sudo netstat -plunt`` hoặc ``htop``: kiểm tra pid của chương trình đang chạy port mà ta cần tìm

* ``telnet <host> <port>`` : kiểm tra xem chương trình có hoạt động không.
Kết quả như vầy là active: 
```
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
```




