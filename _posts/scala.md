### Big data analysis with Scala


Hôm nay mình cùng tìm hiểu về việc setting data parallelism trong Data-parallel programming.

Data parallelism hoạt động trên single multicore machine.

Lần này thì ta sẽ đào sâu trên distributed system (nhiều machines), nghĩa là nhiều machine hoạt động song song để hoàn thành một data-parallel job. Đối với shared-memory case, mô hình distribution sẽ có các concern như sau:

* Partial failure: một hoặc tập hợp machines (node) bị crash khi làm các tác vụ distributed computation => ảnh hưởng đến việc job có hoàn thành hay không?
* Latency: một vài operations có độ trễ cao hơn các operations khác do network communication. => ảnh hưởng đến thời gian hoàn thành job.

> Control latency sẽ được thể hiện trong programming model (coding). Bạn sẽ có thể sẽ cân nhắc giảm network communication trong code, mục đích giúp giảm chi phí.


##### Latency number:
![](/assets/images/latency-number.png)

Độ latency tăng dần : memory > disk/ssd > network 

Chi phí để communication giữa các network là rất đắt nên cần có cách xử lý để tối ưu.

Trước tiên, nói về Hadoop (người tiền nhiệm của Spark), đây là framework xử lý data theo batch được sử dụng rộng rãi.
Đây là một implementation của Google MapReduce.
MapReduce cung cấp:
* API đơn giản (bước map và reduce đơn giản).
* fault tolerance 
=> Đây là cái giúp cho Hadoop/MapReduce có thể scale lên 100 - 1000 nodes, giúp các node bị fail được khôi phục các computation và datasets lớn có thể hoạt động trở lại.

Việc kết hợp giữa khả năng Fault tolerance + simple API giúp cho 1 developer có thể tạo ra pipeline các bước map/reduce trên các tập dataset cực lớn.

![](/assets/images/latency-system-design.png)

##### Tại sao sử dụng Spark?

Fault tolerance trong Hadoop khá đắt. Giữa các bước map và reduce, để mà khôi phục lại các node bị fail, nó xáo trộn các data với nhau và ghi data trung gian vào trong disk.

Quay lại kiến thức về latency:
> Read/write vào disk chậm hơn memory x100 lần.
> Network communication chậm hơn memory x1.000.000 lần.

Vậy Spark có gì?
* Lưu giữ fault tolerance
* Có strategy khác để handle latency (giảm latency đáng kể)
> Idea để làm được điều này là bắt nguồn từ functional programming: ``Keep all data immutable (bất biến) và in-memory càng nhiều càng tốt``. Toàn bộ operations trên data chỉ là functional transformation, như Scala collection thông thường. Fault tolerance đạt được bằng việc replay lại các functional transformation trên 1 node bất kỳ để thực hiện lại computation trên các dataset ban đầu (original) được lưu trong memory.


=> Với cách làm như vậy, Spark chứng tỏ được performance gấp x100 lần so với Hadoop, và còn add thêm các APIs dễ sử dụng hơn.

Cụ thể hơn, các operations khi dùng Hadoop hầu hết thực hiện trên disk và network. Còn Spark thì shift từ network sang memory, nó giảm thiểu một cách tích cực các operations trên network. 

So sánh tốc độ Spark và Hadoop cho mỗi lần iteration trong logistic regression:
![](/assets/images/compare-spark-hadoop.png)

Vậy khi tăng số lần iteration thì sao? Thật ngạc nhiên khi Spark xử lý các iteration sau đó nhanh hơn! 
![](/assets/images/compare-spark-hadoop.png)


#### RDD (Resilient Distributed Datasets (RDDs)
Có thể coi đây giống như là một immutable Scala collection tuần tự hoặc song song.
![](/assets/images/rdd-ex.png)

##### Cách tạo ra RDD:
* Transform một RDD.
Ví dụ như dùng hàm map trên 1 RDD và trả về 1 RDD. Hoặc các high-order functions khác được define trên RDD và trả về kết quả là 1 RDD mới.

