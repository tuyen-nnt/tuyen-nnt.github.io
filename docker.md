RUN UBUNTU 

docker  run ubuntu
 //nếu chưa pull ubuntu image về thì sẽ pull rồi start, còn nếu pull rồi thì nó sẽ start container này luôn 
 => nếu khi start mà thấy chưa có interact gì thì nó sẽ stop container lại luôn
 
 docker ps
 //xem list các tiến trình đang chạy của container hoặc các container đang chạy 
 
 docker ps -a
 //xem các container đã dừng lại
 
 docker run -it ubuntu
 // start container với interaction mode và load ubuntu image lên trong cái container này
 
 Các câu lệnh:
 history
 !2 //để output cmd thứ 2 trong list history
 ls -1 
 //líst ds theo dạng dọc
 
 ls -l 
 //list ds chi tiet
 
 touch <tên file>
 //lệnh tạo file
 
 mkdir <tên thư mục>
 //lệnh tạo thư mục
 
 mv <tên file hoặc địa chỉ> <tên file hoặc địa chỉ>
 //đổi tên hoặc di chuyển
 
 cat <tên file>
 
 more <tên file hoặc địa chỉ>
 //xem nội dung theo từng page, bấm phím space để qua trang tiếp theo nhưng ko scroll up lên được, nhấn enter để chạy từng line để xem
 
 less <tên file hoặc địa chỉ>
 //

cat <tên file> > <tên file khác>
//copy nội dung file này vào file khác

cat <tên file> <tên file khác> > <tên combined file>
//combine nội dung 2 file vào file khác

dấu ``>`` áp dụng cho hầu hết các câu lệnh
vd: echo hello > hello.txt
ls -l /etc > hello.txt
sẽ cho kết quả ra file hello.txt trên.


 Trong Linux, mọi thứ đều ở duới dangj file, từ process, devices, hoặc địa chỉ thư mục đều là files
 
 Cấu trúc Linux:
 - /
 + bin: chưa các file binaries, chương trình
 + boot: các file liên quan booting
 + dev: devices
 + etc: editable text configuration, chứa file config
 + home: thư mục của user
 + root: chỉ có root mới vào được thư mục này
 + lib: libary files như software library dependencies 
 + var: như biến, chứa các file được update thường xuyên như log,...
 + proc: chứa các tiến trình đang running
 
 -------------------
 
 CÁC BƯỚC ĐỂ SỬ DỤNG DOCKER
 Cài đặc Docker
 Tạo 1 program và Tạo file plain text Dockerfile ghi hướng dẫn để đưa cho docker đóng gói ứng dụng thành 1 image. Image chứa tất cả mọi thứ để chương trình chạy.
 IMAGE bao gồm:
 * A cut-down OS
 * Môi trường runtime (vd như Node, Python)
 * File ứng dụng
 * Thư viện thứ 3
 * Biến môi trường
 => Sau khi có cái Image này, ta sẽ nói với Docker để start container 
 Container như 1 process, nhưng là process đăc biệt vì nó có file system được cung cấp bởi Image. Ứng dụng của chúng ta sẽ được chạy trong cái process/container này.
 
 Ok giờ chúng ta start docker.
 Thay vì chạy ứng dụng như bình thường, ta gọi Docker để chạy bên trong cái container nhé
 
 ``docker run ..``
 
 ---------------
 Ví dụ sự khác nhau :
 
 Để chạy 1 chương trình JS đơn giản, ta cần phải qua 4 bước:
 - Start OS
 - Cài Node
 - Copy file ứng dụng
 - Chạy ``node app.js``
 
 Với docker, ta chỉ cần:
 
 * Bước 1:

 - Vào thư mục project trên vscode ``code .``
 - Tạo file ``Dockerfile`` không ext, và input các thông tin sau:
 ```
 FROM node:alpine
 > chọn image node trên trang docker hub và : distribution của linux, ở đây chọn alpine vì nó nhẹ nhất 
 COPY . /app 
 > copy tất cả file execute vào thư mục app tạo mới, vào rồi copy vào trong image
 > hoặc có thể hiểu là trong cái image có file system, và chúng ta tạo thư mục app bên trong file system đó, trong thư mục app chứa tất cả các file của program
 WORKDIR /app
 > tạo đường dẫn rút gọn
 CMD node /app.js
 > câu lệnh chạy ứng dụng, để docker biết mà chạy câu nào khi run
 
 
 * Bước 2:
 - TA nói docker đóng gói úng dụng thành image
 ``docker build -t hello-docker . ``
 trong đó, dấu . chỉ cho docker biết chỗ nào chứa Dockerfile
 hello-docker là tên repos docker mình tự tạo để quản lý
 
 Để xem có bao nhiêu docker đang chạy:
 `` docker image ls``
 kết quả câu lệnh có cột SIZE chỉ size của OS (alpine) + ứng dụng + node
 
 
 * BƯớc 3:
 Chạy thử docker image
 ``docker run hello-docker``
 ta có thể chạy ở thư mục nào cũng được, vì image đã chứa mọi thứ cần
 
 *BƯớc 4
 Publish lên docker hub hub.docker.com
 
 -------------------
 KHi ở máy khác, ta muốn pull image về chạy:
 
 * BƯớc 1:
 - Kiểm tra version docker, nếu chưa download thì chạy lệnh install
 ``docker vesion``
 
 *Bước 2:
 Kéo image về
 ``docker pull senrie/hello-docker``
 
 Kiểm tra lại = cách:
 ``docker image ls``
 
 *Bước 3:
 Chạy chương trình trên machine 
 ``docker run senrie/hello-docker``
 
