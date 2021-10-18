#### 1. Một số hàm Javascript để thao tác với DOM

* document.getElementById(id): Trả về một thành phần (node) theo id truyền vào

* document.getElementsByTagName(name): Trả về một danh sách các node, hoặc một mảng các phần tử theo tên thẻ truyền vào.

* document.getElementsByClassName(class): Trả về một danh sách các node, hoặc một mảng các phần tử theo tên lớp (class) truyền vào.

* element.innerHTML: lấy nội dung của thẻ và có thể thay đổi nội dung đó.

* element.style: lấy style của thẻ và có thể thay đổi style

* element.setAttribute(attribute, value): gán giá trị cho thuộc tính của thẻ.
    
    Ví dụ:
```
document.getElementById("success").setAttribute("style", "display: inline-block");
```

element.removeAttribute(attribute): xóa thuộc tính của thẻ
    
    
##### In kết quả ra trang web

Javacript có nhiều cách để in kết quả ra màn hình gồm: cảnh báo (alert), lời nhắc (prompt), document.write, innerHTML hoặc viết thông tin trực tiếp vào console.

Để bắt đầu viết mã HTML, chúng ta đặt nó trong thẻ script như sau:

<script>

        // Viết mã Javascript ở đây

    </script>

##### cảnh báo (alert): tạo ra một màn hình pop-up để hiển thị thông tin

Cú pháp: alert(message)

Ví dụ: ``alert(“Hello World”);``

Đặt đoạn mã sau vào trang html của bạn rồi mở trang bằng trình duyệt để thấy kết quả: 

   <script>

        alert("Hello world!");

    </script>

##### lời nhắc (prompt): cho phép người dùng nhập vào thông tin ở màn hình pop-up

Cú pháp: prompt(message) 

Ví dụ: prompt("Enter your name");

##### document.write: viết nội dung trực tiếp lên trang

Cú pháp: document.write(text) 

Ví dụ: document.write("Time to learn JavaScript");

Lưu ý: cách làm này có thể ghi đè lên những thứ khác đã tồn tại. Chúng ta không nên lạm dụng nó. Bạn chỉ nên sử dụng document.write khi bạn đang bắt đầu và khi bạn không biết một số phương thức phức tạp hơn. 

##### innerHTML: thay đổi nội dung của thẻ

Trước tiên, cần lấy ra thẻ sẽ thay đổi nội dung. Bạn có thể sử dụng document.getElementById

Tiếp theo, sử dụng innerHTML để thay đổi nội dung.

Cú pháp: element.innerHTML = value;

Ví dụ: Bạn đang có thẻ h1 như sau: <h1 id="test">Tester</h1>

Mã JavaScript sau đổi nội dung “Tester” thành “Hello World” 

document.getElementById("test").innerHTML = "Hello World"; 

##### console.log: ghi vào console của trình duyệt

Cú pháp: console.log(message)

Ví dụ: console.log("Leave a secret message");

Để thấy được đầu ra của câu lệnh này, bạn cần bật màn hình console trên trình duyệt. Thông thường, chúng ta chỉ cần ấn F12 và chuyển sang tab console sẽ thấy kết quả

##### Gỡ lỗi cho JavaScript

Để đi đến trình gỡ lỗi cho JavaScript, chúng ta sẽ thực hiện trên trình duyệt

- Safari: đi đến Preferences -> Advanced.

- Google Chrome: Developer -> Javascript Console

- Firefox: Tools -> Console

- Edge: F12

Tìm hiểu thêm DOM, DOM hướng đối tượng, Ouput tại đây : https://www.coursera.org/learn/javascript


Cho đoạn mã sau, đầu ra là gì?
```
var i = 10;
var j = i-- + --i;
console.log(i, j);
```
> 8 18


If, for example, i = 5:

* --i decrements i by 1 then gives you the value of i (4).

* i-- gives you the value of i (5) then decrements it by 1.

Both will give you the same result in a for loop.

----------------------------

### 2. Hàm (function)

#### Khái niệm hàm

Hàm là những bit của code mà bạn có thể tái sử dụng nhiều lần bằng cách mã hóa những gì chúng ta gọi là tên hàm. Chúng ta viết function một lần và chạy nhiều lần sau đó. 

Hàm giúp chúng ta không phải lặp lại mã mỗi khi cần dùng đến. Nó còn giúp tổ chức code một cách rõ ràng.

Để khai báo hàm, chúng ta dùng từ khóa function. Cú pháp:

        function functionName(parameters){

            // Code you want to run

        }

Ví dụ hàm không tham số:

        function welcomeMsg(){

            alert("Welcome to JavaScript");

        }

Ví dụ hàm có tham số:

        function welcomeMsg(msg){

            alert(msg);

        }

2. Lời gọi hàm

Khai báo một hàm thực sự chưa làm gì cho bạn cả. Bạn cần phải nói với máy tính khi bạn muốn hàm đó chạy. Chúng ta làm như vậy bằng cách gọi hàm. Chúng ta thực hiện lời gọi hàm bằng tên hàm và truyền vào giá trị cho tham số