* Từ 1 Spark Context (hoặc Spark Session) object.
Spark Session sẽ handle Spark cluster, giúp chương trình bạn nói chuyện với Spark và việc đầu tiên bạn cần làm sẽ là khởi tạo Spark Context, Spark Session. Nó đại diện cho connection giữa Spark cluster và chương trình của bạn. Nó có các method hữu dụng được sử dụng để tạo và phân bổ RDD mới như :
	* ``parallelize``: convert một local Scala collection thành một RDD, thường thì không dùng hàm này vì các Scala collection thường nằm trong memory rồi, nên thường không cần chuyển thành RDD để tính toán nhanh hơn.
	* ``textFile``: đọc file từ HDFS hoặc local file system và chuyển nó thành RDD[String]
![](/assets/images/create-rdd.png)


p/s: Khi dùng những ngôn ngữ có hơi hướng functional như Ruby, Erlang, Scala v.v. nên nhớ các câu thần chú sau:

Muốn biến tập hợp này thành tập hợp kia có cùng số lượng phần tử: dùng map.
Muốn biến tập hợp này thành tập hợp kia có ít hơn số lượng phần tử: dùng filter.
Muốn biến tập hợp này thành tập hợp kia có thường là nhiều hơn số lượng phần tử: dùng flatMap.
Muốn biến tập hợp này thành 1 phần tử scalar: dùng reduce, foldLeft, hoặc foldRight.


#### Transformation & Actions:

##### Scala collection
Thực hiện Transformer và accessor trên Scala collection, có 2 operations như sau:
* Transformer : tạo ra collections (không phải là single value)
Ví dụ các method: map, filter, flatMap, groupBy.
```
map(f: A => B): Traversable[B]
```

* Accessor: tạo ra single values (không phải collection).
Ví dụ các method như: reduce, aggregate, fold.
```
reduce(op: (A, A) => A): A
```

Trong Spark thì lại có 2 operations là Transformation và Action:
* Transformation: Trả về RDDs
=> Chúng có đặc điềm là "Lazy", kết quả là RDD trả về chưa được compute ngay lập tức.

* Action: tính toán kết quả dựa trên RDDs, kết quả được trả về và được lưu trên external storage system ví dụ như HDFS.
=> Đặc điểm là "Eager", kết quả trả về của chúng được compute ngay lập tức.

> Sự Laziness/Eagerness là cách chúng ta có thể điều tiết, giới hạn network communication thông qua việc sử dụng programming model.


* Một vài transformation thường dùng trong Spark:
=> Khi thấy return RDDs thì ta biết đó là Transformation, và hãy nhớ là nó "Lazy" nên chưa thực hiện tính toán gì:
![](/assets/images/trans-RDD-spark.png)

* Một vài actions thường dùng trong Spark:
=> Actions có đặc điểm "Eager" và tính toán ngay. Nó sẽ lôi về tất cả partitions của RDDs nằm ở các nodes/machines khác nhau để tính toán trên 1 node.
![](/assets/images/trans-spark-RDD.png)


> Tóm lại để biết nó thuộc transformation hay actions operations thì nhìn kiểu dữ liệu trả về.

Ví dụ 1:

```
val lastYearLogs: RDD[String] = ...
val numDecErrorLogs
	= lastYearsLogs.filter(lg => lg.contains("2016-12") && lg.contains("error"))
				.count()
```

Đoạn code trên giúp cho ra số errors trong tháng 12/2016 được log trong một RDD chứa gigabyte logs. Mỗi phần tử trong RDD là 1 dòng log. 
Đề bài cho rằng format date trong log là "YYYY-MM-DD:HH:MM:SS" và error bắt đầu bằng chữ "error".

Ví dụ 2: sau đây cho thấy lợi ích của Laziness trong Spark đối với large-scale data.

```
val lastYearLogs: RDD[String] = ...
val firstLogsWithErrors = lastYearLogs.filter(_.contains("ERROR")).take(10)
```

