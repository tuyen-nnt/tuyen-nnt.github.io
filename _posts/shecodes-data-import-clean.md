
#### IMPORT

Import và save file:

![](/assets/images/read-save.png)



Kiểu dữ liệu có 2 loại:
- Numerical data
- Categorical data 

![](/assets/images/data-type.png)


Xem chi tiết dữ liệu trong dataframe:
![](/assets/images/data-info.png)

#### CLEAN

* Thiếu
![](/assets/images/missing.png) 
Lưu ý khi thay thế dữ liệu là mình đặt vào sự suy đoán của mình, người dùng phải được ý thức là trường đó đã được thay đổi. 

* Format
* Normalization
![](/assets/images/normalization.png) 

Nếu từ -3 đến 3 thì bình thường, > 3 thì dữ liệu bất thường

* Binning

![](/assets/images/binning.png) 

* Category => Numerical 
![](/assets/images/cate-to-num.png) 

Convert data:
![](/assets/images/convert.png) 

NaN là Not a n
None là không gì cả, vô nghum

df.isnull().sum() 


##### Các cách quan sát dữ liệu:
* Dùng ``groupby`` rồi dùng ``df.pivot(index=, column=)``


* Dùng matplotlib
```
plt.pcolor(df, cmap=)
plt.colorbar()
plt.show()
```

* Correlation (nó chỉ cho mối quan hệ, không cho ra hệ quả): ``df.corr()``
Vẽ biểu đồ bằng package seaborn. Chấm gần linear thì mỗi quan hệ nó càng gần nhau, nếu trùng với linear thì x tăng 1 thì y tăng 1.

	* Tuyến tính dương
	sns.regplot(...)
	* Tuyến tính âm
	* Weak correlation : ko rõ ràng tương quan quan hệ giữa x và y (khi mà corr = hoặc gần = 0)
	* Pearson Correlation: đo mức độ liên quan giữa 2 features (Coefficient Corr và P-value)
![](/assets/images/pearson.png) 
	Về P-Value:
![](/assets/images/p-value.png) 
	
	
* Chi-square test: chỉ ra 2 loại có quan hệ gì thôi chứ không chỉ rõ quan hệ gì.

* Categorical variables:
Dùng ``sns.boxplot(x=, y=,data=df)`` để visualize và suy đoán. 


* Xem mô tả df:
Dùng ``df.describe()``. Mặc định không lấy những cột object.
Để tính thống kê của object ta dùng ``df.describe(include="object")``

* Đổi tên cột trong df:
Dùng ``df.rename(column="abc" : "xyz", inPlace= True)``

	
	

