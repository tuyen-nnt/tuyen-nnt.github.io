---
layout: post
title:  "React Native - CSS rules"
author: tuyennnt
categories: [ React, App ]
image: assets/images/react-css.png
---

Phân biệt các attribute quan trọng sau để build giao diện trong react native:

* flexDirection: "row" hoặc "column"
* justify-content : "center"
main/primary axis phụ thuộc vào flexDirection, ta có space-evenly
* align-items : "center"
căn chỉnh secondary axis cho mỗi line, có các loại như center, baseline,...


* flexWrap: "wrap" 
để các component ko bị chèn ép mất đi
* align-Content : căn chỉnh toàn bộ nội dung của 1 block trên secondary axis, chỉ hoạt động khi có flexWrap.

* align-self
* flex: 1
* flexBasis: 100,
 //width (nếu main là row) or height, phụ thuộc vào primary axis (main)
 * flexGrow: 1 
 //giống flex : 1, trải ra đầy màn hình 
 * flexShrink: 1
 //giống flex : -1, co lại để ko tràn màn hình 
 
 * bottom, right, left, top : di chuyển qua trái, phải bao nhiêu pixel
 
 * position: "absolute" hoặc "relative"
 //giá trị mặc định trong react native là "relative"
 
 *Dimensions: import thư viện này trong react
 DIP công thức như sau:
 Physical Pixels = DIPs x Scale Factor
 vd điện thoại có scale là 2 và point điểm ảnh là 320x480 thì View đối với Width có giá trị 150 là 150x2=300
 => nghĩa là bề ngang là 1/2 màn hình
 ![](/assets/images/dip-react.png)
 