Ví dụ: 

       var x = "Hello";

        welcomeMsg(x);

        x = "Goodbye";

        welcomeMsg(x);

3. Tham số của hàm

Một tham số của hàm là một biến được sử dụng trong một hàm. Các tham số của hàm hoạt động gần như giống hệt với các biến được định nghĩa bên trong hàm, nhưng có một điểm khác biệt: chúng luôn được khởi tạo với một giá trị được cung cấp bởi người gọi của hàm. Tên của tham số không quan trọng, nó giống như tên biến thông thường. Bạn có thể gọi là gì cũng được, miễn là phải nhất quán.

Ví dụ hàm có tham số:

        function welcomeMsg(msg){

            alert(msg);

        }

4. Giá trị trả về

Một số hàm trả về giá trị, số khác thì không. Tuy nhiên, các giá trị này có thể sau này được sử dụng cho các câu lệnh gán hoặc biểu thức có điều kiện.

Muốn trả về giá trị từ hàm, chúng ta dùng từ khóa return.

 function welcomeMsg(msg){

     alert(msg);

     var name = prompt("What is your name?");

     return name;

 }

Chúng ta nhận giá trị trả về của hàm thông qua lời gọi hàm và có thể gán giá trị vào biến

var firstName = welcomeMsg("Hi");


#### Tổ chức code 
A - Tổ chức code

1. Đặt trong thẻ head

Đặt code Javascript trong thẻ head giúp tách biệt code Javascript với phần HTML một cách rõ ràng. 

Chúng ta dùng thẻ <script>, ví dụ: 

<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>

    <script>

        function message(){

            alert("This alert box was called with the onload event");

        }

    </script>

</head>

Chúng ta có thể thực hiện lời gọi hàm trong phần <body>

<body>

    <h1>Functions</h1>

    <script>

        message();

    </script>

</body>

2. Đặt ở file bên ngoài

Đặt code Javascript ở file bên ngoài, có thể sử dụng lại nhiều lần ở nhiều file html khác nhau. Thông thường, chúng ta tạo thư mục có tên là js, rồi đặt tất cả file javascript ở thư mục đó.  Các file JavaScript có phần mở rộng là .js. Ví dụ: myScript.js. Trong file js sẽ chỉ chứa mã Javascript mà không có thẻ <script>

function message(){

            alert("This alert box was called …");

        }

Để nhúng file Javascript vào file html, chúng ta dùng thẻ <script> với thuộc tính src. Ví dụ: 

<script src="js/myScript.js"></script>

Chú ý: src là đường dẫn đến file javascript

3. Gỡ lỗi Javascript

Chúng ta dùng console để gỡ lỗi. Console được tích hợp sẵn trong trình duyệt. Bạn đi đến công cụ dành cho lập trình viên (F12) và chuyển sang tab Console.

Nếu bạn không chỉ định đúng đường dẫn đến file Javascript, thông báo lỗi sẽ được hiển thị:

B - Tổ chức thư mục

Mỗi project thường có nhiều file khác nhau, được xếp vào thành các loại:

    HTML: các file HTML
    CSS: các file CSS
    Image: các file ảnh
    JS: các file Javascript

Do đó, người ta cũng thường tổ chức thư mục tương ứng cho từng loại:

    File HTML thường đặt ở thư mục gốc
    File CSS đặt trong thư mục con tên là css
    File image đặt trong thư mục con tên là images
    File Javascript đặt trong thư mục con tên là js

Ví dụ như sau:

Liên kết từ file html

Từ file html cần sử dụng các tài nguyên như css, js hay image. Khi đó, chúng ta dùng các thẻ và đường dẫn tương ứng

  <link rel="stylesheet" href="css/custom.css">

  <script src="js/custom.js"></script>

  <img src="images/person_1.jpg" alt="">


-----------------
#### Event trong JS

1. Sự kiện

Sự kiện đến từ API (giao diện lập trình ứng dụng) của JavaScript. Trong Javascript đã định nghĩa sẵn hàng loạt các sự kiện cho đối tượng cụ thể. Đó là các sự kiện như: nhấp chuột (click), di chuyển chuột (mouser over), thay đổi giá trị (change), ….

Nếu người dùng nhấp vào một phần tử HTML, chúng ta muốn một hàm JavaScript nào đó chạy. Chúng ta cũng có thể có onmouseover, onresize, và rất phổ biến là onload.

2. Sự kiện hoạt động như thế nào?

Chúng ta gán hàm cho sự kiện. Và khi người dùng tương tác vào đúng sự kiện, hàm tương ứng với sự kiện sẽ được triệu gọi (invoke).

Ví dụ: <div onclick="Message('Hi');">Click me!!!</div>

3. Sự kiện click của button

Các button (nút) được tạo ra với mục đích rõ ràng, để người dùng nhấn vào. Do đó, nó có sự kiện quan trọng là onclick

<p id="demo">This is a paragraph</p>

<button type="button" onclick="displayDate();">Display Date</button>

Và trong phần Javascript, chúng ta thực hiện hàm:

  function displayDate()

  {

    document.getElementById("demo").innerHTML = Date();

  }

