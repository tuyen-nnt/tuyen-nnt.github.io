
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

	

### Kimball 4 step process


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


