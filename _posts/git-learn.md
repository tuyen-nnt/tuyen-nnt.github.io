* ssh-keygen
* cat .ssh/id_rsa.pub
=> copy key và vào github settings tạo SSH key để sau này push ko cần pass nữa mà lưu ID biết là máy mình luôn.
> Warning: Permanently added the RSA host key for IP address '20.205.243.166' to the list of known hosts.



-------
nano .git/config : để edit config repo 


git log : log các commit

git reset --soft 336a93d5e851ccde49e8a3e957222a240244ea11
> số trên là id của commit lấy từ git log mà mình muốn back về

git stash
> Saved working directory and index state WIP on master: 336a93d Set theme jekyll-theme-architect

------------
#### Khi push bị conflict, cách giải quyết như sau:

* git status
* Show conflict: bằng cách mở file conflict ra và chỉnh sửa về version mong muốn
* git add
* git commit
* git push
=> Nên git pull về trước khi merge
