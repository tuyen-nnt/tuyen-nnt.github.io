---
layout: post
title:  "Import Data - Part 1"
author: tuyennnt
categories: [ Data ]
image: img/import1.png
---


#### 1. Flat file

* Là file text thông thường chứa các record tổ hợp bởi các trường hoặc attribute (thuộc tính) và mỗi trường chứa nhiều nhất 1 thông tin.
* Flat file chứa các row và mỗi row là 1 record. 
* Flat file chỉ dùng để chứa dữ liệu của 1 bảng tính.
* Nó không có relationships như relational database
* Rất phổ biến trong data science 

Các loại flat file:

* ``.csv``
* ``.txt``
* Có dấu phân cách ``,`` hoặc ``tab`` 

#### 2. Các cách import Flat file
Có 2 loại package chính để import, tùy trường hợp sử dụng:

* ``NumPy`` : nếu dữ liệu column cơ bản là số, vì:
	* Nó là lưu dữ liệu số dạng mảng một cách hiệu quả và nhanh
	* Nó cần thiết cho các package khác như ``scikit-learn`` sử dụng trong Machine-learning.
	* Nó có nhiều hàm hỗ trợ để dễ dàng import các mảng data số như ``loadtxt()`` và ``genfromtxt()``.
	
* ``pandas`` : nếu dữ liệu column là cả số lẫn string, dataframe là dtype sinh ra để lưu dạng hỗn hợp này.


##### Import flat file bằng NumPy

```
# Import package
import numpy as np

# Assign filename to variable: file
file = 'digits.csv'

# Load file as array: digits
digits = np.loadtxt(file, delimiter=',')

# Print datatype of digits
print(type(digits))
```

* Hàm ``np.loadtxt()``tạo object numpy dạng mảng, cần 2 tham số là:
	* Tên file
	* Dấu phân cách
	
* Chúng ta có thể tùy chỉnh bằng cách thêm các tham số khác vì NumPy có nhiều sự lựa chọn:
```
# Import numpy
import numpy as np

# Assign the filename: file
file = 'digits_header.txt'

# Load the data: data
data = np.loadtxt(file, delimiter='\t', skiprows=1, usecols=[0,2])

# Print data
print(data)
```

* Các tham số ở trên bao gồm:
	* ``skiprows= n`` : không lấy data của n dòng đầu tiên để đưa vào mảng, vì có thể đó là header hoặc các record mà ta không muốn lấy.
	* ``usecols=[]`` : tùy chọn những cột mà ta muốn lấy giá trị cách nhau bởi dấu phẩy, index côt bắt đầu từ 0 đến n-1 (với n là số côt).
	* ``print(array_object)`` : dùng để in object mảng ra console.
	
	
```
# Assign filename: file
file = 'seaslug.txt'

# Import file: data
data = np.loadtxt(file, delimiter='\t', dtype=str)

# Print the first element of data
print(data[0])

# Import data as floats and skip the first row: data_float
data_float = np.loadtxt(file, delimiter='\t', dtype=float, skiprows=1)

# Print the 10th element of data_float
print(data_float[9])
```

* Trong trường hợp set data của bạn có chứa các value với kiểu dữ liêu khác nhau ví dụ như giá trị dòng đầu tiên là header chứa string data. 
Có 2 cách để xử lý:
	* *Cách 1*: Thêm tham số ``dtype=str`` để tất cả các giá trị khi import vào đều là string, và không bị báo lỗi ``ValueError``.
	* *Cách 2*: dùng tham số ``skiprows=n``, với n là số row sẽ skip từ row đầu tiên. Cách này nếu chúng ta biết được row nào có chứa giá trị khác các giá trị còn lại mà gây ra ``ValueError``.
	
```
# Plot a scatterplot of the data
plt.scatter(data_float[:, 0], data_float[:, 1])
plt.xlabel('time (min.)')
plt.ylabel('percentage of larvae')
plt.show()
```

* Sau khi có mảng data ta có thể tùy biến thành biểu đồ như mã code trên.


