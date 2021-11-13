### Bắt đầu với MongoDB

Install MongoDB

Tạo folder mongodb/data/db & mongodb/log để đảm bảo các dữ liệu được lưu vào file system.

Navigate tới thư mục chạy chương trình: ``cd mongodb/bin`` (folder được tạo có sẵn sau khi install)

Mount đường dẫn để cho phép chương trình run as service: ``mongod --directoryperdb --dbpath C:\mongodb\data\db --logpath C:\mongo\log\mongo.log --logappend --rest --install``

Run as service in background: ``net start MongoDB``

Bắt đầu làm việc trên Mongo Shell gõ: ``mongo``

Gõ ``cls`` nếu muốn clear màn hình console.

--------------

### Các câu lệnh thao tác với MongoDB 

* List các database:
``show dbs``

* Tạo database mới và switch sang db đó: ``use <tên db>``

* Show db đang hoạt động : ``db``

* Cú pháp json của ``document`` (như 1 row trong Mysql):

```
{
	first_name:"John",
	last_name:"Doe",
	memberships: ["mem1", "mem2"] //array
	address:{
		      street:"4 main st",
		      city: "Boston"
    }

	contacts:[
		     {name: "Brad", relationship:"friend"},
 	 ]
}
```
> lưu ý định dạng file json, phần tử street nằm dưới dấu ``{``, phần tử {name nằm dưới dấu ``:``


* Tạo user admin: 

```db.createUser({
		  user:"brad",
		  pwd:"1234"
		  roles:["readWrite", "dbAdmin"]
  })
```
  
* Tạo collections (như table trong relational DB) :

