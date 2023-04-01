##Hadoop

Là open-source framework được sử dụng để xử lý dataset lớn.

![](/assets/images/hadoop-common.png)


Gồm các thành phần chính: HDFS, MapReduce, YARN (yet another resource negotiator)

Các stage xử lý big data trong Hadoop ecosystem:
- Ingest Data 
- Storage (HDFS, HBase)
- Process & Analyze data (Hive)
- Access data (Hue)

Những hạn chế của Hadoop:
- Xử lý transaction data vì không hỗ trợ tốt random access.
- Các job khi không thể xử lý parallel.
- Có dependency trong data, data này phụ thuộc vào data kia phải process trước sau.
- Khi muốn access data với độ trễ thấp.
- Xử lý nhiều file nhỏ.
- Tính toán chuyên sâu với data nhỏ. => Hive (hỗ trợ HiveQL và các function thống kê) hay Pig tool (multi query approach, giảm số lần scan data) ra đời để giải quyết bài toán này.

### MapReduce

- Là programming model sử dụng trong Hadoop để xử lý Big data.
- Là processing technique (kỹ thuật xử lý) dành cho distributed computing.
- Là một framework được sử dụng trong parallel computing.
 *Distributed computing là hệ thống với các component được đặt ở các machine khác nhau trao đổi các actions trong cùng 1 view đến với end user.
- Bao gồm Map task và Reduce task.
- Có thể code được trên nhiều ngôn ngữ lập trình như Java, C++, Python, Ruby, R.

![](/assets/images/map-reduce-working.png)

- Input là HDFS file được chia thành các chunks (block)
- Shuffle là quá trình ở giữa Map và Reduce giúp collect các key giống nhau ở các block file được chia ra xuất hiện trong quá trình Map.
- Output sẽ ghi vào HDFS.

- Các use case:
![](/assets/images/map-reduce-use-case.png)

- Tại sao nên sử dụng MapReduce?
	- MapReduce cho phép tính toán dạng parallel computing trên nhiều node.
	- Chia task => run taskin parallel => done
	- Flexible cho nhiều data types - xử lý được data dạng tabular và non tabular như videos
	- Hỗ trợ nhiều ngôn ngữ
	- Cung cấp platform để phân tích data và data warehouseing.
	- Apply được cho nhiều industries như social media, entertainment, etc.

### HDFS concept

#### Block

Block là minimum size của file.

- Khi HDFS nhận files, nó giã data thành các chunk gọi là blocks.
- Block được lưu ở các data node, có thể khác nhau.
- Cung cấp khả năng fault tolerance
- Size mặc định là 64 hoặc 128MBs tùy vào cấu hình của bạn
![](/assets/images/block-hdfs.png)

#### Node

Có 2 loại là NameNode (primary node) và DataNode (secondary node).

NameNode sẽ quản lý task nhận được từ client và assign cho DataNode.

DataNode là nơi lưu dữ liệu, là worker trực tiếp thực thi task (vd đọc ghi data) theo hướng dẫn của NameNode ở config và báo cáo về cho NameNode định kỳ mặc định 3s 1 lần.

#### Rack Awareness

*Rack là tập hợp 40-50 datanodes sử dụng cùng network switch.
- 1 rack chuẩn là 42U, 1U = 1.75in.
- 1 rack là 1 mớ server xếp chồng lên nhau.
=> Để nối đống đó lại sẽ cần 2 switch (1 cái dự phòng, hư cái này còn cái kia), thực tế chỉ dùng 1 cái để đỡ tốn chi phí.Tùy số lượng port, tốc độ mỗi port, hiệu năng của switch,... mà giá khác nhau.

- NameNode sẽ chọn những data nodes nào trong cùng rack hoặc ở gần nó nhất (trong số các node có data cần tìm) để tăng performance.
- Cải thiện performance cho cluster khi giảm được network traffic.
- NameNode lưu giữ metadata trong đó có thông tin Rack ID.
- Replication cũng được thực thi thông qua rack awareness, nó giúp đảm bảo các replicas của dữ liệu nằm ở các rack khác nhau => reliable, available & network bandwidth được tận dụng.

#### Replication

- Tạo ra các bản copy của data.
- Được tạo ra cho mục đích backup.
- Replication factor: số lần data block được copy ra.
![](/assets/images/replica-hdfs.png)

