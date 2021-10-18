### Giới thiệu thư viện Bootstrap

1. Framework

Thuật ngữ framework

Thuật ngữ framework có nghĩa khác nhau tùy thuộc vào tình huống và công việc. Thông thường, các framework có nhiệm vụ làm cho công việc của bạn dễ dàng hơn bằng cách cung cấp code và cấu trúc.

Một khi bạn tìm hiểu cách sử dụng một framework, bạn có thể lập trình trang web của mình một cách nhanh chóng và dễ dàng mà không cần thay đổi quá nhiều code.

Đối với các lập trình viên front-end (liên quan đến giao diện người dùng), framework cung cấp các công cụ cho CSS, JavaScript và jQuery.

Đó là những đoạn code nhỏ mà bạn có thể sử dụng để có được một giao diện tức thì mà bạn đang tìm kiếm. Và đôi khi là một hành vi tức thời mà bạn đang tìm kiếm với JavaScript và jQuery.

Giới thiệu các framework

    Bootstrap được phát triển vào năm 2011. Đó là một trong những framework đầu tiên và được sử dụng phổ biến hàng đầu. 
    Foundation là framework được phát triển bởi ZURB vào năm 2011. Nó không phổ biến bằng Bootstrap
    Một số framework khác là: Semantic UI, Pure của Yahoo!, Ulkit của YooTheme

2. Giới thiệu Bootstrap

Bootstrap là một framwork để tạo ra các trang web và nó được nhiều nhà thiết kế web biết đến.

Nó tập trung vào cách tiếp cận responsive (tương thích với nhiều kích thước màn hình), mobile-first (nghĩ đến màn hình điện thoại di động đầu tiên) và điều này có nghĩa là thiết kế responsive được tích hợp sẵn

Và chúng thực hiện tốt nhiệm vụ của mình để đảm bảo rằng các trang của chúng trông thật đẹp trên màn hình nhỏ. Và sau đó xây dựng dần dần từ đó.

Bootstrap bao gồm các template (mẫu) CSS và HTML mà bạn có thể sử dụng và tái sử dụng.

Bootstrap cũng có các phần mở rộng JavaScript, thực sự tiện dụng, bởi vì nó là một cách để thêm JavaScript vào các trang của bạn, ngay cả khi bạn không biết cách sử dụng JavaScript

Cuối cùng, Bootstrap có điều nổi bật "interfaces and layouts" (giao diện và bố cục). Nó mang lại cho chúng ta giao diện và cảm nhận rất quen thuộc với những trang web đã được thực hiện với Bootstrap.

Một số lợi ích khi sử dụng Bootstrap

    Hệ thống lưới

Bootstrap có một hệ thống lưới 12 cột rất tiện dụng. Công dụng của nó là giải quyết các vấn đề về khoảng cách. Nếu bạn đã mất nhiều thời gian cố gắng căn giữa một thứ trong trang hoặc bố trí 3 cột liên tiếp và tạo khoảng cách giữa chúng, bạn biết rằng điều đó có thể tốn rất nhiều thời gian.

Hệ thống cột này đã tích hợp thiết kế responsive điều này khiến nó trở thành một lựa chọn thực sự hấp dẫn.

    Tích hợp jQuery

Bootstrap cố bao gồm tất cả các chức năng jQuery phổ biến. Chúng bao gồm accordion, với nội dung có thể thả xuống và kéo lên, các menu drop-down (thả xuống), và cũng carousel (băng chuyền) cho hình ảnh….

    Sử dụng phổ biến

Bootstrap có giao diện và cảm giác quen thuộc. Nhiều trang web sử dụng Bootstrap, và khi bạn sử dụng nó, nó giúp làm cho trang web của bạn và các biểu mẫu mà bạn muốn mọi người điền vào trông hợp lệ hơn.

    Tăng tốc việc lập trình

Bạn có thể có một trang web trông rất tuyệt thực sự chỉ trong một vài phút.

    Không phụ thuộc vào các trình duyệt

Bootstrap sẽ trông tuyệt vời dù mọi người đang sử dụng trình duyệt nào. 

Nó là responsive theo mặc định. Bạn không cần phải làm bất cứ điều gì để làm cho nó trông đẹp trên các trình duyệt khác nhau.

    Có thể tùy chỉnh

Bạn có thể thay đổi các giá trị để nó có giao diện mà bạn muốn. Bootstrap cũng cung cấp công cụ giúp bạn lựa chọn các giá trị tùy chỉnh phù hợp với nhu cầu sử dụng.

Bạn cũng có thể quyết định sử dụng một hay nhiều phần trong đó.

Mời các bạn học viên tìm hiểu chi tiết về nội dung bài học tại đây:

    Frameworks

    Giới thiệu về Bootstrap 3

Dưới đây là danh sách các phiên bản của Bootstrap để bạn tham khảo: Bootstrap versions

### Phân chia các loại màn hình trong Bootstrap

Bootstrap có breakpoint mặc định được hardcode cho các khung nhìn (viewport) khác nhau. Nó cũng sử dụng quan điểm mobile-first, nghĩa là ưu tiên cho màn hình mobile. 

