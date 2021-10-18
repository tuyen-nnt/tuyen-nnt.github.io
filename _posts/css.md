### Khái niệm và sử dụng CSS

Giới thiệu CSS

HTML được sử dụng để tạo cấu trúc của trang. Cùng một file HTML có thể trông khác nhau khi xem trên các trình duyệt khác nhau. Mỗi trình duyệt đều có style mặc định khác nhau của riêng mình. Có một số khác biệt nhỏ khi hiển thị trang HTML lên các trình duyệt khác nhau. Nhưng nói chung, giao diện của trang HTML thực sự đơn giản.

Để làm cho các trang web đẹp, sinh động và tạo phong cách, chúng ta dùng CSS.

Ví dụ: <h1 style="color: blue;">Styled Heading</h1>

CSS là viết tắt của Cascading style sheets.

Cú pháp CSS

Cú pháp CSS như sau:

selector {

     property: value;

}

Trong đó:

    Selector là bộ chọn, nó giúp chọn ra các thẻ sẽ được áp dụng
    Property là tên thuộc tính CSS. Có rất nhiều thuộc tính trong CSS. Bạn sẽ lần lượt tìm hiểu
    Value là giá trị của thuộc tính. Nó sẽ ảnh hưởng trực tiếp đến hiển thị trên trang web.

Các trình soạn thảo sẽ hỗ trợ để hiển thị màu sắc khác nhau giữa selector, property và value như bên dưới.

h1{

    color: blue;

}

Ví dụ này trên chỉ ra rằng tất cả các thẻ h1 sẽ có màu là blue (màu xanh)

Comment (chú thích) trong CSS

Muốn tạo chú thích trong CSS chúng ta dùng cặp /* và */

Ví dụ:

h1{

    /* Chuyển màu của thẻ h1 thành màu xanh */

    color: blue;

}

Bạn có thể viết bất kì thứ gì vào phần comment mà không hề ảnh hưởng đến code CSS.

Nhiều thuộc tính CSS

Bạn có thể thêm nhiều thuộc tính và giá trị khác. Mỗi câu lệnh kết thúc bằng dấu chấm phẩy (;) và thường được viết xuống dòng.

Ví dụ:

h1{

    /* Chuyển màu của thẻ h1 thành màu xanh */

    color: blue;

    /* Chuyển màu nền thành màu vàng */

    background-color: yellow;

}

Internal Style Sheet (style sheet bên trong trang)

Khi chúng ta sử dụng Internal Style Sheet, chúng ta cần thực hiện như sau:
```
style được đặt trong thẻ <head>
Chúng ta dùng thẻ <style>
```

Style sẽ được áp dụng cho toàn trang

Ví dụ:

<head>

    <meta charset="UTF-8">

    <title>Tile here</title>

    <style>

        h1 {

            color: blue;

        }

    </style>

</head>

Khi trình duyệt mở trang, nó sẽ thực hiện phần <head> và tìm thấy style để áp dụng cho trang. Nó sẽ biết để đi qua trang của các bạn và áp dụng quy tắc này cho tất cả các thẻ ``<h1>``.

Tương tự, nếu các bạn có nhiều quy tắc bao gồm văn bản, hình ảnh, những thứ như thế, nó sẽ biết phải áp dụng điều này cho tất cả các trường hợp trong toàn bộ file.

Bạn nên dùng Internal Style Sheet khi các bạn chỉ cố tạo style cho một trang. Nó thể giữ tất cả code HTML và CSS trong một file chứ không phải tìm ở các file khác nhau.

Tuy nhiên, trường hợp bạn có nhiều trang cùng sử dụng chung CSS, bạn cần đưa CSS ra một file riêng, và nhúng file đó vào trong các trang HTML. Đó là cách sử dụng External Style Sheet (style sheet bên ngoài).

External Style Sheet (style sheet bên ngoài)

Cách hoạt động của một External Style Sheet là các bạn đặt CSS của các bạn trong một file khác. File này sẽ có phần đuôi mở rộng là *.css.

Bạn có thể viết toàn bộ mã CSS giống như đã viết trong lúc dùng Internal Style Sheet. Tuy nhiên, bạn không cần đặt tất cả trong thẻ style, mà chỉ đơn giản là viết mã CSS.

    <style>

        h1 {

            color: blue;

            background-color: yellow;

        }

    </style>

