- EXTRACT

Các kỹ thuật extract data:

![](/assets/images/extract-ibm.png)

![](/assets/images/extract-ibm2.png)

Khi nào cần extract data:
![](/assets/images/extract-use-case.png)



#### Parallel computing

##### Advantages:

- Extra processing power.
- Reduce memory footprint (RAM when running app) in one computer.

##### Disadvantages:

- Moving, splitting data to assign to processing units incurs a cost.
- Communication time to split and wrap data up.
- With greater computing power comes greater complexity

#### SPARK

- Spark's core data structure is the Resilient Distributed Dataset (RDD)
- Firstly, Create connection to the cluster using ``SparkContext`` and assign to variable ``sc``.

```
conf = SparkConf().setAppName(appName).setMaster(master)
sc = SparkContext(conf=conf)
```

- Secondly, create a SparkSession object from your SparkContext. You can think of the SparkContext as your connection to the cluster and the SparkSession as your interface with that connection, the variable is usually set as ``spark``.
- Using the Spark DataFrame abstraction built on top of RDDs is easier to understand. Operations using DataFrames are automatically optimized for complicated operations more than RDDs.


##### Code

- Creating a SparkSession

We've already created a SparkSession for you called spark, but what if you're not sure there already is one? Creating multiple SparkSessions and SparkContexts can cause issues, so it's best practice to use the SparkSession.builder.getOrCreate() method. This returns an existing SparkSession if there's already one in the environment, or creates a new one if necessary!

```
    #Import SparkSession from pyspark.sql.
    #Make a new SparkSession called my_spark using SparkSession.builder.getOrCreate().
    #Print my_spark to the console to verify it's a SparkSession
    
    # Import SparkSession from pyspark.sql
	from pyspark.sql import SparkSession

    # Create my_spark
	my_spark = SparkSession.builder.getOrCreate()

    # Print my_spark
	print(my_spark)
```

- Viewing tables

Once you've created a SparkSession, you can start poking around to see what data is in your cluster!

Your SparkSession has an attribute called catalog which lists all the data inside the cluster. This attribute has a few methods for extracting different pieces of information.

One of the most useful is the .listTables() method, which returns the names of all the tables in your cluster as a list.


=> See what tables are in your cluster by calling ``spark.catalog.listTables()`` and printing the result!


- Query tables:

Are you query-ious?

One of the advantages of the DataFrame interface is that you can run SQL queries on the tables in your Spark cluster. If you don't have any experience with SQL, don't worry, we'll provide you with queries! (To learn more SQL, start with our Introduction to SQL course.)

As you saw in the last exercise, one of the tables in your cluster is the flights table. This table contains a row for every flight that left Portland International Airport (PDX) or Seattle-Tacoma International Airport (SEA) in 2014 and 2015.

Running a query on this table is as easy as using the .sql() method on your SparkSession. This method takes a string containing the query and returns a DataFrame with the results!

If you look closely, you'll notice that the table flights is only mentioned in the query, not as an argument to any of the methods. This is because there isn't a local object in your environment that holds that data, so it wouldn't make sense to pass the table as an argument.

Remember, we've already created a SparkSession called spark in your workspace. (It's no longer called my_spark because we created it for you!)


    Use the .sql() method to get the first 10 rows of the flights table and save the result to flights10. The variable query contains the appropriate SQL query.
    Use the DataFrame method .show() to print flights10.


```
# Don't change this query
query = "FROM flights SELECT * LIMIT 10"

# Get the first 10 rows of flights
flights10 = spark.sql(query)

# Show the results
flights10.show()
```


#### Temp view & Catalog

Maybe you want to go the other direction, and put a pandas DataFrame into a Spark cluster! The SparkSession class has a method for this as well.

The .createDataFrame() method takes a pandas DataFrame and returns a Spark DataFrame.

The output of this method is stored locally, not in the SparkSession catalog. This means that you can use all the Spark DataFrame methods on it, but you can't access the data in other contexts.
=> Spark dataframe sẽ được lưu local trên Spark cluster, không nằm trong SparkSession catalog

For example, a SQL query (using the .sql() method) that references your DataFrame will throw an error. To access the data in this way, you have to save it as a temporary table.

You can do this using the .createTempView() Spark DataFrame method, which takes as its only argument the name of the temporary table you'd like to register. This method registers the DataFrame as a table in the catalog, but as this table is temporary, it can only be accessed from the specific SparkSession used to create the Spark DataFrame.

There is also the method .createOrReplaceTempView(). This safely creates a new temporary table if nothing was there before, or updates an existing table if one was already defined. You'll use this method to avoid running into problems with duplicate tables.

=> ``.createOrReplaceTempView()`` sử dụng hàm này để đưa Spark dataframe vào Catalog của SparkSession, khi đó ta mới có thể truy cập đến dataframe này trong các hàm khác (ví dụ ``.sql()``) thuộc cùng SparkSession đã tạo ra Dataframe đó.


```
# Create pd_temp
pd_temp = pd.DataFrame(np.random.random(10))

# Create spark_temp from pd_temp
spark_temp = spark.createDataFrame(pd_temp)

# Examine the tables in the catalog
print(spark.catalog.listTables())

# Add spark_temp to the catalog
spark_temp.createOrReplaceTempView("temp")

# Examine the tables in the catalog again
print(spark.catalog.listTables())
```


### Using broadcasting on Spark joins

Remember that table joins in Spark are split between the cluster workers. If the data is not local, various shuffle operations are required and can have a negative impact on performance. Instead, we're going to use Spark's broadcast operations to give each node a copy of the specified data.

A couple tips:

    Broadcast the smaller DataFrame. The larger the DataFrame, the more time required to transfer to the worker nodes.
    On small DataFrames, it may be better skip broadcasting and let Spark figure out any optimization on its own.
    If you look at the query execution plan, a broadcastHashJoin indicates you've successfully configured broadcasting.
    
    
### Driver & Worker

- Driver:
	- Task assignment
	- Result consolidation
	- Share data access for worker
Should have double memory of the worker.
Fast local storage is helpful.

- Worker:
	- Run actual tasks
	- Idealy has all code, data and resource for given task
More worker nodes is often better than large one.
Test to find the balance (cost & time).
Fast local storage (SSD/NVMe) extremely helpful for caching, intermediate files.


### Data validation 

Definition:
- Verify a dataset complies with the expected format. => can use inner join to filter as your requirement.
- Number of rows/columns
- Data types
- Complex validation rules to validate logic.
	- Calculations.
	- External source: web service, local files, API calls.
	- Likely use UDF to modify/verify the DF.