Ở đây có thể nói method ``filter`` sẽ được thực hiện chậm lại đến khi nào ``take`` action được apply.
Spark sẽ phân tích và tối ưu các operations trước khi thực hiện. Spark sẽ không compute RDDs trung gian xong hết rồi cho kết quả, mà ngay khi 10 phần tử trong RDD vừa được computed - filter, Spark sẽ cho dừng và đưa kết quả luôn.
Điều này giúp tiếp kiệm thời gian, bộ nhớ computing các phần tử không cần dùng tới nếu filter hết chúng. 


##### Transformation trên 2 RDDs
![](/assets/images/2-rdd-transform.png)

##### Some useful Actions
![](/assets/images/rdd-action.png)


##### Caching & Persistence

Mặc định thì các RDDs sẽ tính toán lại các method transform mỗi lần bạn gọi method kiểu action. Như vậy sẽ tốn rất nhiều chi phí khi bạn sử dụng lại RDDs đó nhiều lần đặc biệt là trong các vòng lặp,..

Spark cho phép control những gì bạn cache ở memory, đưa RDDs vào memory và sử dụng lại mà không cần thực hiện transform lại giúp truy cập nhanh hơn. 
=> Dùng persist() hoặc cache()


Có nhiều cách cấu hình để data của bạn persisted:
* in memory dưới dạng regular Java object
* on disk dưới dạng regular Java object
* in memory dưới dạng serialized Java object (compact hơn)
* on disk dưới dạng serialized Java object (compact hơn)
* dàn trải ra in memory và on disk để tránh việc re-computation.
![](/assets/images/persist-spark-storage-level.png)

*cache()* : là 1 shorthand để sử dụng storage level mặc định, đó là nằm trong in memory chỉ dưới dạng regular Java objects.
*persist()* : có thể customize được method. Điền vào parameter loại storage level mà bạn muốn để persist data của bạn.

> Tóm lại, laziness trong Spark rất hữu ích khi làm việc với các tính toán large-scale distributed. Spark có thể đưa ra các phương án tối ưu trên *chain of operations* trước khi thực hiện tính toán.
> Ví dụ ``val numErrors = lastYearLogs.map(_.lowercase).filter(_.contains("ERROR")).count()``. Sau khi gọi map() và filter(), Spark biết là nó cần phải tránh duyệt data từ đầu đến cuối nhiều lần. Do đó, nó chỉ đi qua RDD một lần, tính toán kết quả của map() và filter() trong 1 lần duyệt qua data đó thôi, trước khi trả về kết quả count() cho chương trình.


#### How Spark jobs are executed?
Driver program (Master 	Node) là nơi chứa Spark Context dùng để tạo RDDs, phân bổ RDDs. Khi viết chương trình Spark là ta đang viết chương trình tương tác với Master Node để ra lệnh cho các worker.
Worker Nodes là nơi chứa executors để chạy các process (jobs) tính toán của chương trình.
=> Để Master 	Node giao tiếp với Worker Node thì cần có ``Cluster Manager`` có nhiệm vụ allocate các resources trên cluster, quản lý scheduling. Ví dụ như YARN/Mesos.


* driver program : là chương trình điều phối các process.
* driver : 
	* là nơi process hàm main() của chương trình thực thi
	* là nơi chạy các code như tạo SparkContext, tạo RDDs, stage up hoặc gửi đi các transformation và action.
* executor: 
	* chạy các task đại diện cho application
	* trả về kết quả tính toán cho driver
	* cung cấp bộ nhớ in-memory cho cached RDDs (store data).
Một Spark application là tập hợp các processes chạy trên 1 cluster.
Những process đó chạy computations và lưu data của chương trình, được gọi là ``executors``.

![](/assets/images/spark-execute-node.png)

Thứ tự thực thi của 1 Spark program như sau:

