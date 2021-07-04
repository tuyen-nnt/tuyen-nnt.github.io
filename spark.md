Deciding whether or not Spark is the best solution for your problem takes some experience, but you can consider questions like:

    Is my data too big to work with on a single machine?
    Can my calculations be easily parallelized?


Bước 1: Create an instance of the SparkContext class to connect to a Spark cluster from PySpark.
You may also find that running simpler computations might take longer than expected. That's because all the optimizations that Spark has under its hood are designed for complicated operations with big data sets. That means that for simple or small problems Spark may actually perform worse than some other solutions!

# Verify SparkContext
print(sc)

# Print Spark version
print(sc.version)

<SparkContext master=local[*] appName=pyspark-shell>
2.3.1

Using DataFrames

Spark's core data structure is the Resilient Distributed Dataset (RDD). This is a low level object that lets Spark work its magic by splitting data across multiple nodes in the cluster. However, RDDs are hard to work with directly, so in this course you'll be using the Spark DataFrame abstraction built on top of RDDs.

The Spark DataFrame was designed to behave a lot like a SQL table (a table with variables in the columns and observations in the rows). Not only are they easier to understand, DataFrames are also more optimized for complicated operations than RDDs.

When you start modifying and combining columns and rows of data, there are many ways to arrive at the same result, but some often take much longer than others. When using RDDs, it's up to the data scientist to figure out the right way to optimize the query, but the DataFrame implementation has much of this optimization built in!

To start working with Spark DataFrames, you first have to create a SparkSession object from your SparkContext. You can think of the SparkContext as your connection to the cluster and the SparkSession as your interface with that connection.

--------------------------

I. SELECT 

2. Loai 2
> flights.select(flights.air_time/60)

returns a column of flight durations in hours instead of minutes.


if you wanted to .select() the column duration_hrs (which isn't in your DataFrame) you could do

> flights.select((flights.air_time/60).alias("duration_hrs"))

The equivalent Spark DataFrame method .selectExpr() takes SQL expressions as a string:

> flights.selectExpr("air_time/60 as duration_hrs")
with the SQL as keyword being equivalent to the .alias() method. To select multiple columns, you can pass multiple strings.








