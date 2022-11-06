##Hadoop

Gồm các thành phần chính: HDFS, MapReduce, YARN (yet another resource negotiator)

Các stage xử lý big data trong Hadoop ecosystem:
- Ingest Data 
- Storage (HDFS, HBase)
- Process & Analyze data (Hive)
- Access data (Hue)

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
	
```
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
