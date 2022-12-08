### Introduction

- gRPC là một interprocess communication technology, là một protocol để giao tiếp giữa các services.
- gRPC được phát triển dựa trên HTTP/2.
- gRPC đặc biệt cho phép client gọi, connect, thao tác cũng như debug các apps không đồng nhất nhau trở nên đơn giản như gọi 1 local function trong chương trịnh.
- Thường sử dụng gRPC để giao tiếp giữa các internal services vì nếu giao tiếp với external thì khó khăn hơn khi gRPC đòi hỏi phải define service interface từ đầu và generate ra code abstraction tương ứng để đơn giản hóa code trong service. Còn các external services thì muôn hình vạn trạng nên khó đáp ứng được.
- Chỉ nên sử dụng gRPC khi HTTP/1 không thể đáp ứng được nữa.

### How it works

- Việc đầu tiên khi phát triển gRPC service là phải define service interface trong file .proto chứa các thông tin như :
	- Method nào cho phép consumer gọi remotely.
	- Các params và message formats sẽ cần sử dụng khi gọi methods,...
	
- gRPC sử dụng ngôn ngữ IDL (Interface Definition Language) là 1 loại protocol buffer để define service interface.
- Sử dụng service definition sau khi compile & install chương trình, bạn sẽ nhận được code ở cả server-side và client-side:
	- Server-side code: giúp đơn giản hóa logic bằng cách cung cấp low-level communication abstraction.
	- Client-side code: giúp đơn giản hóa communication với server bằng cách ẩn đi low-level communication.
	- gRPC framework nằm ở bên dưới sẽ lo hết các phần như service contract, data serialization, network communication, access control, observability, etc.
