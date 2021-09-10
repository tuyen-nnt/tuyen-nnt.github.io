---
layout: post
title:  "Learn Linux commands on Ubuntu"
author: tuyennnt
categories: [ Linux, Ubuntu ]
image: img/import1.png
---


# Làm quen với Ubuntu

## 1. Một số câu lệnh thường dùng 
#### Part 1

Tải ứng dụng trên ubuntu: 
``
sudo apt-get install alacarte
``

Uninstall ứng dụng: 
``
sudo apt-get remove alacarte
``

Đổi tên file:


``
 mv [đường dẫn với tên cũ] [đường dẫn với tên mới]
``

Ví dụ: Đổi tên tập tin `test1.txt` trong /root thành `test.txt`:


``
mv /root/test1.txt /root/test.txtmv 
``

Di chuyển file:
``
mv [đường dẫn nguồn] [đường dẫn đích]
``

Ví dụ: Di chuyển và đổi tên tập tin `*test1.txt` trong `/root` sang `/etc `đổi tên thành `test.txt`: 

``
mv /root/test1.txt /etc/test.txt
``

Mở file xem dùng lệnh:
``
cat <đường dẫn hoặc tên file trong thư mục hiện hành>
``

Edit file hoặc tạo file mới dùng lệnh:
``
nano <đường dẫn hoặc tên file trong thư mục hiện hành>
``

Tìm file trong thư mục hiện hành:
```
find . [tên file]
find . 
//list ra tất cả các file trong thư mục
```

Cập nhật phiên bản, ví dụ npm 7.13.0: 
``
npm install -g npm@7.13.0
``

Mở OVPN: 

``
sudo openvpn --config Downloads/client.ovpn
``


Mở ứng dụng sau khi cd vào folder chứa file thực thi, dùng lệnh sau để mở ứng dụng : 
``
./datagrip.sh
``

Tải Remarkable để viết markdown thông qua wget thay vì snap hoặc apt-get :
```
wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb

sudo dpkg -i remarkable_1.87_all.deb
*Chạy đến đây nếu gặp lỗi "dpkg: dependency problems prevent configuration of remarkable"  ta chạy câu lệnh*
> sudo apt-get install -f

sudo apt-get install -f
```

Reset lai cau commit trước đó
```
git reset --soft HEAD^^C
```

Overide commit đã push^C
```
git push origin +master
```

Push lên brach master
```
git push origin +master 
```
---------------------------------
#### Part 2: update 23.05.2021

Xem lịch sử viết cmd:
``
cat ~/.bash_history
``

Giải nén với file taz
``
tar -xvzf ... 
``

Giải nén với file taz:
``
tar -xvf ... 
``

Giải nén với file deb:
``
sudo dpkg -i ... 
``

Để xem nó là dạng file gì :
``
file .... 
``

Xem là file hay thư mục và các quyền:
``
ls -l 
``
Nếu cần quyền root để thực thi thì đổi sang quyền owner cho user
```
sudo chown -R tuyen:tuyen . 
//thay đổi owner cho user, dấu "." chỉ tất cả các file trong thư mục hiện hành, tuyen là user : tuyen là user group
chmod +x 
```

Để bổ sung cấu hình cho hệ thống:
```
sudo nano hosts
Ex:
# Một ứng dụng cần config
<ip> www.XXX.com
<ip> licxxxx.XXXX.com
voi ip la so dang XXX.X.X.X
//Lưu ý dùng quyền sudo với những file của hệ thống
```

Giải nén file .deb dùng lệnh:
``
sudo dpkg -i remarkable_1.87_all.deb
``



## 2. Cài đặt server tải package apt-get về từ VN để nhanh hơn dùng mặc định của nước ngoài

```
cd /etc/apt
ls

sudo cp sources.list sourceslist.bak
//back-up file

sudo sed -i 's/vn.archive.ubuntu.com/mirror.bizflycloud.vn/' sources.list
//thay thế tất cả link /vn.archive.ubuntu.com = link mirror.bizflycloud.vn trong file sources.list

cat sources.list

sudo apt-get update

sudo rm sourceslist.bak 
```

## 3. Compile ứng dụng từ source code thủ công

Đối với những ứng dụng dùng apt-get gặp vấn đề version hoặc không tương thích với máy, ta sẽ chuyển sang dùng cách này.
Tuy nhiên cách này nếu may mắn sẽ compile nhanh, ngược lại có nhiều trường hợp thiếu thư viện khi ./configure dẫn đến mất nhiều thời gian.
Đó là lí do nhiều người sẽ cài đặt Docker để compile từ source code nhanh => mình sẽ hướng dẫn ở phần sau.