* Driver program chạy ứng dụng Spark lên và ứng dụng này sẽ tạo SparkContext ngay khi vừa bắt đầu chạy.
* SparkContext kết nối tới cluster manager - để phân bổ resources trên cluster.
* Spark lấy ra các excecutors trên các node trong cluster.
* Driver program gửi code ứng dụng (ví dụ các function) của bạn đến từng executors để mà các worker dùng code đó thực hiện trên data mà nó lưu giữ.
* Cuối cùng SparkContext đã "suy nghĩ xong" và gửi các task đến các executors để chạy. Sau đó trả kết quả về lại cho Driver program.


> Việc hiểu cách hoạt động của Spark sẽ giúp bạn hiểu được chương trình. Các function đang ở đâu, kết quả được trả về đâu. Hãy xem ví dụ sau đây:


![](/assets/images/ex-spark-action.png)

``foreach()`` là một action vì nó trả về kiểu Unit. Do vậy nó sẽ eagerly được thực thi trên executor chứ không phải driver. Bất kỳ lần gọi ``println`` bên trong hàm này chỉ sẽ xảy ra trên stdout của worker nodes và do đó nó sẽ không hiển thị trên driver node - nơi mà bạn đang chạy chương trình. 


![](/assets/images/ex2-spark-note.png)
Kết quả ``first10`` được trả về và nằm ở driver program. Các action kết nối kết quả từ worker node và node trên driver program.

=> chỉ bạn mới biết code của bạn đang được thực thi ở đâu: ở driver program hay executors


##### Reduction Operations
Một số method actions được phân loại là reduction operations.

Cơ chế hoạt động: đi qua collection và kết nối các element của collection lại để cho ra kết quả duy nhất.

Ví dụ :
```
val sum = list.fold(0)((x, y) => x + y)

// It then steps through the list, recursively applying the function to two operands: an accumulated value and the next element in the list.


//In the first step, the start value, 0,  acts as the first operand. The first element of the list acts as the second operand. The result of this computation becomes the first operand of the next step and the second element in the list, the second operand.
```

* ``foldLeft``: không parallelizable, vì apply binary operator cho start value và các element của collection hoặc iterator từ trái sang phải. Khi trả về kết quả sẽ bị lỗi TypeError nếu xử lý tính toán parallel (xem hình dưới).

![](/assets/images/foldleft.png)

* ``fold``: cho phép parallel nhưng giới hạn kết quả trả về và parameter trong function phải giống nhau.


Và ta sẽ tìm hiểu về **Aggregate**, đây là method chung cho cả Scala collection và Spark, nó có khả năng parallelizable và có thể thay đổi được kiểu trả về (foldLeft/foldRight thì riêng Spark không hỗ trợ vì nó không có khả năng parallel).
> Cú pháp: aggregate[B](z: => B)(seqop: (B,A) => B, combop: (B,B) => B) : B

=> Trong Spark, khi cần dùng đến foldLeft hay cho kết quả return type khác thì ta phải dùng method ``aggregate`` thay cho foldLeft/foldRight.

Có thể nói, hầu hết khi làm việc với large scale dataset, mục tiêu của chúng ta là xé nhỏ các dữ liệu phức tạp và lớn ra để tính toán và làm việc với dữ liệu. Method ``aggregate`` sẽ giúp chúng ta đi qua các element trong dữ liệu mà chúng ta quan tâm hoặc cần dùng tới mà không cần phải xử lý toàn bộ các element => tiết kiệm thời gian, bộ nhớ.
Do đó, ``aggregate`` được dùng nhiều trong Spark hơn Scala collection.


#### Pair RDDs

Khi làm việc với distributed data, rất hữu ích khi tổ chức dữ liệu thành các cặp key-value. Lí do vì pair RDDs cho phép chúng ta làm việc song song trên mỗi key hoặc regroup data bằng key trên network.
> Trong Spark, các cặp distributed key-value chính là "Pair RDDs".

``Pair RDDs`` sẽ đặc biệt có các method để làm việc với data thông qua key. Cách nhận biết pair RDDs bằng cú pháp thông qua parameter của nó phải là 1 cặp.
> RDD[(K,V)]

Một số method đặc biệt dành riêng cho pair RDDs như sau:

* def groupByKey(): RDD[(K, Iterable[V])]
* def reduceByKey(func: (V, V) => V): RDD[(K, V)]
* def join[W](other: RDD[(K, W)]: RDD[(K, (V, W))]

##### Tạo Pair RDDs:

```
val rdd: RDD[WikipediaPage] = ...

//Has type: org.apache.spark.rdd.RDD[(String, String)]
val pairRdd = rdd.map(page => (page.title, page.text))
```

input là 1 rdd và output là rdd gồm các cặp key-value gọi là pair RDD.


##### Shuffle
Vậy ta sẽ xem cách groupByKey và reduceByKey hoạt động như thế nào trên cluster để hiểu về shuffle nhé.

![](/assets/images/shuffle-groupByKey.png)

Quá trình shuffle là quá trình di chuyển các value vào cùng 1 key trên network và quy 1 cặp key-value về 1 node duy nhất quản trị key đó.
Từ đây ta cần phải tìm cách để giảm việc giao tiếp qua network của shuffle lại.

=> Dùng reduceByKey thay cho groupByKey
![](/assets/images/shuffle-reduceByKey.png)


Đây là kết quả so sánh khi chạy 2 kiểu code trên 6 node dùng Databrick:
![](/assets/images/benchmark-shuffle.png)


##### Partitioning
Vậy cluster chia các cặp key-value trên các node theo tiêu chí gì?

Data trong RDD được chia thành các partition. Đặc tính của partition:

* 1 partition không bao giờ trải ra các node khác nhau. Ví dụ các tuple trong cùng 1 partition sẽ được đảm bảo nằm trong cùng machine với nhau.
* Mỗi node chứa ít nhất 1 partition.
* Mặc định số lượng partition = số core của executor node. Nếu bạn có 6 worker node và mỗi node 4 core thì có thể bạn có 24 partition. Chúng ta có thể cấu hình được số lượng partition này.
* Partition chỉ hoạt động trên pair RDD vì nó phụ thuộc vào key để phân chia.
* Có 2 cách chia partition trong Spark:
	* Hash partitioning:
	Đầu tiên cần groupbyKey() cho pair RDD. Sau đó Spark sẽ phân chia partition theo công thức:
	```p = k.hashCode() % numPartitions```.
	Sau khi hashCode() key từ string ra int thì ta sẽ chia cho số partition mặc định là n để lấy số dư.
	Các key có số dư giống nhau thì sẽ nằm cùng partition p và được chuyển đến machine mà host partition p đó. 
	
	p/s: đây là kết quả test hashCode() trên Scala REPL để hiểu kết quả khi dùng trên int thì sẽ ra số tương tự, còn dùng trên string hay char thì sẽ ra số int.
	![](/assets/images/test-hashcode.png)

	
	* Range partitioning:
	Các loại key có thể thường được định nghĩa có thể sắp xếp theo thứ tự ví dụ như kiểu Int, Char, String. Do vậy trong nhiều trường hợp thì range partitioning hiệu quả trong việc phân chia partition đồng đều hơn. Các key sẽ được chia dựa theo:
	- Thứ tự của keys
	- Tập hợp range của các key sau khi được sắp xếp.
	Ghi nhớ đặc tính: Các tuples của các key trong cùng range sẽ được nằm trên cùng machine.
=> Cách này giúp data được balance trên các partition hơn.

Bây giờ ta sẽ tìm hiểu cách cài đặt partition trong chương trình nhé.
Có 2 cách để tạo RDDs với partition:
* C1: Gọi method ``partitionBy`` trên RDD, cung cấp module Partitioner.

```
val pairs = purchasesRdd.map(p => (p.customerId, p.price))

//khởi tạo object RangePartition theo cấu hình và RDD mong muốn apply
val tunedPartitioner = new RangePartitioner(8, pairs)
val partitioned = pairs.partitionBy(tunedPartitioner).persist()
```
CHÚ Ý: Nên ``persisted`` kết quả của partitionBy vì mỗi lần dùng tới RDD đó thì quá trình partitioning sẽ được thực hiện lại bao gồm cả shuffling.

Khi tạo 1 Partitioner ta cần input 2 thông tin:
1) Số lượng partition mong muốn.
2) Cung cấp 1 RDD có key có thể sắp xếp thứ tự.

