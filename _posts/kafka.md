Kafka cluster là cụm nhiều server tập trung để làm multi-task, nó chứa các Kafka broker (chính là 1 server độc lập).

Mỗi Kafka broker sẽ chứa một vài partition của Topic nhưng không nhất thiết có đủ tất cả topic.

Topic được lưu trữ trên đĩa, và tất cả sẽ được lưu trên server.

Khi tạo Topic với n partition, Kafka sẽ phân tán các partition ra các Kafka broker khác nhau để tránh bỏ trứng cùng 1 giỏ.

#### replication factor = n
Đây là cơ chế xử lý single-point failure.
Hoạt động = cách tạo ra n replicas (bản sao) cho mỗi partition được tạo ra.
Và các bản sao này sẽ được phân tán đến các broker còn lại.

Thường thì n sẽ <= số lượng broker.

