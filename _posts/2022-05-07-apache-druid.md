### Apache Druid:
cre:  https://druid.apache.org/

- Là một loại database
- Có các đặc điểm sau:
	- Real-time ingest data
	- Hiệu suất query nhanh
	- High uptime đảm bảo luôn đáp ứng được tính toán (quan trọng)

- Thường được sử dụng để:
	- Power cho GUIs
	- Các ứng dụng analytical
	- Là backend cho các highly-concurent APIs mà cần tính toán nhanh.

Thường sử dụng Druid cho những bài toán nào?

- BI/OLAP
- Clickstream analytics (web và mobile)
Đây là nơi chứa lượng data lớn như clicks, impressions, hoạt động view pages, add to card. Thông thường người ta sẽ tính toán lại các logic lấy được từ Google Analytics (được embedd vào web/mobile) về và kết hợp với sale data để cho ra các adhoc analysis phục vụ Biz.

- Risk/Fraud analysis
Khi đã có đủ dữ liệu thì tìm insight dễ dàng.

- Application performance metrics:
Lấy các chỉ số ví dụ như startup time, load pages từ hệ thống tracking về đưa vào Druid để monitor và alert realtime, giúp theo dõi và optimize hiệu năng của chương trình.

- Server metrics storage
- Supply chain analytics (manufacturing metrics)
- Application performance metrics
- Digital marketing/advertising analytics
- Network telemetry analytics (network performance monitoring)

Triển khai thử với Druid cần gì?

- 3 em VM (8cores mỗi em thôi)
- kiến trúc microservice của Druid bắt buộc phải có: ZooKeeper, Coordinator, Overlord, Historical, Broker, Middlemanager. 
- Khi số lượng node lên hàng chục hoặc hàng trăm thì phải cài đặt thông qua Ansible.



--------------------
#### So sánh giữa Druid và Spark:

##### Spark:
Spark là cluster computing framework được tạo ra dựa trên concept của Resilient Distributed Datasets (RDDs).

RDDs cho phép tái sử dụng lại dữ liệu bằng cách lưu trữ lại các kết quả trung gian trong memory và cho phép Spark cung cấp các tính toán nhanh cho các thuật toán hay lặp lại. => phù hợp nhiều cho Machine learning 

Tính tổng quan của Spark giúp nó phù hợp để làm sạch và transform dữ liệu.

Mặc dù Spark có khả năng truy vấn dữ liệu thông qua SparkSQL nhưng nó không phù hợp cho các tương tác query cần tốc độ nhanh trong vài giây.


##### Druid:
Thường được sử dụng để tăng tốc cho OLAP queries trong Spark.

Sứ mệnh của nó là tập trung chủ yếu giảm độ trễ queries xuống mức tối đa và là framework lý tưởng để tăng tốc cho ứng dụng được sử dụng bởi hàng ngàn user. Làm sao để mà user có thể tương tác và nhận được kết quả nhanh chóng nhất.

Druid index vào toàn bộ data và có thể làm lớp đứng giữa Spark và ứng dụng của bạn.

Ứng dụng cơ bản nhất người ta setup đó là dùng Spark để xử lý data và load data đã được xử lý vào Druid để có thể truy cập query nhanh chóng.


cre: https://druid.apache.org/docs/latest/comparisons/druid-vs-spark.html

Đọc thêm: https://www.linkedin.com/pulse/combining-druid-spark-interactive-flexible-analytics-scale-butani


-----------------

#### Hadoop là gì?

- Là Apache framework viết bằng Java cho phép phát triển ứng dụng phân tán có cường độ dữ liệu lớn miễn phí. Được thiết kế để mở rộng máy chủ đơn sang hàng ngàn máy tính khác có tính toán và lưu trữ cục bộ (local computation và storage).
=> Hadoop cung cấp môi trường để thực thi các Map-Reduce task.

- Hadoop có cấu trúc liên kết master-slave, chỉ có 1 node master hoạt động tại 1 thời điểm và nhiều node slave:
	- Node master có nhiệm vụ giao task cho các slave 
	- Node slave lưu trữ dữ liệu thực, thực tế thường không mạnh lắm.
	- Node slave lưu trữ metadata (thông tin của tất cả các node).

```
Có 2 loại file metadata:
FsImage: Là nơi lưu trữ trạng thái của các file system namespace (từ này hơi khó để dịch) kể từ khi namenode được khởi động.
EditLogs: Là nơi lưu lại quá sửa đổi của các file system.
```

- Kiến trúc Hadoop gồm có ba lớp chính đó là
	- HDFS (Hadoop Distributed File System)
	- Map-Reduce
	- Yarn


##### HDFS (Hadoop Distributed File System)

Là hệ thống phân tán cung cấp khả năng lưu trữ dữ liệu khổng lồ và tính năng giúp tối ưu việc sử dụng băng thông giữa các node.

Đặc biệt cho phép truy cập nhiều disk như là 1 disk. Nói cách khác là không bị giới hạn về dung lượng, nếu cần thêm chỉ cần thêm Node vào hệ thống là ok.

Có thể được sử dụng để chạy trên cluster lớn với hàng chục ngàn node.

Có kiến trúc Master-Slave với:
- NameNode chạy trên Master, có task quản lý Namespace (địa chỉ của file đó được chia và lưu trên các datanode nào) và điều chỉnh truy cập tệp của client cũng như điều khiển load-balancing cho các datanode.
- DataNode chạy trên các Slave, có task lưu trữ biz data thực tế.
Tìm hiểu thêm tại: https://phambinh.net/bai-viet/kien-truc-cua-hdfs/


![](/assets/images/hdfs1.png)

Một tập tin HDFS sẽ được chia làm nhiều block và được lưu trữ trong các DataNodes. Kích thước 1 block thường là 64MB và có thể thay đổi bằng việc cấu hình.


#### Map-Reduce
Là framework dùng để viết các application giúp xử lý song song lượng dữ liệu lớn có khả năng 




----------------
https://www.youtube.com/watch?v=nfMANR13ZSA

### Apache Flink: 
Là framework để xử lý data.

- Use case:
	- Fraud Detection => realtime
	- Offer Recommendation based on browsing history => realtime

- Batch: Data at rest -> analysis on historical data
- Realtime: processing the event as and when it happens