Tiếp theo, bạn cần load (tải) file css này vào trong file html. Bạn sẽ sử dụng thẻ <link> đặt trong thẻ <head> để làm việc này.

Ví dụ:

<head>
     <link rel="stylesheet" href="mystyle.css">
</head>

Trong đó, mystyle.css là tên file CSS của bạn. Nếu bạn đặt file CSS ở folder khác, bạn sẽ cần chỉ ra đường dẫn tương đối từ file HTML đến file CSS.

Hãy xem lại nội dung về đường dẫn đã học ở bài 3, mục Hyperlink.

Cascading (xếp tầng)

CSS hoạt động theo nguyên tắc xếp tầng. Các tầng style được đặt lên nhau theo nguyên tắc có thứ tự ưu tiên sau:

    CSS mặc định của trình duyệt – Mức độ ưu tiên thấp nhất
    External Style Sheet – CSS trong file external .css
    Internal Style Sheet – CSS viết trong thẻ head
    Inline Style  - CSS viết trong thuộc tính style của thẻ html, mức độ ưu tiên cao nhất. Điều này có nghĩa là: inline style vô hiệu hóa tất cả các quy tắc style khác của các bạn.

Muốn thay đổi thứ tự ưu tiên trên, chúng ta có thể dùng !important. Nó được sử dụng để đánh dấu một quy tắc CSS nào đó là quan trọng. Nó sẽ không bị ghi đè bởi những tầng khác.



### Áp dụng CSS cho table

Video bài học này sẽ hướng dẫn học viên thực hành sử dụng CSS tạo lịch giống như sau:

Nội dung gồm có:

- Thể hiện các ngày trong tháng

- Một vài ngày, có thêm các cuộc hẹn như Lunch With Mom (ăn trưa với mẹ), hoặc Meet with Dean (gặp trưởng khoa), hoặc là Library Helper (trợ giúp thư viện).

- Có ngày lễ như vào ngày 31 tháng 10, đó là Halloween

Các thuộc tính CSS sử dụng

-       - Border-radius: để bo tròn các góc

-       -  pseudo element (yếu tố giả) để tạo màu khác nhau cho các dòng chẵn và dòng lẻ.

-       - visibility: hidden để ẩn lịch 


### Thực hành tạo menu

1. Tạo menu trái

Video hướng dẫn thực hành tạo menu như hình:

Menu gồm 4 links: Home, Photos, Recipes, Contact.

