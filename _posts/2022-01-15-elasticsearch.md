---
layout: post
title:  "Query Elasticsearch"
author: tuyennnt
categories: [ Data ]
image: assets/images/es.png
---


Các cách query:

- Dùng Query string
```
GET /ecommerce/product/_search?q=*
hoặc 
GET /ecommerce/product/_search?q=pasta
hoặc có field name:
GET /ecommerce/product/_search?q=name:pasta
```

- Dùng Compound Queries (Query DSL)

```
GET /<index>/<category>/_search
{
	"query": {
		"bool": {
			"must": [
				{ "match": { "name": "pasta" } }
			]
			"should": [
			{ "match": { "name": "spaghetti" } }
			]
		}
	}
}
```

Giải thích về ``must`` và ``should``:
```
must means: The clause (query) must appear in matching documents. These clauses must match, like logical AND.

should means: At least one of these clauses must match, like logical OR.

Basically they are used like logical operators AND and OR. See this.

Now in a bool query:

must means: Clauses that must match for the document to be included.

should means: If these clauses match, they increase the _score; otherwise, they have no effect. They are simply used to refine the relevance score for each document.

Cre: https://stackoverflow.com/questions/28768277/elasticsearch-difference-between-must-and-should-bool-query
```

* ``must``: truy vấn bắt buộc phải xuất hiện trong kết quả trả về, và các truy vấn con trong must có mối quan hệ AND với nhau.

* ``should``: nếu truy vấn có trong kết quả thì score sẽ tăng thêm, score này được tính bằng 1 số phép toán học. Các filter con trong should có mỗi quan hệ OR với nhau.

=> Vì must và should nằm trong bool nên nếu chỉ có should mà không có must hay must_not thì truy vấn trong should (nếu chỉ có 1 filter) bắt buộc xuất hiện trong kết quả. 


-------------------------------
Cách hoạt động của query clause phụ thuộc vào nó là Query context hay Filter context.

* ``Query context?``
Trả lời câu hỏi ""document này phù hợp với mệnh đề truy vấn nhiều như thế nào?"

Query context sẽ có _score để đo mức độ phù hợp với truy vấn của document, tối đa là 1.0.
> _score được tính bởi thuật toán đặc biệt chúng ta sẽ chưa tìm hiểu ở đây. 

Query context là khi mệnh đề truy vấn được truyền vào tham số "query" trong search API.


* ``Filter context?``
Trả lời câu hỏi "document này có phù hợp với mệnh đề truy vấn không?", CÓ hoặc KHÔNG.

Filter context là khi truyền mệnh đề truy vấn vào tham số "filter" hay "must_not".

* ``match_all{}``:
Không cần query bên trong. Nó trả về tất cả document, tất cả đều có _score là 1.0 

* ``match{"<field_name>" : {"query" : "<giá trị>"}}``: trả về các document thỏa giá trị mà ta cung cấp.
Đối với giá trị text, text sẽ được analyze khi tìm kiếm, kết quả sau analyze sẽ được xây dựng thành 1 boolean query. Ta có thể cấu hình thêm tham số ``operand`` (mặc định là or).

Ngoài ra còn rất nhiều các tham số khác sử dụng trong các trường hợp phức tạp, bạn có thể đọc thêm ở https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-match-query.html

* ``multi-match {"query":<giá trị> , "fields" : ["<field_name1>" , "<field_name2>"]}``
Trả về các document mà các field thỏa giá trị query. Ở đây có thể dùng wildcards trong trường field để chỉ nhiều field. 

Ví dụ: ``*_name`` thì các field được tìm kiếm sẽ là first_name, last_name,...

* ``must``
Mệnh đề trong must phải có trong kết quả, các mệnh đề con có mối quan hệ AND.

* ``must-not``
Mệnh đề trong must không được có trong kết quả, các query bên trong có mối quan hệ NOT và AND.

* ``should``
Kết quả trả về phải thỏa 1 trong các query của should, các query bên trong có mối quan hệ OR với nhau.

* ``bool``: là 1 compound query clause.
Boolean query được dùng để kết hợp nhiều mệnh đề query khác nhau gồm must, must-not, should, filter.

* ``filter``: document trả về phải thỏa tất cả query bên trong filter, vì là filter context nên _score được bỏ qua và mệnh đề được xem xét để cache.

* ``range {"<field_name>" : { "gte" : <giá trị> , "lt" : <giá trị> }}``:
Trả về các document có giá trị nằm trong range đề cập trong range query.

* ``term {"<field_name>" : {"value" : <giá trị chính xác> }}``
Trả về các document có giá trị chính xác được đề cập trong term query.
Lưu ý khi dùng term query đối với giá trị text, vì text sẽ được analyze và case sensitive. 