4. Các sự kiện khác

    Sự kiện của chuột (Mouse Events): onclick, ondbclick, onmousedown, onmouseenter, onmouseleave, onmousemove, onmouseout, …
    Sự kiện của bàn phím: onkeydown, onkeypress, onkeyup
    Sự kiện của khung: onload, onresize, onscroll, onerror, …

5. Từ khóa this

Video bài học dưới đây sẽ giải thích từ "this" và cách nó được sử dụng trong các ngôn ngữ lập trình. "this" cho phép một phần tử tham chiếu đến chính nó. 

Mọi đối tượng trong DOM, đều có một từ this được tạo tự động. Thuộc tính this này cho phép bạn truy cập và thông tin của phần tử. Nếu không có this, sẽ rất khó để các hàm biết nên dùng dữ liệu nào.

this cũng được dùng bên ngoài các hàm

6. Từ khóa this và sự kiện 

Khi các sự kiện xảy ra, this thể hiện cho chính đối tượng đang phát sinh sự kiện.  Ví dụ: khi chúng ta click vào button, this chính là button vừa được click. Khi chúng ta click vào ảnh, this chính là bức ảnh

Từ this, chúng ta có thể lấy ra các thuộc tính của đối tượng, hoặc thay đổi giá trị của đối tượng đó. 


---------------------

#### 3. Cấu trúc dữ liệu Mảng (array)

##### Khái niệm mảng

Mảng (array) giúp chúng ta khai báo nhiều giá trị đều được liên kết với một biến duy nhất. Do đó, mảng không phải là một giá trị đơn lẻ mà là cả một tập giá trị.

Các giá trị trong mảng có thể là các giá trị như chúng ta đã biết. Ví dụ như số, chuỗi (string), boolean hoặc đối tượng.

Để khai báo mảng, chúng ta dùng gặp dấu []. Từ khóa var vẫn được dùng như đã biết, theo sau là tên của mảng. 

Ví dụ mảng: 

    Mảng các số: var numbers = [7, 11, 6, 55, 98, 45, 16, 96, 46];
    Mảng các chuỗi: var foods = ["Bananas", "Apple", "Pizza"];
    Mảng các thành phần trong DOM:

var images = document.getElementsByClassName("img");

var listItems = document.getElementsByTagName("li");

##### Chỉ mục

Mỗi một trong các giá trị trong mảng được gọi là phần tử (elements). Người ta đánh chỉ mục cho các phần tử trong mảng. Bắt đầu từ giá trị 0 và lần lượt cho các giá trị tiếp theo, bên phải nó.

C# | Arrays - GeeksforGeeks

Bởi vì chỉ số của mảng luôn bắt đầu từ 0, nếu chúng ta có một mảng 9 phần tử (như hình trên), phần tử cuối cùng có chỉ mục là 8

Chúng ta có thể dễ dàng truy cập vào giá trị của phần tử nhờ chỉ mục. Ví dụ, muốn lấy phần tử đầu tiên, chúng ta viết  numbers[0]. Nó trả về giá trị 7. Tương tự,  numbers[3] trả về giá trị 55, …

Chúng ta cũng có thể thay đổi giá trị trong mảng bằng cách sử dụng chỉ số. Thay vì lấy giá trị ra, chúng ta gán giá trị cho nó như sau:

Numbers[0] = 20; 

Nghĩa là chúng ta thay đổi giá trị của phần tử đầu tiên trong mảng, thành giá trị mới là 20

#### Kích thước mảng

Kích thước mảng thể hiện cho số phần tử trong mảng đó. Mảng numbers có 9 phần tử, mảng foods có 3 phần tử,…. Để biết số phần tử của mảng, chúng ta dùng length. Cú pháp như sau:

numbers.length   -> trả về giá trị 9

foods.length -> trả về giá trị 3

#### Các phương thức với mảng

    sort(): giúp sắp xếp các phần tử trong mảng theo thứ tự tăng dần.  Ví dụ: foods.sort(); 
    push(): thêm một giá trị vào cuối dãy. Phương thức này nhận tham số là giá trị sẽ thêm vào. Ví dụ: foods.push("Kiwi");


---------------------------------------------------------

### 4. Biểu mẫu (form) trong HTML


Biểu mẫu là một cách cho phép người dùng gửi thông tin cho website. Nó tạo ra tương tác 2 chiều giữa website và người dùng. Trong biểu mẫu, sử dụng chu kì Request-Response (gửi yêu cầu – phản hồi yêu cầu)

Người dùng nhập dữ liệu vào các phần tử input khác nhau. Biểu mẫu truyền dữ liệu từ các input đó về các máy chủ để thực hiện các thao tác. 

Lưu ý: nội dung học hiện tại đang tập trung ở phía client. Do đó, chưa có server để thực hiện đầy đủ thao tác phía server. Chúng ta sẽ tìm hiểu phía server ở các môn học sau

Ở phần này, chúng ta sử dụng HTML, CSS và JavaScript mà để tập hợp một biểu mẫu.

#### Cách tạo một biểu mẫu