* C2: Sử dụng các method transformation trả về RDD với các partitions của nó.
Những pair RDDs là kết quả của quá trình transformation trên một pair RDD được partition thì mặc định sẽ được cấu hình để dùng hash partitioner hoặc range partitioner tùy loại method transform.

Ví dụ: khi sử dụng sortByKey() thì RangePartitioner được sử dụng. Khi dùng groupByKey() thì HashPartitioner.

Dưới đây là các method sẽ tạo ra partitioned RDDs. Ngoài các method này thì sẽ cho kết quả không được partitioned.
![](/assets/images/partition-transform.png)

Ví dụ: map() hay flatMap() sẽ không đảm bảo giữ được giá trị của key. Mà key trong pair RDD chính là cái điều kiện để ta partition. Do đó ta sẽ dùng mapValue() để thực hiện transformation và bảo tồn được partitioner trong RDD.


Dùng join => mặc định Hash key trong cả 2 dataset => send element với cùng key to cùng machine => join element trên cùng machine => shuffling through network to right node.
> Cách này không hiệu quả bởi ``join`` operation không biết được các key đã được partition trong dataset như thế nào, dẫn đến quá trình shuffling diễn ra lộn xộn và mất time mặc dù data không thay đổi.

=> Cách xử lý vấn đề này là gì?
> Dùng partitionBy(new HashPartitioner(n)) trên tập data RDD lớn ngay khi bắt đầu chương trình để partitioning trước khi gọi "join" operation.
Lúc này, Spark sẽ biết là RDD này đã được hash-partitioned. Sau đó, khi gọi ``RDD.join(events)`` thì Spark chỉ shuffle cái ``events``gửi các data đến machine chứa hash partition key của RDD.

###### Khi nào thì ta biết shuffle xảy ra?

Shuffle trên network xảy ra khi result RDD phụ thuộc vào các element khác trong cùng RDD hoặc RDD khác.

Ngoài ra, chúng ta có thể biết được shuffle có được thực thi chưa hay được kế hoạch để thực thi thông qua:

* Kết quả trả về của 1 số transformation:
```
org.apache.spark.rdd.RDD[(String, Int)] = ShuffledRDD[366]
```
> 366

* Sử dụng hàm ``toDebugString`` để thấy execution plan:
```
partitioned.reduceByKey(XXX).toDebugString
```

Dưới đây là các method có khả năng tạo ra shuffle:
![](/assets/images/ops-shuffle.png)

Làm sao để giảm shuffle? Có 2 cách cũng như ví dụ:

* ``reduceByKey`` được chạy trên 1 RDD đã được partitioned trước đó sẽ giúp cho giá trị được tính toán trên local. Do đó chỉ cần shuffle khi gửi final result từ worker node đến driver node.
* ``join`` được gọi trên 2 RDDs đã được partitioned cùng kiểu partitioner và cache trên cùng machine sẽ giúp join được tính toán trên local, không cần shuffling thông qua network.


=> Bài toán Shuffles này sẽ phụ thuộc vào các bạn tổ chức data trên cluster và operations mà bạn dùng để xử lý data. Với cách partition hay tối ưu hóa việc shuffling tốt sẽ giúp bạn giảm thời gian xử lý data xuống rất nhiều lần.


#### Wide & Narrow Dependency

##### RDD được tạo thành từ những gì?

RDD được thể hiện bằng:

* Partitions: các "mảnh" của tập dữ liệu được đặt ở 1 hoặc nhiều node trên cluster.
* Dependencies: Model mối quan hệ giữa RDD child và RDD parent. Ví dụ partition của rdd con có mối liên hệ với partition nào của rdd cha.
* A function: rdd con nào cũng đều được tính toán từ rdd cha thông qua function.
* Metadata: thông tin về scheme của partition và vị trí đặt các partition đó.