#### 3. Import các loại file khác
##### Excel spreadsheets
```
# Import pandas
import pandas as pd

# Assign spreadsheet filename: file
file = 'battledeath.xlsx'

# Load spreadsheet: xls
xls = pd.ExcelFile(file)

# Print sheet names
print(xls.sheet_names)
```
* Lưu ý ở đây biến``xls`` mới chỉ là object Excel do pandas định nghĩa, chưa phải là dataframe. Vì excel có nhiều sheet nhưng 1 dataframe chỉ có thể là 1 sheet. Nên ta sẽ xử lý ở bước sau.
* Hàm ``.sheet_names`` in ra tên tất cả các sheet trong bảng tính.

```
# Load a sheet into a DataFrame by name: df1
df1 = xls.parse('2004')

# Print the head of the DataFrame df1
print(df1.head())

# Load a sheet into a DataFrame by index: df2
df2 = xls.parse(0)

# Print the head of the DataFrame df2
print(df2.head())
```

* Hàm ``.parse()`` sẽ giúp rút trích df (sheet) của excel file và cần ta đưa vào tham số là tên của sheet hoặc chỉ số từ 0-(n-1), với n là số lượng sheet để load dataframe.

##### Pickled file (chuỗi byte hay bytestream => native trong Python)
* Thực tế có những dạng datatype như dictionary hay list không có cách nào rõ ràng đưa vào lưu trong flat file như các datatype numpy.array hay pandas.dataframe. Do đó, pickle file ra đời. Đây là loại file dùng ngôn ngữ native mà con người đọc không hiểu. Nếu như bạn chỉ muốn import data thì chỉ cần *serialize* datatype dict hay list,... bằng cách convert nó sang dạng bytestream để trở thành pickled file.
* Ở bài này, chúng ta chưa nói đến cách convert, mà sẽ học cách mở file pickled đã được convert sẵn và lưu ở local thay vì mở flat file như đã học trước đó.

> Có thể hiểu pickled file là file hỗ trợ bạn lưu dữ liệu có datatype kiểu dictionary, list,...

##### SAS7BDAT file ``.sas``
SAS là viết tắt của Statistical Analysis System, dùng trong BA, BI, tính toán phân tích data hay thống kê về sinh học,...

```
# Import sas7bdat package
from sas7bdat import SAS7BDAT

# Save file to a DataFrame: df_sas
with SAS7BDAT('sales.sas7bdat') as file:
    df_sas = file.to_data_frame()

# Print head of DataFrame
print(df_sas.head())
# Plot histogram of DataFrame features (pandas and pyplot already imported)
pd.DataFrame.hist(df_sas[['P']])
plt.ylabel('count')
plt.show()
```

##### Stata file ``.dta``
Là sự kết hợp giữa statistics + data, dùng trong các nghiên cứu học thuật data về dịch tễ hay khoa học xã hội.
 
```
import pandas as pd
df = pd.read_stata('disarea.dta')
```

##### HDF5
Là loại file dùng để lưu trữ lượng data số lớn lên đến hàng trăm GBs hay TBs, thậm chí có thể scale lên Exabytes
```
# Import packages
import numpy as np
import h5py

# Assign filename: file
file = 'LIGO_data.hdf5'

# Load file: data
data = h5py.File(file, 'r')

# Print the datatype of the loaded file
print(type(data))

# Print the keys of the file
for key in data.keys():
    print(key)
```

```
# Get the HDF5 group: group
group = data['strain']

# Check out keys of group
for key in group.keys():
    print(key)

# Set variable equal to time series data: strain
strain = data['strain']['Strain'].value

# Set number of time points to sample: num_samples
num_samples = 10000

# Set time vector
time = np.arange(0, 1, 1/num_samples)

# Plot data
plt.plot(time, strain[:num_samples])
plt.xlabel('GPS Time (s)')
plt.ylabel('strain')
plt.show()
```

##### MATLAB ``.mat``



each row is an instance of entity type