Thông thường, để có một ô nhập liệu, người ta thường dùng 1 cặp nhãn (label) và thẻ nhập (input, select, textarea, …). Tất cả được đặt trong biểu mẫu, được đánh dấu bởi thẻ <form>. Thẻ <form> cho trình duyệt biết, chúng ta đang muốn tạo một biểu mẫu, và có thể sẽ xử lí một số dữ liệu.

Thành phần thẻ nhập: cho phép người dùng nhập vào nội dung bằng cách gõ từ bàn phím (ví dụ: nhập tên, nhập địa chỉ,…), hoặc cũng có thể là chọn từ danh sách giá trị có sẵn (ví dụ: chọn phương thức thanh toán, chọn thể loại sách, …)

Thành phần nhãn: thường là tên của trường dữ liệu. Người dùng từ đó mà biết được cần điền dữ liệu cho đúng. Chúng ta có thể lựa chọn viết thành phần nhãn như là văn bản thông thường, hoặc sử dụng thẻ <label>. 

Đây là ví dụ mã html:  

 <form action="">

        <label for="name">Name</label>

        <input type="text" name="name" id="name"><br>

        <label for="email">Email</label>

        <input type="email" name="email" id="email"><br>

        <label for="birth">Birth</label>

        <input type="date" name="birth" id="birth"><br>

        <input type="submit" value="Click Here">

    </form>

Kết quả sẽ hiển thị trên trình duyệt như sau:

File preview

Ghi chú: form trên chưa áp dụng CSS. Chúng ta sẽ thực hiện thêm CSS ở phần sau

#### Thẻ label và 2 cách dùng

Thẻ <label> giúp tạo ra nhãn tương ứng với trường dữ liệu. Nó liên kết với trường dữ liệu và giúp người dùng dễ dàng thao tác hơn. Người dùng có thể click chuột hoặc chạm vào nhãn cũng có thể thao tác được với ô nhập liệu. Nó rất hữu ích khi người dùng sử dụng màn hình cảm ứng trên điện thoại hoặc ô nhập liệu khá nhỏ.

Có 2 cách để dùng thẻ label:

Cách 1: dùng thuộc tính for: Thẻ label gán id của thẻ nhập liệu vào thuộc tính for của nó để giúp tạo ra liên kết.

Ví dụ:

<label for="email-address">Email</label>

<input type="email" name="email" id="email-address">

Cách 2: đặt thẻ nhập liệu bên trong thẻ label

Ví dụ: 

<label>Email: <input type="email"></label>

#### Thẻ input và các loại input

Thẻ input là loại thẻ nhập liệu phổ biến nhất trong HTML. Nó sử dụng thuộc tính type để phân loại và hiển thị theo các cách khác nhau. Do đó, người dùng sẽ thấy và tương tác khác nhau.

    <input type="text">: tạo ra một ô nhập liệu với 1 dòng. Nghĩa là chúng ta có thể nhập bất kì kí tự nào. Nhưng chỉ được phép nhập trên 1 dòng
    <input type="password">: tạo ra ô nhập mật khẩu. Các kí tự sẽ bị che đi
    <input type="submit">: tạo ra nút để gửi dữ liệu biểu mẫu
    <input type="radio">: tạo ra nút dạng radio. Giống như nút bấm trên đài radio, ấn vào nút này thì nút khác sẽ bỏ chọn 
    <input type="reset">: tạo ra nút mà khi ấn vào, sẽ hủy toàn bộ dữ liệu đã nhập trên biểu mẫu. Biểu mẫu trở về trạng thái ban đầu
    <input type="checkbox">: tạo ra hộp kiểm (checkbox), người dùng có thể chọn tick hoặc không 
    <input type="button">: tạo ra nút thông thường
    <input type="date">: tạo ra ô nhập ngày, tháng, năm. Người dùng có thể chọn từ lịch
    <input type="email">: tạo ra ô nhập email. Người dùng cần nhập đúng định dạng email 
    <input type="file">: người dùng có thể tải file từ máy tính lên web 
    <input type="hidden">: tạo ra trường ẩn. Người dùng không nhìn thấy
    <input type="number">: tạo ra ô nhập số. Người dùng chỉ có thể nhập giá trị số hoặc chọn số
    <input type="range">: tạo ra thanh trượt. Người dùng kéo để chọn giá trị 
    <input type="search">: tạo ra ô nhập giá trị tìm kiếm
    <input type="tel">: tạo ra ô nhập số điện thoại 
    <input type="datetime-local">: ô nhập liệu gồm cả ngày tháng năm, giờ phút, sáng/chiều  (AM/PM)
    <input type="time">: ô nhập liệu gồm giờ phút, sáng/chiều  (AM/PM)
    <input type="week">: ô chọn tuần trong năm 
    <input type="month">: ô chọn tháng trong năm 
    <input type="color">: ô chọn màu từ bảng màu 
    <input type="url">: ô nhập đường dẫn (url) 


#### Các thuộc tính của thẻ input