##### RDD dependencies và shuffles

Shuffle xảy ra khi resulting RDD phụ thuộc vào các phần tử của RDD đang gọi method hoặc RDD khác.
Trong thực tế, RDD dependencies sẽ mã hóa (encode) khi phải di chuyển data trên network.

Các method transformation có thể gây ra shuffle, có 2 loại dependencies:
1) Narrow dependencies:
Mỗi partition của parent RDD sẽ được sử dụng bởi nhiều nhất 1 partition của child RDD. Nói cách khác, mỗi child partition sẽ chỉ có 1 parent partition.
=> Nhanh, không cần shuffle và có thể áp dụng tối ưu như pipelining.

2) Wide dependencies:
Mỗi partition của parent RDD có thể được phụ thuộc bởi nhiều child partition. 1 parent partition có thể tạo ra nhiều child partition.
=> Chậm, cần tất cả hoặc một số data shuffle trên network.


Các method transform sau đây được phân loại narrow hay wide dependencies:
![](/assets/images/kindofdependencies.png)

Các cách "truy tìm" xem model liên hệ giữa các RDD:

* Sử dụng method ``dependencies``
=> Trả về chuỗi Dependency objects được dùng bởi Spark's scheduler để biết mối quan hệ giữa các RDD, trả về các giá trị object được phân loại như sau:
	* Narrow dependency objects:
		* OneToOneDependency
		* PruneDependency
		* RangeDependency
		
	* Wide dependency objects
		* ShuffleDependency

* Sử dụng ``toDebugString``:
=> In ra mô hình lineage của RDD và các thông tin liên quan đến scheduling.
![](/assets/images/todebugstring.png)

##### Lineage (dag scheduling) & Fault tolerance

Lineage là chìa khóa cho fault tolerance trong Spark! Lineage được biểu diễn theo dạng các bước (stages).

Vì Spark sử dụng functional programming:
* RDD bất biến
* Sử dụng higher-order function như map, flatMap, filter để thực hiện các functional transformation trên data bất biến.
* Sử dụng function để tính toán ra child RDDs dựa trên parent RDDs chứ không thay đổi RDD.  

=> Giúp khôi phục failures bằng cách recomputing các partitions bị mất từ lineage graphs.
![](/assets/images/lineage-fault-tolerance.png)



#### Dataframe

Spark sẽ không biết chi tiết về cấu tạo của RDDs cũng như kiểu dữ liệu các attributes mà chỉ tương tác theo objects.
Trong khi đó Database/Hive sẽ rõ ràng với cấu trúc row/column với schema của table.
=> Spark sẽ dễ dàng tối ưu trên database hơn so với RDD. 

Dataframe được xem như là table trong database, là RDDs nhưng có schema được biết trước. Dataframe là core abstraction của Spark SQL và đặc biệt, chúng ``untype``.
> Trình biên dịch Scala không check được kiểu dữ liệu của DF, DF có thể có các record ở bất cứ kiểu dữ liệu nào, trong khi RDD thì có kiểu dữ liệu ví dụ như RDD[String].
=> Spark kết hợp SQL queries với Scala để ứng dụng những optimizations vào Spark jobs.
=> Spark SQL : Đây là Spark module cho structured data processing được implement như 1 thư viện trên Spark.

Spark SQL có 3 APIs:

* SQL literal syntax
* Dataframes
* Datasets

2 backend component đặc biệt giúp code chạy nhanh hơn:

* Catalyst: query optimizer
* Tungsten: off-heap serializer

![](/assets/images/spark-ecosystem.png)


Để bắt đầu sử dụng Spark SQL, ta cần ``SparkSession``:

```
import org.apache.spark.sql.SparkSession

val spark = SparkSession.builder().appName("My App")
//.config("spark.some.config.option","some-value")
.getOrCreate()
```

Để tạo Dataframe ta có 2 cách:

