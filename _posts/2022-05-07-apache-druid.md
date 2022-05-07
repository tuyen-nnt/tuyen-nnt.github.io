Apache Druid:
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

----------------
//Ngoài lề: https://www.youtube.com/watch?v=nfMANR13ZSA

Apache Flink: là framework để xử lý data.

- Use case:
	- Fraud Detection => realtime
	- Offer Recommendation based on browsing history => realtime

- Batch: Data at rest -> analysis on historical data
- Realtime: processing the event as and when it happens