* Thuộc tính name: thuộc tính name được sử dụng để chỉ định tên của trường dữ liệu. Hầu hết mọi kiểu input phải có tên thuộc tính đi kèm với nó. Bởi nếu không có và đến lúc bạn phát triển mảng back end, nếu bạn quyết định làm việc với các server, thì thông tin đó có thực sự được gửi đến trình duyệt hay không.

    Thuộc tính id: Id là định danh của thẻ. Theo cách hiểu thông thường, định danh này là duy nhất trong 1 tài liệu html. Id chỉ được dùng tương tác với các ngôn ngữ phía client như html, css, javascript.

    Thuộc tính value: thuộc tính value thể hiện giá trị mà thẻ đang có. Ở phần sau, khi sử dụng Javascript để đọc form, chúng ta sẽ đọc các giá trị này.

    Thuộc tính required: chỉ định ô nhập liệu phải được điền dữ liệu, không được để trống.

    Thuộc tính checked: chỉ định thành phần có đang được chọn hay không. Nếu chọn, nó là checked. Thuộc tính này chỉ sử dụng với type=”checkbox” hoặc type=”radio”

    Thuộc tính placeholder: sẽ hiển thị gợi ý về việc nhập dữ liệu vào ô. Nó rất giống với value, nhưng thay vào đó, nó cung cấp một gợi ý. Nó xuất hiện mờ mờ bên trong ô nhập liệu. Và khi người dùng bắt đầu nhập dữ liệu, nó sẽ biến mất.

    Thuộc tính maxlength: chỉ định số kí tự tối đa có thể nhập vào

    Thuộc tính min: chỉ định giá trị nhỏ nhất

    Thuộc tính max: chỉ định giá trị lớn nhất

    Thuộc tính readonly: chỉ định ô nhập liệu chỉ có thể đọc giá trị mà không thể thay đổi nó 

---------------------

### 5. Kiểm duyệt dữ liệu

#### Sử dụng đúng kiểu input (thuộc tính type)

Chúng ta có thể kiểm duyệt dữ liệu bằng cách sử dụng đúng kiểu input. Với từng giá trị của thuộc tính type, bạn sẽ phân loại được dữ liệu. Ghi chú: xem lại mục Thẻ input và các loại input ở video trước

#### Sử dụng thuộc tính của thẻ 

Một số thuộc tính như required, maxlength, min, max, placehoder,…. giúp kiểm duyệt dữ liệu. Người dùng sẽ không thể nhập giá trị vi phạm các quy tắc đã chỉ ra. 

Với type=”number” hoặc type=”range”

min: để chỉ định giá trị nhỏ nhất mà người dùng có thể nhập

Ví dụ: chỉ cho phép nhập tuối từ 18 trở lên 

<input type="number" name="age" id="age" min="18">

max: chỉ định giá trị lớn nhất mà người dùng có thể nhập

Ví dụ: chỉ cho phép nhập giá trị tuổi không quá 65

<input type="number" name="age" id="age" min="18" max="65">

required: người dùng phải nhập giá trị

Ví dụ: người dùng phải nhập tuổi

<input type="number" name="age" id="age" min="18" max="65" required>

maxlength: người dùng không thể nhập quá số kí tự

Ví dụ: người dùng không thể nhập tên dài quá 30 kí tự

<input type="text" name="name" id="name" maxlength="30">

#### Sử dụng khuôn mẫu (pattern)

Pattern chỉ hoạt động với input type = text. Nó buộc người dùng sử dụng một định dạng cụ thể. Chúng ta thường dùng khi yêu cầu người dùng nhập vào số điện thoại, số thẻ tín dụng, ….

Ví dụ: 

pattern="[0-9]{5}": yêu cầu nhập 5 chữ số

pattern="[0-9]{13-16}": yêu cầu nhập từ 13 đến 16 chữ số

pattern="[a-zA-Z]+": chỉ cho phép nhập kí tự thường hoặc kí tự HOA

#### Sử dụng JavaScript

Javscript là cách mà bạn sẽ thực hiện kiểm duyệt cho trường hợp cụ thể, nếu hai cách trên chưa đáp ứng được. Bạn sẽ viết mã Javascript để thực hiện lấy dữ liệu và kiểm duyệt theo quy tắc tùy chỉnh. Nó đảm bảo người dùng đã nhập đúng thông tin mà bạn mong đợi.

------------------------
### CSS Website Layout 

Website được chia thành headers, menus, content và footer.

* Đối với Content, layout phụ thuộc vào target user. Thường sẽ dùng 1 hoặc kết hợp nhiều loại gồm:
	* 1-column (often used for mobile browsers)
	* 2-column (often used for tablets and laptops)
	* 3-column layout (only used for desktops)

Bên dưới demo cách tạo 3-column layout và đổi nó thành 1-column layout khi gặp màn hình nhỏ hơn:

```
 /* Create three equal columns that float next to each other */
.column {
  float: left;
  width: 33.33%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other on smaller screens (600px wide or less) */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
} 
```

Tip:
> To create a 2-column layout, change the width to 50%. To create a 4-column layout, use 25%, etc.

##### Unequal Column 
* Đôi khi bạn muốn layout content thành những cột khác kích thước nhau. Khi đó bạn có thể tùy chỉnh thông số width như mong muốn. Lưu ý tổng thông số width cho cùng 1 ``row`` là 100%.

