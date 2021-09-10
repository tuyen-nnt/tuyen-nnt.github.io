
* PySpark APIs tương tự như Pandas và Scikit-learn

* Schema là nơi lưu và control thông tin của dataframe bao gồm tên các cột, kiểu dữ liệu, empty values,... Ngoài ra nó còn giúp DFs tối ưu queries. Nếu để schema=None thì spark sẽ tự suy luận kiểu data,... dựa trên data của bạn. Còn không có thể tự quy định schema như ví dụ sau:
```
schema1 = StructType([StructField('id', IntegerType(), True),
                     StructField('create_date', StringType(), True),
                     StructField('txn_date', StringType(), True)])
```

* Retrieve SparkContext version
``sc.version``
> 2.3.1

* Retrieve Python version of SparkContext 
``sc.pythonVer``
> 3.6

* master: URL of cluster or "local" string to run in local mode of SparkContext
``sc.master``
> local[*]

* Tạo spark Dataframe
``spark.createDataFrame()``

### Cách Load data vào PySpark
#### Load data vào SparkContext
* Cách 1 : 
Dùng  ``parallelize`` method của SparkContext với input là 1 list.
```
rdd = sc.parallelize([1,2,3,4,5])
```
> Tạo parallelize collection lưu số từ 1 đến 5

* Cách 2:
Dùng method của SparkContext ``textFile()``
```
rdd2 = sc.textFile("test.txt")
```

#### Load data vào Spark dataframe
* Cách 1: load data từ file và tạo thành dataframe
Dùng method của SparkSession 
```
spark.read.csv("...", header = True, inferSchema=True)
spark.read.json("...")
spark.read.txt("...")
```
* Cách 2 : Tạo dataframe từ RDD
Đầu tiên phải tạo RDD từ list. Optional là tạo thêm list của columns tên là ``names``
df = spark.createDataFrame(RDD, schema=names)

![](img/rdd-df.png)


#### Read & Write file từ HDFS:
https://saagie.zendesk.com/hc/en-us/articles/360029759552-PySpark-Read-and-Write-Files-from-HDFS

