### Bắt đầu với MongoDB

Install MongoDB: 
```
sudo apt update
sudo apt install -y mongodb
```

Tạo folder mongodb/data/db & mongodb/log để đảm bảo các dữ liệu được lưu vào file system.

Navigate tới thư mục chạy chương trình: ``cd mongodb/bin`` (folder được tạo có sẵn sau khi install)

Mount đường dẫn để cho phép chương trình run as service: ``mongod --directoryperdb --dbpath \home\tuyen\mongodb\data\db --logpath \home\tuyen\mongodb\log\mongo.log --logappend --rest --install``

Run as service in background: ``sudo systemctl start mongod``
hoặc ``service mongodb start``

Bắt đầu làm việc trên Mongo Shell gõ: ``mongo``. Gõ ``cls`` trong shell nếu muốn clear màn hình console.

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
  
* Tạo collections (như table trong relational DB) : ``db.createCollection('<tên collection>')``

* Show collections: ``show collections``

* Insert documents vào collection:
```
db.customers.insert({"first_name":"John", "last_name":"Doe"}, {"first_name":"Steven", "last_name":"Smith", "gender": "male"});
```
> Vì Mongo là NoSQL nên nó có thể add thêm các doc với fieldname tùy ý.

* List ra các documents (hàm pretty() giúp dễ nhìn hơn): ``db.customers.find().pretty();``

* Update document:
Cách 1: ghi lại tất cả các field

```
db.customers.update({"first_name":"John"}, {"first_name":"John", "last_name":"Doe", "gender":"male"}
```

Cách 2: dùng ``$set`` để không cần lặp lại các field giữ nguyên.

```
db.customers.update({"first_name":"John"}, {$set:{gender:"male"}});
```

* Tăng số cho 1 field dùng trong tính toán:
Ví dụ tăng 5 tuổi cho John. 
```
db.customers.update({"first_name":"John"}, {$set:{age:45}});

db.customers.update({"first_name":"John"}, {$inc:{age:5}});
```

* Xóa field name bất kỳ của 1 document:
Ví dụ xóa trường age của John.
```
db.customers.update({"first_name":"John"}, {$unset:{age}});
```

* Update nếu không thỏa điều kiện thì insert doc mới dùng ``upsert``:

```
db.customers.update({"first_name":"Mary"}, {"first_name":"Mary", "last_name":"Samson"},{upsert: true});
```

