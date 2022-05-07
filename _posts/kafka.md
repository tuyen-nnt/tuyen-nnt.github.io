Kafka cluster là cụm nhiều server tập trung để làm multi-task, nó chứa các Kafka broker (chính là 1 server độc lập).

Mỗi Kafka broker sẽ chứa một vài partition của Topic nhưng không nhất thiết có đủ tất cả topic.

Topic được lưu trữ trên đĩa, và tất cả sẽ được lưu trên server.

Khi tạo Topic với n partition, Kafka sẽ phân tán các partition ra các Kafka broker khác nhau để tránh bỏ trứng cùng 1 giỏ.

#### replication factor = n
Đây là cơ chế xử lý single-point failure.
Hoạt động = cách tạo ra n replicas (bản sao) cho mỗi partition được tạo ra.
Và các bản sao này sẽ được phân tán đến các broker còn lại.

Thường thì n sẽ <= số lượng broker.

-------------------------------
Kafka gồm Broker, Event Storage, Analytics & Search engine

Kafka được xem là 1 dedicated server gồm 1 hoặc nhiều Broker có nhiệm vụ nhận, lưu trữ, xử lý và phân phát các events. Broker được sync và quản lý bởi 1 
dedicated server khác gọi là Zookeeper.

Broker chứa 1 hoặc nhiều Topic. Có thể xem mỗi topic là 1 database chứa các events như log, metrics, transaction, etc.
Broker quản lý giúp lưu các events được produce/publish đưa vào các topic và phân phối events đến các consumer.

Kafka implement concept partitioning và replication
=> Topic partition & replication giúp cải thiện fault tolerence và throughput để mà việc publish và consume được diễn ra song song với nhiều broker cùng lúc.
=> Khi mà 1 broker bị down thì vẫn có thể làm việc với các các replicated topic ở broker khác.

Kafka CLI: "kafka-topics ..."
+ Là tập các kafka topic script files chờ để gọi
+ Giúp quản lý topic trong Kafka cluster và build event streaming pipeline
+ bootstrap-server để chỉ ra địa chỉ host:port của kafka cluser cần refer đến.

event key ví dụ như là user_id, application name, etc.


Kafka producer CLI: "kafka-console-producer ..."
+ event có cùng key sẽ được gửi đến cùng topic partition


Tương tác với Kafka cluster/server:
+ Sử dụng Kafka CLI, là tập hợp các script để giao tiếp với Kafka server
+ Sử dụng các API lập trình cấp cấp như Python, Java, Scala
=> With kafka-python, you can easily interact with your Kafka server such as managing topics, publish, and consume messages in Python programming language.
+ REST APIs như GET, POST, PUT
+ Các 3rd party client được tạo bởi Kafka community