Trong Bootstrap, các kích thước rất nhỏ sẽ được viết tắt là xs (extra small). Bất kỳ thiết bị nào có chiều rộng tối thiểu là 480 pixel sẽ được tính là xs. 

Các thiết bị nhỏ và máy tính bảng được gọi là sm (small), chiều rộng tối thiểu là 768 pixel.

Đối với các thiết bị trung bình và máy tính để bàn, chúng ta sử dụng code này md là viết tắt của medium. Đây là bất kỳ thiết bị nào có chiều rộng tối thiểu là 992 pixel.

Khung nhìn cuối cùng được gọi là lg (large), và điều này dành cho các thiết bị lớn và màn hình rộng.

Bất cứ thiết bị tối thiểu là 1.200 pixel sẽ được chọn bởi breakpoint lớn.

Mặc dù Bootstrap hardcode chúng, bạn có thể thay đổi chúng. Bạn có thể tùy chỉnh các giá trị này trước khi bạn tải về code Bootstrap.

Bạn có thể sửa đổi các file css của Bootstrap hoặc đừng quên, bạn luôn có thể viết các media query (truy vấn media) của riêng bạn để thêm các điểm kích hoạt mới.


### Bootstrap container

Container là một phần không thể thiếu trong Bootstrap. Container được sử dụng để thiết lập lề (margin) cho nội dung, giúp nội dung thích ứng với bố cục của bạn. Container để bao gói các phần nội dung trên website hay tạo các hộp nội dung.

Có 2 class container là .container và .container-fluid:

    .container cung cấp các container được fix chiều rộng dựa trên độ rộng của màn hình hiển thị.
    .container-fluid cung cấp các container với chiều rộng full, mở rộng toàn bộ chiều rộng vừa với vùng xem (viewport).
    
### Cài đặt Bootstrap cho trang web

Có ba cách để đưa Bootstrap vào trang web:

        Tải và nhúng vào trang web 
        Sử dụng tham chiếu tuyệt đối để link đến code (CDN)
        Liên kết đến CodePen

1. Tải và nhúng vào trang web 

Bạn có thể truy cập trang web, getbootstrap.com, và có một link để dễ dàng tải về. 

Khi tải xuống, bạn cũng có tùy chọn để tùy chỉnh các giá trị trước khi tải xuống. Điều này sẽ giúp bạn tiết kiệm thời gian, nếu bạn biết có một số breakpoint (phạm vi giới hạn của chiều rộng màn hình) màu sắc hoặc các style khác mà bạn muốn dùng và bạn không muốn sau này, mình lại ghi đè chúng

2. Sử dụng CDN

CDN (Content Delivery Network: mạng phân phối nội dung) cung cấp một cách để sử dụng một tham chiếu tuyệt đối hoặc một link để có được code bootstrap.

Chúng ta có thể đi đến link https://getbootstrap.com và họ sẽ cung cấp cho bạn code mà bạn cần dùng

Đây là đoạn code dành cho Bootstrap 3:

<!-- Latest compiled and minified CSS --> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"> 

<!-- Optional theme --> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous"> 

<!-- Latest compiled and minified JavaScript --> 

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

Bằng cách thêm những điều này, bạn không còn phải giữ một bản sao. Điều đó thực sự tiện dụng nếu bạn dự định tạo nhiều phiên bản khác nhau của trang web của bạn. Tuy nhiên, mỗi khi sử dụng, máy tính cần kết nối đến nguồn tài nguyên này. 

3. Liên kết đến CodePen

Nếu bạn sử dụng CodePend, bạn bắt đầu bằng cách tới phần Settings, sau đó là CSS, tìm với từ khóa Bootstrap và chọn kết quả:


### Hệ thống lưới trong Bootstrap

Bootstrap có thể coi mọi phần tử như một thứ mà bạn có thể chia nhỏ thành 12 cột. Chú ý: Hệ thống lưới trong Bootstrap không phải là bảng. 

Chiều ngang chia thành 12 cột. Do đó, nếu chúng ta có thể dùng 3 cột, nó tương đương với chiều rộng là 25%, 6 cột là 50%, 9 cột là 75%. Tất cả 12 cột có nghĩa là chiếm toàn bộ chiều rộng của trang hoặc phần tử đó.

Mỗi lưới trong Bootstrap bao gồm một class container một class row (hàng) và sau đó là một hoặc nhiều class column (cột).

Cú pháp:

    <div class="container">

        <div class="row">

            <div class="col-xx-yy">      

            </div>

        </div>

    </div>

    xx sẽ là kích thước khung nhìn. Đó là các giá trị xs, sm, md, lg mà chúng ta đã biết.
    Và yy sẽ là số cột mà bạn muốn sử dụng.

Ví dụ: 

    class = “col-xs-12” - trên một màn hình rất nhỏ (xs), nó sẽ chiếm toàn bộ chiều rộng
    class = “col-sm-8” – trên màn hình nhỏ (sm), nó chiếm 8 cột 

