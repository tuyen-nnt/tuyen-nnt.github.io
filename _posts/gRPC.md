### 1. Introduction

- gRPC là một interprocess communication technology, là một protocol để giao tiếp giữa các services.
- gRPC được phát triển dựa trên HTTP/2.
- Chữ ``g`` để phân biệt với các version khác của RPC, đây là version mới và hiện đại hơn các version trước.
- gRPC đặc biệt cho phép client gọi, connect, thao tác cũng như debug các apps không đồng nhất nhau trở nên đơn giản như gọi 1 local function trong chương trịnh.
- Thường sử dụng gRPC để giao tiếp giữa các internal services trong microservice architecture vì nếu giao tiếp với external thì sẽ khó khăn hơn khi gRPC đòi hỏi phải define service interface từ đầu và generate ra code abstraction tương ứng để đơn giản hóa code trong service. Còn các external services thì muôn hình vạn trạng nên khó đáp ứng được, tuy nhiên với sự xuất hiện của gRPC gateway thì phần này có thể xử lý được.
- Chỉ nên sử dụng gRPC khi HTTP/1 không thể đáp ứng được yêu cầu nữa.

### 2. How it works

- Việc đầu tiên khi phát triển gRPC service là phải define service interface trong file .proto chứa các thông tin như :
	- Method nào cho phép consumer gọi remotely.
	- Các params và message formats sẽ cần sử dụng khi gọi methods,...
	
- gRPC sử dụng ngôn ngữ IDL (Interface Definition Language) là 1 loại protocol buffer để define service interface.
- Sử dụng service definition sau khi compile & install chương trình, bạn sẽ nhận được code ở cả server-side và client-side:
	- Server-side code: giúp đơn giản hóa logic bằng cách cung cấp low-level communication abstraction.
	- Client-side code: giúp đơn giản hóa communication với server bằng cách ẩn đi low-level communication.
	- gRPC framework nằm ở bên dưới sẽ lo hết các phần như service contract, data serialization, network communication, authentication, access control, observability, etc.

- Network communication giữa client và server sẽ diễn ra thông qua giao thức HTTP/2.

#### a. Service Definition

- gRPC dùng protocol buffer như là IDL để define service interface trong file .proto.
- Protocol buffer là cơ chế data serialization cho structured data.
- ``service`` là tập hợp các methods có thể gọi remotely, có input parameter và return type.
- Giải nghĩa một số phần chính trong file proto:
	- ``syntax="proto3"``: đây là câu đầu tiên trong file proto, chỉ định version của protocol buffer.
	- ``package=ecomerce`` : tên package giúp ngăn chặn việc xung đột tên giữa các protocol message type và được sử dụng để generate code
	-  ``service ProductInfo { rpc addProduct(Product) returns (ProductID)};`` : đây là ví dụ định nghĩa service của bạn, addProduct là remote method để thêm product vào hệ thống và trả về product ID là response cho bên request.
	- ``message Product {string id = 1; string name = 2;}`` : đây là ví dụ cho việc define message format/type - là parameter/return type cho service. Các field được định nghĩa dưới dạng các cặp key-value với 1 con số độc nhất để nhận dạng nó trong message binary format khi truyền tải giao tiếp đến các service khác.

#### b. gRPC Server
- Sử dụng ``protoc`` là 1 protocol buffer compiler để generate server/client code.
- Server side sẽ implement cái service definition và chạy gRPC server để xử lý các cuộc gọi từ client side.
	1. Implement service logic của cái service skeleton (server-side code) bằng cách override service base class.
	2. Run gRPC server để listen request từ client và trả về kết quả. gRPC server sẽ gửi các request đến chỗ service implementation để xử lý request và trả response.
Với Go, trong phần code gRPC server đầu tiên ta sẽ mở TCP port, start gRPC server rồi register service với server đó.

#### c. gRPC Client
- Đầu tiên dùng protoc để generate client stub (client-side code)
- Client stub cung cấp các method giống với bên server, method này client code có thể gọi được.
- Client stub sẽ giúp dịch các cuộc gọi local thành các cuộc gọi remote đưa sang server side. Cụ thể, trong phần implementation của client side thì sẽ bao gồm việc setup connection với remote server, khởi tạo blocking stub đính kèm stub với connection đó và dùng client stub để gọi remote method.

#### d. Client-Server Message Flow

- Khi gRPC client gọi gRPC service, thư viện gRPC ở client-side sử dụng protocol buffer để marshal (đóng gói thông tin request hay còn gọi là message packet) và gửi qua network thông qua giao thức HTTP/2.

- Ở phía server-side, request sẽ được unmarshal và lời gọi sẽ được thực thi sử bằng protocol buffer.


### Tại sao dùng gRPC?
- Khả năng scale lớn, xử lý đồng thời nhiều request vì được build dựa trên HTTP/2.

#### Ưu thế
- Hiệu quả cho inter-process communication vì nó không dùng textual format mà dùng protocol buffer - based binary protocal để trao đổi giữa client và server. gRPC implement protocol buffer dựa trên HTTP/2 nên sẽ nhanh hơn các giao thức khác.
- Có service interface và schema được define rõ ràng, đơn giản.
- Polyglot - được thiết kế để hỗ trợ nhiều ngôn ngữ.
- Duplex streaming - có thể đọc ghi cùng lục
- Có nhiều tổ hợp features như authentication, encryption, resiliency (deadline & timeout), metadata exchange, compression, load balancing, service discovery,...
- Được tích hợp với cloud native systems và được support mạnh mẽ bởi các projects về cloud native vì gRPC thuộc tổ chức CNCF.
- Đang được phát triển và được sử dụng rộng rãi, được test bởi Google và nhiều công ty lớn khác.


#### Bất lợi 

- Chưa thực sự phù hợp cho các external services vì nó được contract-driven không thay đổi cấu trúc service nên sẽ cản trở sự linh hoạt của các service bên ngoài hệ thống.
- Các thay đổi về service definition dễ ảnh hưởng đến quá trình development vì thường phải regenerate code khi file proto có thay đổi. Tuy nhiên hầu hết các thay đổi trên service definition không ảnh hưởng đến service contract thì gRPC vẫn chấp nhận thích nghi và tương tác như 1 phiên bản proto khác thì không cần phải generate lại code.
- Hệ sinh thái gRPC khá nhỏ không bằng REST hay HTTP. Các hỗ trợ cho gRPC trên browser và mobile app vẫn còn ở giai đoạn sơ khại