#### Read & Write Operations

- Write once read many => không thể edit file mà chỉ có thể thêm hoặc overwrite file.
	- Read:
	Client gửi request đến primary node để lấy location của data nodes gần nhất chứa blocks thông qua FS Data input stream object bằng method read().
	Sau khi nhận request thì primary node sẽ kiểm tra xem client có được quyền để read hay không thì mới gửi location của data node.
	Sau khi đọc xong thì client sẽ sử dụng close() method để end session.
	
```
Client gửi request nhờ name node gửi vị trí data node => name node verify và trả về vị trí data node chứa block data client cần => client dùng FS data input stream object bằng hàm read để yêu cầu data node gần nhất đọc tất cả các file => client dùng hàm close để đóng session.
```

- Write:
	Data node xác nhận là client có quyền để ghi.
	Name node đảm bảo là file được ghi chưa có trên hệ thống, nếu không sẽ gửi client IO Exception.
	Nếu file chưa tồn tại trên hệ thống, client sẽ được cấp quyền ghi files.
	Client ghi file xong thì data node bắt đầu tạo replicas và gửi xác nhận lại cho client
	

Client gửi request write data => Name node verify quyền write của client & file đó chưa tồn tại trên hệ thống => nếu verify ok, client bắt đầu ghi data => Data node bắt đầu tạo replicas và gửi confirmation lại cho client

#### HDFS Architecture

![](/assets/images/architecture-hdfs.png)

Name Node giám sát việc đóng mở, rename, mapping file blocks với data node.

Data Node quản lý việc đọc ghi, tạo file, replication và deletion các block dựa trên hướng dẫn từ Name Node

Key benefit của HDFS:
- Scalability
- Data storage expansion
- Data replication capabilities


## Hive

Là datawarehouse software thuộc Hadoop được thiết kế để đọc, ghi, quản lý dataset kiểu tabular và phân tích data.
Hive sử dụng HiveQL để truy vấn data. Hive hỗ trợ clean và filter data theo yêu cầu của người dùng.

Hive hỗ trợ các loại file: sequence files gồm các cặp key-value, record columnar files, file text hoặc flat files.


![](/assets/images/hive-architecture.png)

Hive cấu trúc gồm 1 số components quan trọng:
- Hive Client - JDBC/ODBC Driver: driver dành cho ứng dụng muốn kết nối đến Hive
- Hive Services: là nơi xử lý queries.
	* Hive server: là hạ tầng chạy queries cho phép các client gửi nhiều request, được build để support JDBC/ODBC. client.
	* Command Line Interface: là nơi nhận input request và gửi đến driver xử lý yêu cầu.
	* Hive Web Interface: giao diện query
	* Driver: nhận câu query gửi từ command line và gửi đến compiler sau khi init session.
		* Optimizer: nhận execution plan để phân tích và tách các task ra hiệu quả để tăng tốc độ và performance.
		* Excutor: thực thi các task sau khi optimize tách task xong.

- Hive Storage and Computing: nơi lưu trữ metadata và dữ liệu cần query.
	* Metastore: chỉ nơi lưu trữ metadata của các table và có nhiệm vụ đặt nó ở 1 ví trí trung tâm.
	* Database: nơi lưu metadata.
	* Hadoop cluster: nơi lưu data cần query (HDFS)



##### So sánh Hive và RDBMS:
![](/assets/images/hive-rdbms.png)

##### HBase

- HBase architecture bao gồm HMaster, Region servers, Region, Zookeeper và HDFS.
- Được chạy trên hạ tầng HDFS, HBase là column-oriented non-relational database, lưu dữ liệu dưới dạng bảng có cột dòng.
- HBase column được định nghĩa bởi column families.
- Điểm chú ý nhất ở chỗ HBase khác HDFS khi nó có thể thay đổi data đã lưu còn HDFS thì không.  
- HBase phù hợp để đọc và ghi dữ liệu random trên HDFS.
- Minimum size là các regions (khái niệm giống data blocks trong HDFS).

![](/assets/images/hbase-architecture.png)


## Spark Architecture

![](/assets/images/spark-architecture.png)

