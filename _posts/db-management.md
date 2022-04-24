#### Key database metrics:

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
Cho thông tin chi tiết về locked process và process nào 