Ví dụ trong CSS ta cài đặt: 

```
.column {
  float: left;
}

/* Left and right column */
.column.side {
  width: 25%;
}

/* Middle column */
.column.middle {
  width: 50%;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}
```

Giờ phân tích chi tiết làm như thế nào nhé:
* Lưu ý: thường thì sẽ phải có thêm element <div class =row> là element mẹ, rồi đến con <div class =column>


```
/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 15px;
}
```

* Như file CSS trên thì trong HTML, element chứa class ``column`` sẽ có 2 element con chứa class con ``.side`` và ``.middle``.
* Element của class ``column`` sẽ quản lý 100% các cột của element con, nghĩa là tổng width các coluumn/class con cộng lại = 100%.

 Tham khảo code hoàn thiện:
 https://www.w3schools.com/css/tryit.asp?filename=trycss_website_layout_blog
 
#### Responsive Design là gì?

##### Responsive web design là gì?

Người dùng truy cập trang web của chúng ta từ nhiều thiết bị khác nhau. Hiện nay, các thiết bị rất đa dạng về kích thước và độ phân giải. Vì vậy, chúng ta muốn đảm bảo rằng phía chúng ta sẽ, những gì chúng ta gọi là hoạt động, dưới bất kỳ nền tảng nào, bất kỳ kích thước trình duyệt hoặc bất kỳ định hướng nào.

Ví dụ: trên màn hình nhỏ, chúng ta cần hiển thị ít thông tin hơn, để người dùng tập trung vào nội dung chính. 

##### Media queries

Media queries phát hiện và sử dụng kích thước của khung hình. Nó cũng phát hiện ra các thông tin khác về thiết bị mà trình duyệt đang hiển thị trên đó. Như là hướng của thiết bị (ngang-dọc), loại thiết bị (màn hình máy tính hay sách đọc), độ phân giải (resolution)

##### Bố cục dạng lưới

Bố trí dựa trên lưới linh hoạt cho kích thước tương đối. Tùy thuộc vào kích thước màn hình lớn hay bé, mà lưới sẽ hiển thị cho phù hợp. 

Thông thường, người ta chia màn hình thành 12 cột. 

##### Flexible images

Khi truy cập trang, người dùng không lãng phí thời gian để cuộn chuột qua lại. Hoặc phải thay đổi kích thước để xem được mọi thứ. Chúng ta cần làm cho nó xảy ra một cách tự động.

##### Các ví dụ

Trang web https://mediaqueri.es cung cấp các ví dụ điển hình. Trang web này tổng hợp các trang web khác nhau mà nó tìm được thực sự giúp tìm ra chìa khóa để đạt được responsive design.


#### Tự kiểm tra Responsive Design

* Cách 1: Tự thay đổi kích thước màn hình

Đây là cách làm đơn giản. Bạn sử dụng chuột để thay đổi kích thước khung. Chỉ cần kéo khung cho nhỏ lại, hoặc to ra theo ý muốn.

Tuy nhiên, cách này khó thực hiện trên màn hình tablet hoặc mobile

* Cách 2: sử dụng công cụ online

Để kiểm tra, bạn có thể điền vào URL của trang web mà bạn muốn xem. Nó sẽ hiển thị kết quả trên 4 nền tảng khác nhau. Gồm: máy tính để bàn, máy tính xách tay, chế độ xem máy tính bảng và chế độ xem điện thoại di động. Bạn có thể thấy rằng mỗi máy tính là một chút khác nhau tùy thuộc vào nền tảng tôi đang sử dụng. 

* Cách 3: sử dụng công cụ giả lập của Chrome

Chrome cung cấp chức năng giả lập cho phép chúng ta xem trang web trên các loại màn hình phổ biến. 

Bạn bật công cụ developer tool (F12), và lựa chọn chức năng Chuyển chế độ thiết bị (hình chiếc điện thoại).

Bạn có thể tùy ý lựa chọn thiết bị, hoặc tự thay đổi kích thước theo mong muốn.

#### Lợi ích của Responsive Design

##### Ba lựa chọn thiết kế

* Lựa chọn 1: thiết kế Responsive Web Design (RWD) bằng các phép đo (co giãn), sử dụng lưới linh hoạt và các quy tắc CSS khác nhau.

* Lựa chọn 2: thiết kế adaptive – trả về các phiên bản khác nhau của trang dựa trên các thiết bị khác nhau. Máy chủ tìm ra loại thiết bị bạn đang chạy và sau đó trả về HTML và CSS cụ thể cho trang đó. Vì vậy, bạn có thể nhận được code hoàn toàn khác nhau tùy thuộc vào thiết bị bạn đang sử dụng. Máy chủ có thể trả lại code sai nếu phát hiện ra kiểu thiết bị sai.

* Lựa chọn 3: tách riêng trang dành cho mobile. Trang này thường được đánh dấu là .m. Thực chất, đây là trang web được tách riêng. Các cỗ máy tìm kiếm có thể hiểu lầm đây là trang web khác. Do đó, bạn cần sử dụng các mối quan hệ "canonical" và "alternate".