Trên màn hình càng nhỏ, chúng ta có xu hướng sử dụng số cột nhiều hơn, để đảm bảo đối tượng có kích thước phù hợp. Nếu chúng ta định nghĩa một thứ cho extra small, thì theo mặc định nó cũng sẽ áp dụng cho small, medium, large

Kết hợp nhiều quy tắc

Bạn cũng có thể kết hợp nhiều quy tắc trên một đối tượng. Ví dụ: class = “col-xs-12 col-sm-8”

Thay đổi vị trí

Theo mặc định, Bootstrap sẽ đặt mọi thứ ở càng sát cạnh bên trái càng tốt khi nó định vị chúng. Tuy nhiên, có thể thêm một class push và pull trên các yếu tố khác nhau.

Ẩn đối tượng

    hidden-xx: hiển thị yếu tố này trên tất cả các khung nhìn ngoại trừ khung hình chúng ta nhắc đến ở đây
    visible-xx: ẩn một thứ gì đó đi. Nó không nên được hiển thị trừ khi tôi đang ở trên màn hình có kích thước này.

sr-only

Đây là một class tiện ích Bootstrap đặc biệt cho screen reader (bộ đọc màn hình). Nó ẩn nội dung cho tất cả mọi người, trừ khi họ đang sử dụng screen reader để truy cập trang. Nếu họ dùng screen reader, thì chỉ có họ mới thấy yếu tố này thôi

Sau khi tìm hiểu về hệ thống lưới, các bạn hãy áp dụng vào ví dụ được trình bày qua video hướng dẫn sử dụng lưới của Bootstrap:

<div class="container">

    <div class="row">

        <div class="col-md-6 col-lg-3">

            <div class="visible-xs visible-sm">

                Extra small and Small screen

            </div>

            <div class="visible-md">Medium Screen</div>

            <div class="visible-lg">Large Screen</div>

        </div>

        <div class="col-md-6 col-lg-3">

            <div class="visible-xs visible-sm">

                Extra small and Small screen

            </div>

            <div class="visible-md">Medium Screen</div>

            <div class="visible-lg">Large Screen</div>

        </div>

        <div class="col-md-6 col-lg-3">

            <div class="visible-xs visible-sm">

                Extra small and Small screen

            </div>

            <div class="visible-md">Medium Screen</div>

            <div class="visible-lg">Large Screen</div>

        </div>

        <div class="col-md-6 col-lg-3">

            <div class="visible-xs visible-sm">

                Extra small and Small screen

            </div>

            <div class="visible-md">Medium Screen</div>

            <div class="visible-lg">Large Screen</div>

        </div>

    </div>

</div>


### Tạo hàng và cột


* Tạo hàng trong bootstrap:

https://www.freecodecamp.org/learn/front-end-development-libraries/bootstrap/create-a-bootstrap-row

* Tách cột trong bootstrap:

https://www.freecodecamp.org/learn/front-end-development-libraries/bootstrap/split-your-bootstrap-row

### Sử dụng Menu trong Bootstrap

Khi bạn tạo thanh điều hướng, một trong những điều đầu tiên bạn phải quyết định là loại link bạn muốn.

Bootstrap cung cấp nav-tabs và nav-pills.

1. class nav-tabs

Tạo menu như sau:

    <ul class="nav nav-tabs">

        <li role="presentation" class="active">

            <a href="#">Home</a>

        </li>

        <li role="presentation">

            <a href="#">Profile</a>

        </li>

        <li role="presentation">

            <a href="#">Profile</a>

        </li>

        <li role="presentation">

            <a href="#">Message</a>

        </li>

    </ul>

Đây là kết quả:

2. nav-pills 

Tạo menu có hình button:

Một khi bạn đã quyết định dùng nav-pills hay nav-tabs bạn sẽ cần xem xét bố cục.

Bạn có muốn thanh điều hướng của bạn nằm ngang (horizontal), dọc (vertical), trung tâm (justified)?

Một lựa chọn khác mà chúng ta có thể sử dụng là nav-justified. Khi bạn sử dụng nav-justified, nó sẽ lấy tất cả link của bạn có và chia chúng ra theo tỷ lệ

Với chế độ xem nhỏ, nó sẽ xếp theo cột dọc. Với chế độ xem lớn hơn, nó sẽ là horizontal.

dropdown menu

Nó cho phép tạo menu hai hay nhiều cấp. Nó xổ xuống menu con khi chúng ta kích chuột vào.

    <ul class="nav nav-pills nav-justified" style="margin-left: 100px;">

        <li role="presentation" class="active">

            <a href="#">Home</a>

        </li>

        <li role="presentation" class="dropdown">

            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>

            <ul class="dropdown-menu">

                <li><a href="#">Option One</a></li>

                <li><a href="#">Option Two</a></li>

                <li><a href="#">Option Three</a></li>

            </ul>

        </li>

        <li role="presentation">

            <a href="#">Message</a>

        </li>

    </ul>

3. Các lựa chọn khác

    navbar-fixed-top: sẽ gắn menu ở bên trên. Đó tương ứng với position fixed top
    navbar-fix-bottom: gắn menu ở bên dưới.
    navbar-static-top: tương ứng với static….. 
