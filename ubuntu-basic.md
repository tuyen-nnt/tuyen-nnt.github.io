# Làm quen với Ubuntu

## 1. Một số câu lệnh thường dùng 


Tải ứng dụng trên ubuntu: 
```
sudo apt-get install alacarte
```

Uninstall ứng dụng: 
```
sudo apt-get remove alacarte
```

Đổi tên file:


```
 mv [đường dẫn với tên cũ] [đường dẫn với tên mới]
```

Ví dụ: Đổi tên tập tin `test1.txt` trong /root thành `test.txt`:


```
mv /root/test1.txt /root/test.txtmv 
```

Di chuyển file:
```
mv [đường dẫn nguồn] [đường dẫn đích]
```

Ví dụ: Di chuyển và đổi tên tập tin `*test1.txt` trong `/root` sang `/etc `đổi tên thành `test.txt`: 

```
mv /root/test1.txt /etc/test.txt
```

Mở file xem dùng lệnh:
```
cat <đường dẫn hoặc tên file trong thư mục hiện hành>
```

Edit file hoặc tạo file mới dùng lệnh:
``` 
nano <đường dẫn hoặc tên file trong thư mục hiện hành>
```


Cập nhật phiên bản, ví dụ npm 7.13.0: 
```
npm install -g npm@7.13.0
```

Mở OVPN: 

```
sudo openvpn --config Downloads/client.ovpn
```


Mở ứng dụng sau khi cd vào folder chứa ứng dụng dùng lệnh sau để mở file thực thi : 
```
./datagrip.sh
```

Tải Remarkable để viết markdown thông qua wget thay vì snap hoặc apt-get :
```
wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb

sudo dpkg -i remarkable_1.87_all.deb
*Chạy đến đây nếu gặp lỗi "dpkg: dependency problems prevent configuration of remarkable"  ta chạy câu lệnh*
> sudo apt-get install -f

sudo apt-get install -f
```



## 2. Cách pin ứng dụng lên thanh dock ubuntu
* Bước 1: Tải file tar ứng dụng về và giải nén bằng lệnh tar -xvzf [tên_file]
* Bước 2: Tạo file tên ứng dụng có đuôi **.desktop** trong thư mục *.local/share/applications*, ví dụ webstorm.sh bằng lệnh *nano [tên_file]*
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
    * StartupWMClass: được lấy bằng cách chạy câu lệnh *xprop WM_CLASS* và bấm vào ứng dụng để hiện mã trên Terminal sau đó copy vào.

* Bước 4: Gõ câu lệnh 
```
dconf-editor
```

Cửa sổ dconf hiện lên, tại mục **Customize value** gõ tại vị trí mong muốn xuất hiện:
> 'tên_file.desktop' 

 *Lưu ý: các tên file cách nhau bởi dấu phẩy*

### Một số lưu ý trong lúc thực hiện:
* Khi file **.sh** không có quyền thực thi (kiểm tra quyền bằng câu lệnh `ls -l <tên_file>`, dùng tên file nếu đang ở trngo thư mục chứa file còn không dùng đường dẫn đến file), ta cần thêm quyền thực thi (quyền mở file) bằng cách gõ câu lệnh sau:

```
chmod +x <đường dẫn file>
```
Tìm hiểu thêm các quyền [tại đây](https://blogd.net/linux/lam-viec-voi-tap-tin-va-thu-muc-tren-linux/)

### Các loại đường dẫn
* ~/ : thay cho home
* /thư mục/... : là đường dẫn tuyệt đối
* thư mục/.../ : là đường dẫn tương đối
* ./ : chỉ thư mục hiện hành, nhưng đôi khi có các câu lệnh như "git ./ bấm tiếp tab" sẽ gợi ý ra các file có thể áp dụng, nếu "git" thôi thì sẽ được list ra các câu lệnh có thể dùng với git, ví dụ ./vscode.sh


Cre: 
https://askubuntu.com/questions/975178/duplicate-icons-in-the-dock-of-gnome-shell-ubuntu-17-10/975230#975230
https://askubuntu.com/questions/990833/cannot-add-custom-launcher-to-dock-add-to-favorites
https://vinasupport.com/chmod-la-gi-huong-dan-su-dung-lenh-chmod-tren-linux-unix/
https://blogd.net/linux/lam-viec-voi-tap-tin-va-thu-muc-tren-linux/

