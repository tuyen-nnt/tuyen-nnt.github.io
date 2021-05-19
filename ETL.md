


## EXTRACT DATA 

Three ways of extracting data:

* Extract from text files, like .txt or .csv
* Extract from APIs of web services, like the Hacker News API
* Extract from a database, like a SQL application database for customer data


```
import requests

# Lấy dữ liệu từ bài viết của Hackernews về, F12 inspect để lấy URL của nó
resp = requests.get("https://hacker-news.firebaseio.com/v0/item/16222426.json")

# in dữ liệu vừa parse thành file json ra màn hình 
print(resp.json())

# parse dữ liệu ra rồi gán value của key "score" vào biến post_score, sau đó in cái biến ra  
post_score = resp.json()["score"]
print(post_score)
```


Đọc dữ liệu từ database của postgreSQL, hàm extract dùng SQL query có nhiệm vụ chuyển từ dữ liệu bảng thành kiểu object mà pandas dùng (là dataframe)
```
# Function to extract table to a pandas DataFrame
def extract_table_to_pandas(tablename, db_engine):
    query = "SELECT * FROM {}".format(tablename)
    return pd.read_sql(query, db_engine)

# Connect to the database using the connection URI, sử dụng package sqlalchemy
connection_uri = "postgresql://repl:password@localhost:5432/pagila" 
db_engine = sqlalchemy.create_engine(connection_uri)

# Extract the film table into a pandas DataFrame, lưu ý nhớ để tên bảng dạng chuỗi
extract_table_to_pandas("film", db_engine)

# Extract the customer table into a pandas DataFrame
extract_table_to_pandas("customer", db_engine)
```