* Từ RDD đã tạo:
Cả với schema tự suy ra hoặc với schema tự tạo.
* Đọc từ data source cụ thể từ file với structured hoặc semi-structured format, định dạng cho phép: CSV, JSON, parquet, JDBC.  


--------------------------
##### Tìm hiểu về cách lập trình với Scala.

Scala có các quy tắc và các kiểu hình thức coding với function, variable. Chuyên đề này sẽ tìm hiểu về một số định nghĩa.

* function literal: là function ẩn danh, mặc định không có tên và có thể được gán tên bằng cách binding nó với một variable. Đây là dạng function được dùng thường xuyên trong Scala.

```
scala> (a:Int, b:Int) => a + b
res0: (Int, Int) => Int = <function1>
scala> (i: Int) => { i * 2 }
res1: Int => Int =<function2>

scala> val x = List.range(1, 10)
x: List[Int] = List(1, 2, 3, 4, 5, 6, 7, 8, 9)
scala> val evens = x.filter((i: Int) => i % 2 == 0)
evens: List[Int] = List(2, 4, 6, 8)
```

* function value: hàm là một biến được gán công thức trước đó.

```
khởi tạo 1 function value :

scala> val x = List.range(1, 10)
x: List[Int] = List(1, 2, 3, 4, 5, 6, 7, 8, 9)

khởi tạo function value tên ft

scala> val ft = (i: Int) => i % 2 == 0
ft: Int => Boolean =<function6>

truyền ft như 1 argument vào filter và sử dụng placeholder( “_” )

scala> val evens = x.filter(ft(_))
evens: List[Int] = List(2, 4, 6, 8)
```

* closure: là function mà giá trị trả về thay đổi phụ thuộc bởi 1 hoặc nhiều variable được định nghĩa bên ngoài function.

```
đây đơn thuần là 1 function literal

val multiplier = (i:Int) => i * 10

ta thay 10 bằng 1 biến được khai báo trước đó,bên ngoài function :

val multiplier = (i:Int) => i * factor
```


##### Some Scala code syntax:

* Function:
	* c1: 
	val f2: (Int, Int) => Int = f
	
	* c2:
	val f: Function1[Int,String] = myInt => "my int: "+myInt.toString
	
	* c3:
	val f2: Int => String = myInt => "my int v2: "+myInt.toString

=> the type Int => String, is equivalent to the type Function1[Int,String] i.e. a function that takes an argument of type Int and returns a String.

* Higher-order function:

Là một hàm thỏa ít nhất một trong các điều kiện sau: lấy một hoặc nhiều hàm làm đối số, hoặc/và trả về kết quả là một hàm.

```
// sum takes a function that takes an integer and returns an integer then
// returns a function that takes two integers and returns an integer
def sum(f: Int => Int): (Int, Int) => Int =
  def sumf(a: Int, b: Int): Int = f(a) + f(b)
  sumf

// same as above. Its type is (Int => Int) => (Int, Int) => Int
def sum(f: Int => Int)(a: Int, b: Int): Int =  ...

// Called like this
sum((x: Int) => x * x * x)          // Anonymous function, i.e. does not have a name
sum(x => x * x * x)                 // Same anonymous function with type inferred

def cube(x: Int) = x * x * x
sum(x => x * x * x)(1, 10) // sum of 1 cubed and 10 cubed
sum(cube)(1, 10)           // same as above  
```

* Dấu underscore : thường được dùng để chỉ 1 giá trị nào đó tại ví trí _ đó.
Chi tiết đọc tại: https://www.baeldung.com/scala/underscore

----------------------------
##### Cài đặt Scala REPL, Spark.
https://www.freecodecamp.org/news/installing-scala-and-apache-spark-on-mac-os-837ae57d283f/

Trường hợp tải đi mạng quốc tế chậm ví dụ tốc độ đo bằng kB thì thêm ``proxychains4`` ví dụ proxychains4 brew install apache-spark sẽ giúp tăng tốc do proxy qua server quốc tế.