##### Lợi ích của Responsive Design

 * Thứ nhất, việc chia sẻ dữ liệu của bạn dễ dàng hơn rất nhiều nếu bạn chỉ có một URL duy nhất. Bạn không muốn phải có nhiều phiên bản để phát cho mọi người nếu họ muốn truy cập trang web của bạn.

* Nó cũng dễ dàng hơn cho các công cụ tìm kiếm như Google để lập chỉ mục trang hoặc đánh dấu để biết rằng bạn đã từng xem trang đó và để xếp hạng trang đó.

* Thứ 2 là ít tập tin hơn có nghĩa là ít bảo trì hơn. Nếu bạn có code HTML khác nhau cho các nền tảng khác nhau, nếu bạn thay đổi một, đó không phải là bảo trì tất cả chúng. Bạn phải đi vào và cập nhật từng tập tin một.

* Thứ 3: nếu bạn có một nơi duy nhất mà bạn đang đi đến một URL duy nhất, sau đó bạn sẽ ít phải chuyển hướng hơn. Chuyển hướng (redirection) là khi bạn truy cập một trang web và bạn thấy rằng URL đang được thay đổi khi server cố gắng tìm ra loại thiết bị bạn đang sử dụng và loại trang hoặc URL bạn nên được chuyển hướng đến. 

Tuy nhiên, việc thực hiện responsive design sẽ làm tăng chi phí khi xây dựng trang web.


#### Các đơn vị đo kích thước

##### Các đơn vị đo tuyệt đối (absolute measurement)

Pixel là đơn vị đo tuyệt đối rất phổ biến. Một pixel về cơ bản là một điểm trên màn hình của bạn. 1 pixel bằng 1/96 của một inch. Hầu hết các màn hình hiện nay đang sử dụng đơn vị pixel. Ví dụ: kích thước màn hình laptop thông thường là 1366px theo chiều ngang.

Các đơn vị mm (milimet), cm (centimet), in (inch) hoặc pt (point) không được sử dụng phổ biến. 

##### Các đơn vị đo tương đối (relative measurement)

Đơn vị đo tương đối được tính dựa trên kích thước của đối tượng bao hàm, đối tượng bên cạnh hoặc trên kích thước màn hình, hay những sự vật khác tương tự.

* Đơn vị phần trăm (%)

Giá trị phần trăm luôn liên quan đến một số giá trị khác, ví dụ: độ dài.

Vì vậy, nếu bạn nói rằng bạn muốn một cái gì đó là 75%, nó sẽ kiểm tra sự vật bao hàm và đặt nó là 75%.

* em

Kích thước em đi kèm với tên của nó vì nó muốn là kích thước phông chữ của phần tử chữ em.

Nếu bạn sử dụng 1em, nó sẽ có cùng kích thước như vậy.

1.1 em thì sẽ lớn hơn một chút, lớn hơn 10%.

0.9 em sẽ nhỏ hơn kích thước mặc định.

* Một đơn vị đo khác mà bạn có thể sử dụng là rem. Thay vì dựa vào kích thước phông chữ của cha, ông. Kích thước của rem dựa vào kích thước phông chữ cài đặt gốc

##### Sử dụng viewport

Là đơn vị kích thước dựa trên khung hình. Có hai đơn vị là vw (viết tắt của viewport width – chiều rộng) và vh (viết tắt của viewport height – chiều cao)

1vw = 1/100 chiều rộng của khung hình.

1vh = 1/100 chiều cao của khung hình.

--------------------------------------

### Sử dụng Media Queries

#### Media queries 

Media query được hỗ trợ từ CSS 2.1. Media query sẽ cho phép chúng ta điều chỉnh style của các trang web, tùy thuộc vào các thuộc tính của các media mà chúng ta đang xem xét.

Vì vậy, chúng ta có thể xem xét kích thước trình duyệt, chiều rộng và những số đo khác để quyết định cách tốt nhất để bố trí nội dung của chúng ta. Nó sẽ không áp dụng tất cả các style sheet mà chỉ áp dụng những style phù hợp với quy tắc của nó. Nó cũng cho phép chúng ta sử dụng các loại media khác nhau. 

Với CSS3, chúng ta có nhiều khả năng hơn vì style có thể phụ thuộc vào nhiều thuộc tính hơn. Chúng ta có thể nhìn vào chiều rộng, chiều cao, hướng và thậm chí cả độ phân giải màn hình.

Ngoài ra, chúng ta có thể thêm các toán tử Boolean để tăng công suất. Và toán tử Boolean đơn giản là các and và or đơn giản.

##### Cú pháp media query

Mỗi media query có hai thành phần: loại media và query (truy vấn) thực tế của thuộc tính media.

Loại media có thể là: ``screen, speech, print hoặc all``

Ví dụ: @media screen and (min-width: 500px)

##### Sử dụng media query

* Cách 1: sử dụng @import trong file style. Ví dụ:  @import url('smallstyle.css') screen and (min-width: 600px)
* Cách 2: viết trực tiếp @media trong CSS. Ví dụ: @media screen and (min-width: 500px)
* Cách 3: thêm phần chỉ định media trong liên kết. 

