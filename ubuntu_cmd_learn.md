# Làm việc cùng các câu lệnh trên terminal Ubuntu

Tải ứng dụng trên ubuntu: **sudo apt-get install** alacarte

Uninstall ứng dụng: **sudo apt-get remove** alacarte

Đổi tên file: 
> mv [đường dẫn với tên cũ] [đường dẫn với tên mới]

Ví dụ: Đổi tên tập tin test1.txt trong /root thành test.txt:

mv /root/test1.txt /root/test.txtmv 

Di chuyển file:
> mv [đường dẫn nguồn] [đường dẫn đích]

Ví dụ: Di chuyển và đổi tên tập tin test1.txt trong /root sang /etc đổi tên thành test.txt: 
mv /root/test1.txt /etc/test.txt


Cập nhật phiên bản: **Run npm install -g npm@7.13.0** với *version là 7.13.0*

Mở OVPN: **sudo openvpn --config Downloads/client.ovpn**

Mở ứng dụng sau khi cd vào folder chứa ứng dụng: **./datagrip.sh**

## Cách pin ứng dụng lên thanh dock ubuntu
* Bước 1: Tải file tar ứng dụng về và giải nén bằng lệnh tar -xvzf [tên_file]
* Bước 2: Tạo file tên ứng dụng có đuôi **.desktop** trong thư mục *.local/share/applications*, ví dụ webstorm.sh
* Bước 3: Mở file .desktop và paste dòng sau:

/# https://askubuntu.com/questions/975178/duplicate-icons-in-the-dock-of-gnome-shell-ubuntu-17-10/975230#975230
/# https://askubuntu.com/questions/990833/cannot-add-custom-launcher-to-dock-add-to-favorites
/# dconf-editor

[Desktop Entry]
Type=Application
Terminal=false
Icon[en_US]=***/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.svg***
Name[en_US]=***WebStorm***
Exec=***/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.sh***
Name=***WebStorm***
Icon=***/home/quocbao/Tools/WebStorm-2019.2/bin/webstorm.svg***
StartupWMClass=***jetbrains-webstorm***

*Trong đó:*
* Icon: chứa đường dẫn thư mục có hình ảnh biểu tượng cho ứng dụng
* Name: tên của ứng dụng
* StartupWMClass: được lấy bằng cách chạy câu lệnh *xprop WM_CLASS* và bấm vào ứng dụng để hiện mã trên Terminal sau đó copy vào






