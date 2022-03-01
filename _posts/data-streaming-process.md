### Quy trình build hệ thống data streaming in production:

Có 3 cách:
- Lenses -> all in one
- Docker: Debezium nó cung cấp cho mình đầy đủ docker luôn
- Cài thủ công Zookeeper, Kafka, Kafka Connect + source/sink plugin

Here’s a diagram that shows how the data is flowing through our distributed system. First, the Debezium MySQL connector is continuously capturing the changes from the MySQL database, and sending the changes for each table to separate Kafka topics. Then, the Confluent JDBC sink connector is continuously reading those topics and writing the events into the PostgreSQL database. And, at the same time, the Confluent Elasticsearch connector is continuously reading those same topics and writing the events into Elasticsearch.

![](/assets/images/debezium.png)

* Bước 1: Xác định source data để streaming

* Bước 2: Start Zookeeper & Kafka sử dụng Docker

Lưu ý: 

1) Chạy riêng từng container để đảm bảo performance,... 

2) Khi chạy trên prod:
```
In a production environment, you would run multiple instances of each service to provide performance, reliability, replication, and fault tolerance. Typically, you would either deploy these services on a platform like OpenShift or Kubernetes that manages multiple Docker containers running on multiple hosts and machines, or you would install on dedicated hardware.
```
3) Các containers ZooKeeper và Kafka dễ tàn vì nó lưu data trên local.
=> Khi chạy docker cần phải setup ``volume`` để mount directory. Để khi mà shut-down thì data container sẽ mất hết và vẫn còn lại data ở directory trên local. 
```
ZooKeeper and Kafka would typically store their data locally inside the containers, which would require you to mount directories on the host machine as volumes. That way, when the containers are stopped, the persisted data remains.
```

* Bước 3: Start Kafka connect (Debezium)
https://debezium.io/documentation/reference/1.8/tutorial.html

* Bước 4: Deploy/Đăng ký Debezium connector (source connector)
Connector này sẽ monitor Mysql's binlog file. Khi file này có sự thay đổi thì connector sẽ capture lại và tổng hợp lại thành event ghi vào Kafka topics.
Mặc định topics sẽ là tên của table trên database Mysql.

```
In a production environment, you would typically either use the Kafka tools to manually create the necessary topics, including specifying the number of replicas, or you’d use the Kafka Connect mechanism for customizing the settings of auto-created topics. 
```
* Bước 5: Start Kafka connect Elasticsearch
Chọn package muốn tải về: https://packages.confluent.io/maven/io/confluent/kafka-connect-elasticsearch/11.1.3/

Hoặc tải file zip này về:
https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-elasticsearch/versions/11.1.3/confluentinc-kafka-connect-elasticsearch-11.1.3.zip

Xong bỏ vào thư mục lib.




#### Test consuming & sending data to elasticsearch
https://sematext.com/blog/kafka-connect-elasticsearch-how-to/

Tham khảo Bảo hướng dẫn: https://baonq5.notion.site/CDC-1f5ed95d7f1044c39f4e2731d8276caf