Ví dụ: <link rel="stylesheet" href="css/custom.css" media="screen and (min-width: 400px)">


#### Wireframe

Wireframe cung cấp một biểu diễn trực quan của layout. Đế xây dựng trang web, chúng ta cần thực hiện thiết kế trước khi code. Bước đầu tiên của thiết kế là xây dựng wireframe. 

Wireframe thường được thể hiện bằng các bản vẽ phác thảo. Bạn sẽ quyết định những thứ sẽ thể hiện trên trang. Nó bao gồm cả văn bản và đồ họa.

Wireframe cho chúng ta một cái nhìn trực quan về sản phẩm, giúp bạn có thể điều chỉnh và quyết định sớm nhất có thể. Bạn cũng nên suy nghĩ về chức năng khi bạn đang thực hiện các wireframe. Thiết kế không chỉ có mỗi layout. Bạn có thể sử dụng các wireframe này để kiểm tra tương tác mà trang của bạn cũng có thể trải qua. Ví dụ: điều hướng, input biểu mẫu, những thứ khác tương tự.


#### Phân chia các loại màn hình

##### Breakpoint (điểm chia)

Breakpoint là kích thước hoặc vị trí xác định sự thay đổi trong layout trang web hoặc nội dung của bạn. Ví dụ, bạn có thể thiết lập một breakpoint ở 500 pixel, 800 pixel và 1.000 pixel.

Chúng ta sử dụng các breakpoint này để cung cấp trải nghiệm tốt nhất có thể cho người dùng dựa trên thông tin thiết bị mà chúng ta có.

##### Xác định breakpoint

Mọi người thường thiết lập các breakpoint dựa trên một trong hai điều: ``thiết bị và nội dung``

Về thiết bị: bạn cần dựa vào kích thước của các thiết bị thực tế. Trong khi hiện nay có rất nhiều thiết bị, với kích thước rất đa dạng. Do đó, bạn nên lựa chọn sao cho có thể gom nhóm một cách phù hợp. Thông thường người ta chia thành 4 hoặc 5 mức khác nhau. Đây là một ví dụ về cách sử dụng breakpoint trong Bootstrap 4

```
Extra small  <576px

Small    ≥576px

Medium   ≥768px

Large  ≥992px

Extra large  ≥1200px
```

Về nội dung: bạn nên xác định bạn muốn gì ở đó, quyết định xem nó có trông thực sự ổn so với cái bên cạnh hay không? Điều này hoàn toàn phụ thuộc nội dung của bạn.

Trong nhiều trường hợp, thiết kế trên thiết bị di động khó khăn hơn so với trên màn hình rộng. Do đó, người ta cần ưu tiên thiết kế trên thiết bị di động trước. Thuật ngữ đó là mobile first.

##### Áp dụng Media Queries

Quá trình sử dụng media query để thực hiện responsive design gồm 3 bước:

* Bước 1: sử dụng thẻ meta viewport

<meta name="viewport" content="width=device-width, initial-scale=1">

Thẻ này sẽ lấy ra thông tin về kích thước khung hình. Nó không chỉ giúp trình duyệt của bạn biết rằng bạn sẽ thực hiện thiết kế responsive. Nó thực sự có thể giúp tối ưu hóa công cụ tìm kiếm của bạn.

* Bước 2: sử dụng fluid layout

Nếu bạn sử dụng breakpoint, một số đơn vị kích thước tuyệt đối không được sử dụng thường xuyên. Thay vào đó, các đơn vị tương đối như phần trăm (%) hay em.

Chú ý: đơn vị phần trăm cho padding và margin bị ảnh hưởng bởi chiều rộng, không phải chiều cao trang của bạn

* Bước 3: sử dụng media query

Fluid layout được kích hoạt bởi những breakpoint nhất định mà bạn muốn sử dụng. Ở đây, chúng ta dùng quy tắc: thiết kế cho màn hình nhỏ hơn và làm việc lớn hơn 

Ví dụ: 

@media only screen and (min-width: 1024px) {

    body{

        background: blue;                

    }

}

###### Sắp xếp thứ tự code

Style sheet luôn bắt đầu từ trên cùng và đi dần xuống dưới. Do đó, bạn cần chú ý để sắp xếp thứ tự code cho phù hợp với logic. 

Ví dụ:
```
<style>

    body {

        background: green;

    }

    

    @media only screen and (min-width: 780px) {

        body {

            background: yellow;

        }

    }

   

    @media only screen and (min-width: 1024px) {

        body {

            background: blue;

        }

    }

</style>
```

Video tiếp theo sẽ hướng dẫn sử dụng media query để tạo ra responsive navigation (điều hướng đáp ứng). Trong video nhắc đến các kiến thức: 

* Padding và margin điều chỉnh khi thay đổi kích thước màn hình.
* Sử dụng các breakpoint
* Media query: @media all and (min-width: 900px)

##### Responsive Web Design cho Images 

https://www.w3schools.com/css/css_rwd_images.asp