* B1: Download source code về từ git dùng git clone
``
git clone <đường dẫn>
``
* B2: ``cd `` vào thư mục ứng dụng
* B3: Cấu hình cho ứng dụng chạy trên máy bạn, ở bước này đòi hỏi sự kiên nhẫn để cài đặt thêm những thư viện cần, chú ý xem lỗi từ cmd để fix chính xác.
``
./configure
``
Khi tải thêm thư viện thì cú pháp:
```
sudo apt-get install <tên thư viện>-dev
//Lưu ý phải có -dev vì -dev là source code của mấy cái thư viện
```

* B4: Compile từ source code thành file binary
```
make
//Trong quá trình runtime nếu được yêu cầu tải thêm thư viện thì đuôi thư viện ko cần -dev nữa, vì các file config đã được compile ra binary hết rồi, ko còn là source code nữa 
=> do vậy bỏ đuôi -dev để tương thích
```


* B5: Install file binary vô hệ thống hay nói cách khác là chuyển những file đã được compile ở trên vô hệ thống
``
sudo make install
``

## 4. Cách pin ứng dụng lên thanh dock ubuntu
* Bước 1: Tải file tar ứng dụng về và giải nén bằng lệnh tar -xvzf [tên_file]
* Bước 2: Tạo file tên ứng dụng có đuôi **.desktop** trong thư mục *.local/share/applications*, ví dụ webstorm.desktop bằng lệnh ``nano webstorm.desktop``
* Bước 3: Mở file .desktop và paste dòng sau:

```
# https://askubuntu.com/questions/975178/duplicate-icons-in-the-dock-of-gnome-shell-ubuntu-17-10/9752 30#975230
# https://askubuntu.com/questions/990833/cannot-add-custom-launcher-to-dock-add-to-favorites
# dconf-editor

[Desktop Entry]
Type=Application
Terminal=false
Icon[en_US]=/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.svg
Name[en_US]=WebStorm
Exec=/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.sh
Name=WebStorm
Icon=/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.svg
StartupWMClass=jetbrains-webstorm
```

*Trong đó:*

    * Icon: chứa đường dẫn thư mục có hình ảnh biểu tượng cho ứng dụng
    * Name: tên của ứng dụng
    * StartupWMClass: được lấy bằng cách chạy câu lệnh ``xprop WM_CLASS`` và bấm vào ứng dụng để hiện mã trên Terminal sau đó copy vào.

* Bước 4: Gõ câu lệnh 
``sudo apt-get install dconf-editor`` nếu chưa install

Tiếp theo gõ lệnh ``dconf-editor``

Sau đó chọn đến thư mục trong cửa số hiện lên:
``org/gnome/shell/favorite-apps``

Tại mục **Customize value** gõ tại vị trí mong muốn xuất hiện:
> ``tên_file.desktop``

 *Lưu ý: các tên file cách nhau bởi dấu phẩy*

### Một số lưu ý trong lúc thực hiện:
* Khi file **.sh** không có quyền thực thi (kiểm tra quyền bằng câu lệnh `ls -l <tên_file>`, dùng tên file nếu đang ở trong thư mục chứa file còn không dùng đường dẫn đến file), ta cần thêm quyền thực thi (quyền mở file) bằng cách gõ câu lệnh sau:

```
chmod +x <đường dẫn file>
```
Tìm hiểu thêm các quyền [tại đây](https://vinasupport.com/chmod-la-gi-huong-dan-su-dung-lenh-chmod-tren-linux-unix/)
Tìm hiểu thêm các lệnh khác [tại đây](https://blogd.net/linux/lam-viec-voi-tap-tin-va-thu-muc-tren-linux/)

### Các loại đường dẫn
* ~/ : thay cho home
* /thư mục/... : là đường dẫn tuyệt đối, phải tuyệt đối chính xác, không rút gọn
* thư mục/.../ : là đường dẫn tương đối, đôi khi không có đoạn thư mục đầu vì đã ở trong thư mục đó rồi, v.v
* ./ : chỉ thư mục hiện hành, nhưng đôi khi có các câu lệnh như "git ./ bấm tiếp tab" sẽ gợi ý ra các file có thể áp dụng, nếu "git" thôi thì sẽ được list ra các câu lệnh có thể dùng với git, ví dụ ./vscode.sh


Cre: 
* Part 1:
https://askubuntu.com/questions/975178/duplicate-icons-in-the-dock-of-gnome-shell-ubuntu-17-10/975230#975230
https://askubuntu.com/questions/990833/cannot-add-custom-launcher-to-dock-add-to-favorites
https://vinasupport.com/chmod-la-gi-huong-dan-su-dung-lenh-chmod-tren-linux-unix/
https://blogd.net/linux/lam-viec-voi-tap-tin-va-thu-muc-tren-linux/

* Part 2:
https://www.liquidweb.com/kb/how-to-install-software-from-source-on-ubuntu/
https://help.ubuntu.com/community/CompilingEasyHowTo
https://help.ubuntu.com/community/CompilingEasyHowTo

