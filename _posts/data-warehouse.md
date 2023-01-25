
#### Overall steps to create data warehouse 
Planning (biz requirement by analyst & scientist, data model by engineer & database admin) =>  Implementation(pipeline designed & built by engineer, BI app by analyst & scientist) => Support/Maintenance (maintenance by engineer, test & deploy )


Source layer (all data sources for warehouse) => Staging layer (include ETL process & temporary database) => Storage layer (data warehouse & mart) => Presentation layer (reporting, BI/Analytics tools, Direct queries)


#### Các Data warehouse architecture:
- Inmon Top-down:
Data sources => ETL => Data warehouse => Data marts => Data mining/Analytics.
Pros: single source of truth, normalization = less storage, easy to change data marts.
Cons: more joins = slower response time, lengthy upfront work = higher startup cost for defining data models.


- Kimball Bottom-up: getting from data to reporting asap.
Data sources => ETL => Data mart => Data warehouse => Data mining/Analytics.
Pros: upfront development speed = lower cost, denormalized = user friendly.
Cons: increase ETL processing time (due to denormalization), greater possibility of duplicate data, ongoing dev needed every time a new department appears.



### OLAP & OLTP

OLAP: 
- Support analysis with large amount of data.
- Reorganize data into multidimensional formats.
- Key to OLAP system is OLAP cube, if > 3 dimensions is hypercube with faster processing with traditional relational databases.
- Read-only queries.

OLTP:
- Design to process simple queries such as update, insert,...
- Used in source system to data warehouse.
- Tracking transactions.
- Format in rows & columns.


### Data modeling

* Fact table: 
	- Measurements, metrics or facts about one process transaction of the organization. 
	- Like quantity of sales, taxes collected for each sale order & the date, the customer, product name are foreign keys to dimension tables to provide more details about the sales.

* Dimension table: 
	- Contain attributes and characteristics that describe the data in the fact table.
	- Holds reference data.
	- Helps add more info to fact table.
	
#### Star schema

- Has 1 central fact table with one or more dimention tables.
- Dimensional table connects directly with fact table.

#### Snowflake schema

- The same as star schema but at least 1 dimensional table connected through another dimensional table to refer to fact table.
- In a snowflake schema, at least one-dimensional table cannot be joined directly to the fact table.

	

#### Kimball 4 step process


1) Select the organizational process
Ex: Invoice and billing; Product quality monitoring; Marketing.

2) Declare the grain
- Grain = level to store fact table
- A level of data that cannot be split further.
Ex: Music service => Song grain
=> Helps team to answer question like "Which song is the most popular?"

3) Identify the dimensions
- Choose dimensions that apply to each row
- Answer question like "How to describe the data?"
- Biz users and analysts = valuable feedback
Ex: Time (year, quarter, month), Location (address, state, country), Users (names, email)

4) Identify the facts
- Numerical facts for each fact table row.
- Ask yourself "What are we answering?" to identify numberical facts to include.
- Metrics should be true at selected grain.
Ex:
- Music service: total number of sales, sales revenue of a song



#### Slowly changing dimensions (SCD)

A slowly changing dimension is a dimension that contains relatively static data which can change slowly but unpredictably.

Overtime, some values in our dimentional tables need to be updated. Ex: the price of gold change by time, each time the price referenced to the fact table is different.

There are 3 historic solutions:

- Type I: 
	- Update value in table (overwrite)
	- Will lose any history
	
- Type II:
	- Add a row with the updated value, new ID to track.
	- The history is retained
	- Add new collumn as Start date and End date to track the time when new values are in effect.
	- A Type II approach maintains historical reporting because all references to historical facts point to the old row within the dimension table.
	
- Type III:	
	- Add collumn to dimensional table to track changes. Ex: Category => add PastCategory.
	- If rerun a historical report, reference thhe PastCategory collumn => change code for historical reports (ex: if run_date < 09012023, apply old collumn)
	- Should add a column to track the date when we change.
	
There is a modern approach:
- Lower storage cost
- Update value as Type I
- Warehouse system creates snapshot the whole dimension table and stores it.	
- If rerun historical report, use the snapshot at available current time (at run_time/run_date).

	
=> Understanding how an approach will affect historical reporting should be an important consideration in choosing an approach to slowly changing dimensions.


#### Row & column data store

Choosing a suitable format is important for optimizing queries for speed.

- Column store format for data warehouse tables is best for analytic workloads.

##### Basics of computer storage

- Computer stores data  in block.
- It reads the required blocks when retrieving data.
- Reading fewer blocks increase the overall speed of the process.

##### Row store
- Row data is stored together in blocks.
- Ideal for transactional workload.
- Add block data is faster column store.


##### Column store
- Column data is stored together in blocks.
- Ideal for analytical workload.
- Better data compression.
- Less read when answer an analytic question. Ex: Average percentage of something in 2019 => only 2 blocks (2019 & percentage) need to be read. Instead of read all blocks has 2019 like row store.
- Add block data is slower because it re-categorize to put in appropriate block.


#### ETL & ELT

##### ETL

- Data transformed during the move.
- Uses separate system to process data.
- Pros:
	- Lower data storage cost.
	- PII security compliance.
- Cons:
	- Transformation errors/changes require new data pulls from source.
	- Cost of separate system to process data.
	
##### ELT

- Data is loaded, then transformed.
- Uses the warehouuse to transform the data.

- Pros:
	- No separate system to process data
	- Transformation can be rerun without impacting source systems.
	- Works well for near-realtime requirements, because load data is not in complicated transformation process.
	
- Cons:
	- Increased storage needs from raw data.
	- Compliance with PII security standards, store sensitive data before transformed.
	
	
#### Data cleaning in Transform

Evaluate before implementing in combination of some techniques:
- Data format revision
	- Update value to an expected format: Date, Names of options, Capitalization.
	- Ensure output is in a consistent format by using organizational rules.
	
- Address parsing
	- Divide a street address into its components such as City, State, Zip.
	
- Data validation: 2 kinds
	- RANGE check: "Is the value within the expected range?"
	Ex: person's age
		- 
		
	- TYPE check: "Is the value the proper data type?"
	Ex: Age is with String is invalid, must be Integer.
=> It is better to fix the issue in the input source if possible, if not maybe use organizational rule to set a default value or exclude rows that fail validation checks.

- De-duplication: remove repeated rows of data.


##### Data governance

A strong data governance looks to develop rules & definitions around the data and detect & correct the data the deviates from its definitions. A solid organizational data governance program will require less data cleaning within the ETL or ELT process.

=> Aims to reduce data cleaning