Các thuộc tính và kiến thức CSS sử dụng:

    background-color (màu nền),
    border
    color
    line-height
    padding (đệm),
    margin (lề)
    box-sizing: border-box (tham khảo lại bài 4, mục 7. Box model (mô hình hộp)

Nơi đầu tiên mà người dùng nhận được thông tin là từ tiêu đề của trang. Bạn nên đảm bảo rằng tiêu đề của bạn ngắn nhưng cũng cho phép người dùng biết trang này khác với các trang khác tại trang web của bạn như thế nào.

Trang web cần có hệ thống phân cấp tiêu đề phù hợp. Tiêu đề cần lồng nhau để cung cấp cấu trúc một cách rõ ràng. Nó cần có dạng cấu trúc cây, giống như những mô hình cấu trúc mà bạn đã biết.

Để đảm bảo có cấu trúc tốt, bạn cần lưu ý một số điểm:

-        - Bạn chỉ nên có một tiêu đề h1. Bởi vì h1 thể hiện cho tiêu đề của nội dung. Nó nên là duy nhất cho mỗi trang.

-        - Bạn không nên bỏ qua cấp độ của tiêu đề, ví dụ: nhảy từ h2 đến h4 mà không qua h3. Thay vào đó, bạn cần tuân theo một trật tự nhất định để mọi người có thể nhận ra rằng có trang của bạn có ý nghĩa.

 

-        - Bạn không nên dùng heading chỉ để thay đổi kích thước của chữ. Nếu muốn thay đổi kích thước chữ, hãy đơn giản là dùng CSS

   (Phần còn lại nói về screen reader và cách dùng off-page, nó không cần thiết nên bỏ qua)
2. Tạo menu ngang

Video hướng dẫn code để tạo menu ngang:

Tính năng của menu ngang: 

- Có một link (tương ứng với trang hiện tại) có màu khác với các link còn lại

- Khi di chuột qua mỗi link thì sẽ đổi màu

Sử dụng các kiến thức và kĩ năng sau để thực hiện:

- Bước 1: Sử dụng thẻ nav và cá thẻ a để tạo menu ngan

<nav>

        <a href="#">Home</a>

        <a href="#" class="current">Photos</a>

        <a href="#">Recipes</a>

        <a href="#">Contact</a>

    </nav>

- Bước 2: Tạo CSS cho nav:

 nav {

            box-sizing: border-box;

            border: 1px solid #06425c;

            color: #06425C;

            background: #FFFFFF;

            padding-left: 20px;

        }

- Bước 3: Tạo CSS cho link trong nav

nav a {

            box-sizing: border-box;

            display: inline-block;

            line-height: 50px;

            height: 60px;

            color: #ffffff;

            background-color: #486B02;

            text-decoration: none;

            margin: 1% 5% 1% 0;

            padding: 1% 5%;

            border-radius: 25px;

        }

- Bước 4: Sử dụng thêm class có tên là current, để đánh dấu link tương ứng với trang hiện tại. Viết CSS có màu nền (background-color) khác với màu của các link khác

 .current {

            background-color: #800000;

        }

- Bước 5: Sử dụng pseudo-class hover để tạo hiệu ứng khi di chuột qua link

nav a:hover{

            color: #000000;

            border-radius: 0;

        }

3. Tạo menu 2 cấp

Video hướng dẫn tạo menu hai cấp, khi di chuột qua sẽ xổ ra menu con để người dùng chọn:

Bước 1: sử dụng nav, ul, li lồng nhau để tạo phần HTML

<nav>

        <ul>

            <li><a href="#">Home</a></li>

            <li><a href="#">Photos</a>

                <ul>

                    <li><a href="#">2015</a></li>

                    <li><a href="#">2014</a></li>

                    <li><a href="#">2013</a></li>

                </ul>

            </li>

            <li><a href="#" class="active">Recipes</a></li>

            <li><a href="#">Contact</a></li>

        </ul>

 

    </nav>

Bước 2: Tạo CSS cho trang 

       body {

            margin: 0;

            padding: 0;

            background: #ccc;

        }

Bước 3: Tạo css cho nav

        nav ul {

            list-style: none;

            background-color: #444;

            text-align: center;

            padding: 0;

            margin: 0;

        }

Bước 4: Tạo CSS cho item trong menu:

        nav li {

            width: 20%;

            border-right: 1px solid black;

            height: 50px;

            font-size: 140%;

            margin-right: 0px;

        }

Bước 5: Bỏ border của item cuối cùng trong menu:

        nav li:last-child{

            border-right: none;

        }

Bước 6: Bỏ border bên phải của các item con (cấp 2)

       nav li li{

            border-right: none;

        }

Bước 7: Tạo CSS cho link:

       nav a {

            text-decoration: none;

            color: #fff;

            display: block;

            padding-left: 15px;

            transition: 0.5s background-color;

        }

Bước 8: Tạo CSS khi di chuột qua link:

        nav a:hover {

            background-color: #005f5f;

        }

Bước 9: Tạo CSS cho link hiện tại

        nav a.active {

            background-color: #aaa;

            color: 444;

            cursor: default;

        }

Bước 10: Tạo CSS cho sub-menu:

      nav li li {

            font-size: 0.8em;

        }

        

        nav>ul>li {

            text-align: center;

            float: left;

        }

        

        nav>ul>li>a {

            padding-left: 0;

        }

Bước 11: Căn chỉnh vị trí và hiển thị của sub-menu:    

         nav li ul {

            position: absolute;

            display: none;

            width: inherit;

        }

        

        nav li:hover ul {

            display: block;

        }

        

        nav li ul li {

            display: block;

        }
        
        
        
### Sử dụng màu sắc trong CSS

Sử dụng màu sắc trong CSS là công việc rất phổ biến. Để thực hiện được, lập trình viên cần có kiến thức về các hệ màu, các quy ước sử dụng màu sắc và chọn màu phù hợp. Video trong bài này sẽ hướng dẫn cách chúng ta sử dụng màu sắc trên trang web của bạn.

Chúng ta có 3 quy ước màu cơ bản khác nhau là những quy ước chính mà mọi người sử dụng. Đó là những quy ước chung mà mọi người thường dùng. Nhưng không phải là bắt buộc.

Cách 1: sử dụng tên màu

Sử dụng tên màu (tên tiếng Anh) như Blue (Màu xanh dương), red (đỏ), yellow (vàng), v.v.

Cách này dễ nhớ và dễ thực hiện nhưng nó không nhất quán trên các trang. Cùng là một màu vàng nhưng có thể nó sẽ trông khác nhau trên các trình duyệt khác nhau. Do đó, chúng ta tránh tên màu trong dự án thực tế.

Cách 2: sử dụng mã màu RGB

Mã màu RGB là mã ở hệ thập lục phân (hexadecimal, hệ 16). Hệ thập lục phân (hexadecimal) sử dụng 16 kí hiệu gồm 10 kí hiệu số  như thông thường từ 0 đến 9 và bổ sung thêm 6 kí hiệu chữ từ A đến F.

Khi bạn dùng hệ thập lục phân, nó luôn luôn được thiết lập theo 1 cách, nơi bạn có một ký hiệu #, theo sau là 3 hoặc 6 chữ số. Nó được gọi là mã RGB, viết tắt của 3 màu cơ bản Đỏ (Red), Xanh lá cây (Green), Xanh dương (Blue)

Ví dụ: màu đỏ có mã #FF0000, màu xanh lá cây có mã #00FF00, ….

Các màu được pha trộn từ 3 màu cơ bản Đỏ (Red), Xanh lá cây (Green), Xanh dương (Blue). Ví dụ: màu vàng có mã #FFFF00

Cách 3: sử dụng mã màu RGBA

Để biểu thị cho độ trong suốt của màu, người ta mở rộng mã RGB thàn RGBA, trong đó A là viết tắt của alpha transparency (độ trong suốt alpha).

Độ trong suốt có giá trị từ 0 đến 1. Nếu giá trị của nó bằng 0, chúng ta có thể hoàn toàn nhìn xuyên qua được nó. Nếu nó giá trị là 1, nó sẽ trông giống như giá trị RGB thông thường.

### Áp dụng CSS cho văn bản

Muốn áp dụng CSS cho văn bản, lập trình viên sẽ sử dụng các thuộc tính như font-family, font-size. Ngoài ra, CSS còn cung cấp thêm các thuộc tính để giúp thực hiện giãn cách giữa các chữ hay các dòng, thực hiện áp dụng hiệu ứng trên văn bản.

Sử dụng font chữ

Bạn có thể dùng CSS để tạo style cho font family, font-style (kiểu font), font-variant (biến thể font) và kích cỡ font. Nó còn có color (màu sắc) và background (nền) của font chữ. Chúng ta cũng có thể xem xét căn chỉnh (alignment) giống như bạn canh lề trong word hay quy định line-height (chiều cao dòng)

Font family

Font family chỉ là các loại văn bản khác nhau.

Nếu bạn đã sử dụng Word, bạn đã đi đến font family và bạn có thể chọn Arial hoặc Wingdings hoặc nhiều loại font chữ khác nhau. Bạn có thể làm những việc tương tự trên trang web của mình.

Một số font phổ biến là: Helvetica, Courier, Courier New, Comic Sans, cursive hoặc Verdana.

Ví dụ code:

    <style>

        h1{

            font-family: Helvetica;

        }

    </style>

Trường hợp tên font của bạn có nhiều hơn 1 từ (có dấu cách ở giữa), bạn cần dùng dấu nháy để đánh dấu nó. Ví dụ bên dưới, bạn sẽ cần đặt cụm ‘Times New Roman’ bên trong cặp nháy đơn.

    <style>

        h1{

            font-family: 'Times New Roman';

        }

    </style>

Cách nó hoạt động là bạn sử dụng quy tắc cú pháp của bạn. Bạn có selector (bộ chọn), property (thuộc tính) của bạn, và sau đó là giá trị.

các trình duyệt không hỗ trợ mọi thứ. Chúng ta đã nhìn thấy điều này ngay cả với HTML5.

Một số trình duyệt hỗ trợ một số văn bản, một số thì không. Tương tự như vậy, một số trình duyệt hỗ trợ một số font chữ và những trình duyệt khác thì không. Do đó,  bạn có thể cung cấp các lựa chọn thay thế. Trong ví dụ này, tôi đã cung cấp cho trình duyệt 3 lựa chọn thay thế khác nhau để sử dụng.
```
h1{

            font-family: Courier, Impact, Arial;

}
```

CSS có nghĩa là: bất cứ khi nào bạn tới một tag ``<h1>``, tôi muốn bạn sử dụng font chữ Courier. Nhưng nếu không có font chữ Courier, hãy sử dụng font chữ Impact. Nếu không có font đó, hãy sử dụng Arial.

Nếu nó không có cả font chữ trên thì sao? Nếu nó không có Courier, Impact, và cả Arial, nó sẽ luôn luôn quay trở lại mặc định của trình duyệt. Chữ của bạn sẽ không biến mất, nó sẽ chỉ hiện thị theo mặc định của trình duyêt. Tuy nhiên, như vậy nghĩa là bạn đang có một font family không tốt.

Hai loại font

Về cơ bản có 2 loại: font chữ serif và font chữ sans-serif.

Các font chữ serif là những font chữ có các cạnh lạ mắt dọc theo bên mà bạn sử dụng khi bạn đang học thư pháp hoặc những thứ tương tự như thế. Font chữ Serif có thể khiến nó rất rối, vậy tránh chúng nếu có thể.

Các font chữ sans-serif rất gọn gàng, không có phần thả xuống hoặc những điều như thế.

Sử dụng font tùy chỉnh

Nếu bạn quyết định rằng bạn muốn có font chữ của riêng bạn, hoặc một số loại font chữ tùy chỉnh đặc biệt và an toàn cho trang web bạn cần phải sử dụng một thứ đặc biệt, đó là quy tắc font chữ.

Bạn cần định nghĩa font-face của riêng mình. Ví dụ: MySpecialFont

    <style>

        @font-face{

            font-family: mySpecialFont;

            src: url('Colleen.ttf');

        }

        h1{

            font-family:mySpecialFont;

        }

    </style>

Font-style

Bạn có thể đặt font chữ của bạn trông bình thường tức là mặc định, hoặc bạn muốn nó ở dạng italic (nghiêng)

        h1{

            font-family:mySpecialFont;

            font-style: italic;

        }

Thuộc tính font-style có các giá trị:

    Normal: style mặc định
    Italic: kiểu in nghiêng
    Oblique: kiểu xiên, về cơ bản, oblique chỉ là một kiểu nghiêng đặc biệt.

Font-variant

font-variant có 2 giá trị:

    normal: cỡ bình thường
    small-caps: font chữ in hoa nhỏ. Mọi người thường sử dụng nó khi họ đang cố tạo giao diện phù hợp và nhưng hơi lạ mắt

Kích thước font chữ

Bạn có thể sử dụng font size để đặt kích thước của font chữ:

    xx-small: cực cực nhỏ
    x-small: cực nhỏ,
    small: nhỏ
    smaller: nhỏ hơn
    medium: trung bình
    large: lớn
    x-large: cực lớn
    xx- large: cực cực lớn
    larger: lớn hơn

Thông thường, chúng ta dùng đơn vị pixel (px) cho giá trị kích thước font chữ. Hầu hết mọi người thường dùng 20 pixel, 35 pixel, 80 pixel.

Bạn cũng có thể dùng đơn vị phần trăm (%). Ví dụ:

    Nếu bạn nói sử dụng 100%, nó sẽ là kích thước mặc định.
    Nếu bạn nói sử dụng 110%, nó sẽ lớn hơn một chút.
    Nếu bạn sử dụng 75%, nó sẽ bằng 3/4 kích thước ban đầu.

Màu chữ và màu nền

Chúng ta dùng color để đổi màu của chữ. Thuộc tính background-color dùng để đổi màu nền.

Để xem các cách sử dụng màu sắc, bạn hãy xem lại ở mục trước.

Ví dụ:

        h1 {

            color: #343434;

            background-color: gainsboro;

        }

Canh lề (text-align)

Tương tự như trong word, CSS cho phép canh lề bằng thuộc tính text-align với 4 giá trị:

    text-align: left  -> canh lề trái (mặc định)
    text-align: right -> canh lề phải 
    text-align: center -> canh giữa
    text-align: justify ->  canh hai bên

Chiều cao dòng (line-height)

Thuộc tính line-height dùng để chỉ định chiều cao dòng. Thường người ta dùng đơn vị phần trăm (%)

Ví dụ: line-height: 200% 


### Điều chỉnh hiển thị bằng CSS

Để giải quyết vấn đề vị trí hiển thị, lập trình viên cần có những kiến thức về Inline và Block. Sau đó, áp dụng các thuộc tính float hay overflow để chỉ định vị trí cho các khối hay các thẻ. Hai video sau sẽ hướng dẫn học viên điều chỉnh hiển thị bằng CSS.

1. Nhắc lại về block và Inline

Có 2 loại hiển thị phổ biến nhất là block (khối) và inline (nội tuyến).

Các block tag là những tag chiếm một chiều rộng và chiều cao nhất định. Nó sẽ luôn bắt đầu dòng mới, và phía sau nó cũng luôn là dòng mới. Bạn có thể chỉ định kích thước như chiều cao và chiều rộng của nó.

Các inline tag là những tag chỉ chiếm đủ không gian cần thiết. Nếu hai hay nhiều thẻ inline gần nhau, chúng có thể nằm trên cùng 1 dòng. Cho đến khi dòng đó hết chỗ, nó sẽ thực hiện xuống dòng.

2. Display: inline-block

Trong CSS, chúng ta có thể dùng thuộc tính display để quy định hiển thị cho một thành phần.

Ví dụ: display: block;

Giá trị display:inline-block hiển thị sẽ giống như inline và chúng có thể bên cạnh nhau, nhưng chúng cũng sẽ chấp nhận thuộc tính chiều cao (height) và chiều rộng (width).

3. Display: none

Display: none sẽ ẩn thành phần khỏi giao diện. Nó như thể trình duyệt nhấc nó lên và bỏ nó ra khỏi trang.

4. Float và clear

Float và clear không nhất thiết phải thể hiện bạn muốn trang ở vị trí nào vị trí cụ thể của các phần tử trên trang của bạn, mà là nơi bạn muốn đặt chúng.

Theo mặc định, khi trình duyệt đặt các phần tử lên trang, nó bắt đầu ở góc trên bên trái. Các phần tử tiếp theo sẽ tiếp tục bổ sung vào trang theo quy tắc đó.

Float cho phép bạn định vị lại mọi thứ:

    float: right -> định vị phần tử sang bên phải
    float: left -> định vị phần tử sang bên trái.

Và khi bạn thêm float thì một lần nữa, ngay sau phần tử áp dụng thuộc tính float, bạn đang ảnh hưởng đến các yếu tố lân cận vì yếu tố lân cận của bạn cần phải biết vị trí của yếu tố này. Đó là lý do tại sao chúng ta có thuộc tính bổ sung được gọi là clear:

    clear: left -> sẽ đảm bảo không có gì float ở bên trái.
    clear: right -> nghĩa là không có gì float ở bên phải.
    clear: both -> không có yếu tố nào float bên cạnh cả.

5. Thuộc tính overflow

Bạn có thể sử dụng thuộc tính overflow (tràn) để xác định cách mọi người sẽ có thể truy cập nội dung đó, hoặc liệu họ có thể truy cập nó hay không.

Có 4 giá trị của thuộc tính overflow:

    visible (có thể nhìn thấy), về cơ bản có nghĩa là nếu bạn đã vẽ một hộp.Nếu  có văn bản bên trong nó, văn bản sẽ tràn ra ngoài hộp (box).
    hidden: (ẩn) làm hoàn toàn ngược lại. Nếu bạn có thứ gì đó bên trong cái hộp này và nó quá lớn, nó sẽ biến mất. Bạn không thể nhìn thấy nó.
    scroll: (cuộn) nó sẽ tạo ra một thanh cuộn ngang và dọc cho phần tử.
    auto: (tự động), nó sẽ thêm thanh cuộn khi cần thiết

6. Hiển thị dạng bảng (display:table)

    display:table -> hiển thị các phần tử dạng bảng.
    display:table-cell  -> xếp các phần tử trong các cột

7. Visibility (có thể nhìn thấy)

Visibility xác định liệu một phần tử sẽ được một người dùng nhìn thấy hay không. Nó tương tự như thuộc tính display:none ở trên nhưng có một chút khác biệt:

    visibility:hidden; -> Nó vẫn chiếm khoảng không vốn có, các phần tử sau nó sẽ không “trượt” lên
    display: none; -> Giải phóng khoảng không vốn có, các phần tử sau nó có thể sẽ “trượt” lên.

Giải thích thêm: trượt nghĩa là phần tử sau nó có thể sử dụng vị trí của nó để override lên.
 
### Thao tác với Box Model

Box model là một khái niệm chung của CSS giúp bạn chỉnh kích thước và đặt yếu tố của bạn ở vị trí bạn muốn. Nó ảnh hưởng trực tiếp đến chiều cao và chiều rộng của phần tử.

Nhắc lại về hiển thị:

    Inline: không thể chỉ định chiều cao, chiều rộng. Bất cứ khi nào bạn có một thứ là inline, nếu bạn cho nó một chiều cao và chiều rộng, trình duyệt sẽ bỏ qua nó.
    Block hoặc inline-block: có thể nhận các thuộc tính chiều cao và chiều rộng. Do đó, chúng ta có thể dùng nó để điều chỉnh kích thước.

Thuộc tính border (đường viền)

Thuộc tính border (đường viền) xác định style của đường viền mà bạn muốn, chiều rộng và màu của viền là gì. Bất kỳ phần tử nào cũng có thể có một đường viền xung quanh nó cho dù là inline hay là block hay là inline block

Ví dụ: border: 2px solid yellow;

Trong đó:

    2px: độ dày của viền. Giá trị mặc định là 1px
    solid: kiểu đường viền là nét liền
    yellow: màu sắc của viền

Bạn cũng có thể dùng riêng từng thuộc tính: border-width, border-style, border-color.

Border-style có nhiều giá trị khác nhau:

    dotted (chấm)
    dashed (gạch ngang)
    groove (có xẻ rãnh)
    ridged (viền 3D)
    hidden (ẩn)
    inset (đường viền hình 3D)
    outset (đường viền đầu 3D)

Border-width có thể dùng đơn vị pixel (px) hoặc các giá trị thiết lập:

    thin (mỏng),
    medium (trung bình),
    large (lớn)

Border-color được dùng giống như các trường hợp sử dụng màu sắc. Bạn có thể dùng tên màu, hoặc mã màu RGB

Bạn cũng có thể thiết lập đường viền riêng cho từng cạnh. Mỗi cạnh tương ứng với một bộ giá trị. Tên của 4 cạnh lần lượt là:

    Top: cạnh trên
    Right: cạnh bên phải
    Bottom: cạnh dưỡi
    Left: cạnh bên trái

Thuộc tính margin (lề)

Margin (lề) là không gian nằm ngoài đường phiền. Đó là khoảng giữa hai phần tử liền kề nhau. Vì vậy, nó cung cấp cho bạn không gian vì bạn không muốn ai chạm vào bạn.

Với margin, bất cứ khi nào bạn cung cấp cho nó một margin là dương về cơ bản, bạn nói, di chuyển phần tử của bạn sang phải hoặc xuống dưới.

Nếu bạn cho nó một margin âm, nó sẽ di chuyển tới gần với yếu tố lân cận hơn. Nó sẽ di chuyển sang trái hoặc lên trên.

Thuộc tính padding (đệm)

Về lý thuyết thì padding (đệm) rất giống với margin, không gian này nằm giữa phần tử và đường viền của nó.

Margin và padding chỉ có giá trị là kích thước, không có màu sắc hay kiểu giống border. Các padding luôn luôn có cùng màu với các yếu tố, và margin luôn luôn cùng màu của phần thân (body) của trang.

Bạn thường dùng đơn vị pixel hoặc phần trăm cho padding và margin.

Tính kích thước phần tử

Kích thước phần tử được tính theo cả kích thước phần nội dung, padding, border và margin. Ví dụ:

Nếu chúng ta có phần tử với các kích thước:

    width (chiều rộng) 100 px
    padding: 10px,
    margin: 5px
    và border: 1px.

Thì chiều rộng thực tế của nó là 132px = 5px (margin-trái) + 1px (border-trái) + 10px (padding-trái) + 100px (chiều rộng) +  10px (padding-phải) + 1px (border-phải) + 5px (margin-phải)

Quy tắc chiều quay đồng hồ (mở rộng)

Nếu bạn muốn viết kết hợp 4 giá trị theo 4 cạnh của margin, padding hay border, bạn cần kết hợp nó theo thứ tự. Ở đây sử dụng quy tắc chiều quay kim đồng hồ và quy tắc đối lập.

    Nếu bạn viết cả 4 giá trị, ví dụ: padding: 10px 6px 12px 3px; thứ tự giá trị gán vào là top-right-bottom-left theo thứ tự kim đồng hồ lúc 12h-3h-6h-9h
    Nếu chỉ có 2 giá trị, ví dụ: padding: 10px 12px; quy tắc đối lập được áp dụng. Giá trị đầu tiên là top là 10px, đối lập với nó là bottom cũng là 10px. Tương tự, right và left là 12px
    Nếu chỉ có 1 giá trị, ví dụ: padding: 10px, giá trị này được áp dụng cho cả 4 hướng
    Nếu có 3 giá trị, ví dụ: padding: 10px 6px 12px; cả hai quy tắc được áp dụng. top-right-bottom lần lượt nhận 3 giá trị tương ứng là 10px 6px 12px; Do left đối lập với right, nên nó nhận giá trị bằng của right là 6px

Thuộc tính box-sizing (chỉnh kích thước hộp)

Box-sizing (chỉnh kích thước hộp) lấy phép toán từ chiều cao tổng hợp và chiều rộng tổng hợp. Nó có 2 giá trị:

    box-sizing: content-box (hộp nội dung) -> chiều cao hoặc chiều rộng tổng hợp mặc định của bạn. Nó giống như ví dụ đã tính trong phần Tính kích thước phần tử
    border-box (hộp đường viền) -> border-box sẽ xem xét chiều rộng, nội dung, và cả padding. Nó thường được dùng để tránh việc các phần tử bị tính sai kích thước dẫn đến không cùng nằm trên 1 hàng.


### Áp dụng CSS cho link và list
Nội dung học tiếp theo cung cấp kiến thức về việc áp dụng CSS cho link và list.

1. Tạo style cho link

Với link, CSS sẽ thực hiện thay đổi hiển thị mặc định của thẻ <a> bằng việc thay đổi anchor text. CSS cũng có thể áp dụng để thay đổi link ở các trạng thái: link, active, hover, visited.

Bạn có thể sử dụng các thuộc tính đã biết như:

    display
    font-weight
    corlor
    background-color
    text-align
    padding
    text-decoration

Thuộc tính text-decoration (văn bản trang trí): text-decoration: none -> bỏ gạch chân của link, trông nó giống như text thông thường.

Trạng thái của link

Link có 4 trạng thái là link, active, hover và visited. Trong CSS dùng pseudo class (lớp giả) để thực hiện:

    a:link -> trạng thái bình thường, bạn đã nhìn thấy nó trước đây
    a:visited ->nói đây là một link đã click vào nó trước đây. Theo mặc định của trình duyệt, nó sẽ là một màu khác
    a:hover -> khi bạn di chuột lên trên link
    a:active -> khi bạn đang thực sự click vào một link, nó sẽ thêm một đường viền xung quanh link đó.
    a:focus -> trạng thái focus xảy ra khi ai đó đang xem qua trang của bạn bằng phím tab.

2. Kiểu hiển thị của list (list-style)

Với list, CSS sẽ thực hiện thay đổi cách hiển thị của list như thay đổi cách đánh số thứ tự, hay đổi kí hiệu đánh dấu, hay bỏ hẳn kí hiệu đánh dấu trong list.

    list-style-type cho biết cách bạn muốn chỉ định mục danh sách khác nhau. Xem các lựa chọn tại: https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type

Theo mặc định, với các danh sách có thứ tự, chúng ta có 1, 2, 3, nhưng bạn có thể dùng các giá trị khác nhau: dạng chữ thường a, b, c, …;dạng viết hoa A, B, C, …;dạng la mã I, II, III, IV, …

    list-style-position: thay đổi vị trí tùy thuộc vào kiểu danh sách mà bạn đang sử dụng.
    list-style-image: thay đổi kí hiệu mặc định (dấu chấm hoặc số) thành dạng ảnh.