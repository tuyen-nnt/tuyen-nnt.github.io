88 (máy mình):8888 (container)

muốn run docker cho chương trình như Shortlink (vì chạy 2 chương trình vừa mysql trên localhost vừa dùng image của app Shortlink đã build trước đó cùng lúc)  thì ta phải đưa nó ra 1 IP mà cả container và localhost đều dùng chung được.
=> Nếu không thì dùng docker-compose để binding ip trên container luôn. 


Xem danh sách các interface trên máy : 
``ifconfig | grep "inet " | awk '{print $2}'``
Cái này chuẩn hơn, ra được địa chỉ đường mạng luôn
ip addr | grep "inet " | awk '{print $2}'


[root@misp-kafka ~]# ip addr | grep "inet " | awk '{print $2}'
127.0.0.1/8
172.25.148.234/24
172.17.0.1/16


Để ý 172.17.0.1/16, Máy của mày sẽ mang địa chỉ 172.17.0.1

Cái bridge docker sẽ mang địa chỉ 172.17.0.2

-> Container sẽ mang địa chỉ từ 172.17.0.2 


Xem danh sách network:

[root@misp-kafka ~]# docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
b233c14dd8e5   bridge    bridge    local
cec155e22495   host      host      local
6054bac194ba   none      null      local

"IPv4Address": "172.17.0.2/16", máy host của mày IP là 172.17.0.2
-> Tức là IP dùng được từ 172.17.0.3 -> 172.17.255.254, cỡ 2^16 địa chỉ

-> IP có thể dùng được nằm trong dải 172.17.0.2/16
