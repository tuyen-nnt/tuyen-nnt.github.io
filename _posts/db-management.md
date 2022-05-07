#### Key database metrics:
Dưới đây là 1 số chỉ số thường dùng để quản trị database. Còn nhiều chỉ số khác chúng ta không kể hết ở đây.

* Database throughput:
Là một trong các chỉ số quan trọng nhất.
Được đo bởi số lượng queries thực hiện mỗi giây.

* Database resource usage:
Được đo bởi usage của CPU, memory, log space và storage.
Được thể hiện bởi 2 chỉ số là: average / max / latest number và time series number.

* Database availibility:
Thể hiện dấu hiệu database up hay down nghĩa là available hay unavailable.
Đó là 1 chỉ số tổng hợp thể hiện historical data trong 1 khoảng thời gian theo một % nào đó.

* Database responsiveness:
Thể hiện hệ thống response cho inbound requests tốt ra sao và đây là chỉ số thường được sử dụng để đo database performance.
=> cho thông tin response time trung bình cho mỗi query của database.

* Database contention:
Cho biết có bất cứ tranh chấp nào giữa các connection không bằng cách measure lock-waits và concurent database connection.
Đây là chỉ số giúp ta biết được có chuyện gì xảy ra khi nhiều request truy cập resource database cùng 1 lúc.

* Unit of work:
Giúp track những transaction nào đang consume nhiều resource database nhất.

* Connection:
Thể hiện tất cả các thông tin của các network connection trên database management console.
Có thể chỉ ra liệu database server có thể fail vì những long-running queries hay là có quá nhiều connection đang mở.
Database connection là các network connection cho phép giao tiếp giữa clients và database software.

* Most-frequent queries:
Giúp track những câu query mà database server nhận được nhiều nhất, bao gồm frequency và avg latency - bao lâu để mà process câu này.
=> từ đó DBAs sẽ tìm cách optimize câu query.

* Locked objects:
Cho thông tin chi tiết về locked process và process nào đang làm dừng các trans đang truy cập object cùng 1 thời điểm.

* Stored procedure:
Thể hiện các metrics thực thi tính toán cho procedures, external procedures, compiled hoặc external functions, compiled trigger và các block ẩn danh invoked kể từ khi database kích hoạt.

* Buffer pools:
Track sử dụng của buffer pools và table spaces.
Thư mục server sử dụng buffer pools để lưu cached data và cải thiện perfomance của database.

* Top consumers:
Show top consumers của system resources và giúp DBAs plan và sắp xếp resource hiệu quả hơn.


Các tool 3rd party để monitor:
* pganalyze (PostgreSQL)
* PRTG Network Monitor (PostgreSQL, MySQL, SQL, Server, Oracle)
* SolarWinds DB Performance Analyzer
* Quest Foglight for DBs.
* Datadog (db, system, and app monitoring)

-------------------
#### Database Optimization
RDBMSs có các command optimize:

* Mysql có ``OPTIMIZE TABLE`` với cú pháp OPTIMIZE TABLE table1, table2, table3;
=> tổ chức lại storage vật lý của table data và gắn kết index để giảm storage space và cải thiện efficiency.
=> cần có quyền privilege SELECT và INSERT để thực thi command này.
=> Có thể optimize được 3 table cùng 1 operation.
=> Hoặc bạn có thể sử dụng graphical tool ``phpMyAdmin`` để làm việc này.

* PostgreSQL có ``VACUUM`` và ``REINDEX``