- Spark architecture có Driver và Executor processes, phối hợp bằng Spark Context bên trong Driver và cluster manager để cấp resource cho cluster chạy task.

	- Driver Program là 1 process độc lập có nhiệm vụ tạo ra jobs, Spark Context tách job ra thành các task để chạy parallel trong Executor trên Cluster.
	- Executors là nhiều các processes độc lập trên cluster thực thi các task in parallel. Executor được cấu hình thông qua số lượng worker node tùy nhu cầu.
	- Spark Context có nhiệm vụ giao tiếp giữa Driver và Cluster manager cho mỗi Spark application. DF hay RDD được tạo trong context nào thì sẽ gắn với context đó suốt life cycle của context và context luôn phải được đảm bảo active trong quá trình sử dụng.
	![](/assets/images/spark-context.png)
	- Spark job là các computations có thể được thực thi parallel và được Spark context chia ra làm các task nhỏ hơn.
	![](/assets/images/spark-job.png)

	- Spark task được thực thi trên các partitions của data và hoạt động parallel với nhau.
	![](/assets/images/spark-task.png)

	- Spark Executor - Worker node là một cluster node trong cluster tung ra executor processes để chạy task mà nó đảm nhận. Bên trong worker node chứa Executor được cấp 1 số lượng core (theo cấu hình) và mỗi core sẽ chạy riêng lẻ 1 task tại 1 thời điểm cho đến khi tất cả core được sử dụng hết thì task khác sẽ phải đợi resource.
	![](/assets/images/spark-executor.png)
		- Nhìn chung thì nếu ta tăng số lượng executor trong config hoặc số core cấp cho worker node (executor) thì sẽ tăng cluster parallelism (tính đồng thời/song song của cluster).
		- Sau khi finish 1 task thì executor sẽ gửi kết quả vào RDD partition mới hoặc transfer nó lại cho driver.
		- Ta nên config giới hạn Executor với x core trên 1 node trên tổng số core available mà node đó có. Ví dụ 1 worker node có 8 cores có thể có 1 executor processe sử dụng đến 8 cores tùy ta giới hạn bao nhiêu.
	

- Stage là tập hợp các task trong 1 job có thể được thực hiện và hoàn thành tại cùng 1 partition. Nếu stage phụ thuộc vào 1 stage khác thì quá trình shuffle diễn ra.

- Shuffle thì costly bởi nó đòi hỏi phải data serialization, disk và network I/O. Shuffle là cần thiết nếu có 1 operation nào đó cần data ở bên ngoài stage (khác partition hiện tại).

- Driver có thể chạy trên Client Mode (Driver ở bên ngoài kết nối với Cluster) hoặc Cluster Mode (chạy Driver trên 1 worker trong cluster).

- Cluster manager: giao tiếp giữa Driver và Cluster để cung cấp resource cho executor trên cluster và phân bổ nhiệm vụ cho cluster.


### Spark cluster modes

- Spark Standalone : có sẵn trong Spark installation nên không cần deploy dependencies, phù hợp cho setup đơn giản.
Thành phần gồm Master và Worker, khi setup không được dành tất cả resource cho worker vì master cũng sử dụng resource trong cùng cluster.
	![](/assets/images/spark-standalone.png)
	- Cách setup:
	![](/assets/images/spark-standalone-setup.png)


- Apache Hadoop YARN : đây là cluster manager cho Hadoop project.
	- Hỗ trợ nhiều big data ecosystem framework.
	- Cần configuration và setup riêng.
	- Cần setup thêm dependencies.
	![](/assets/images/spark-yarn.png)

- Apache Mesos : general-purpose cluster manager với 1 số benefit thêm.
- Kubernetes : open-source chạy chương trình trên docker container.
  	![](/assets/images/spark-k8s-setup.png)

- Local mode: không connect đến cluster, thường dùng để test hoặc debug app, tuy nhiên nó dùng chung process với spark-submit và dùng threads để execute task.
	![](/assets/images/spark-local-setup.png)

### Spark submit

Hoạt động như sau:
- Parse command line arguments/options.
- Đọc các thông tin bổ sung được nêu trong 'conf/spark-defaults.conf'.
- Kết nối đến cluster manager được nêu ở --master argument hoặc chạy trên local mode
- Truyền application (JARs hoặc Python files) và bất cứ file nào được chỉ định phân tán và chạy trên cluster.

![](/assets/images/spark-submit-option.png)
