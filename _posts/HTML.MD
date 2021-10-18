### Giới thiệu về DOM

#### Giới thiệu về DOM

Để viết được code có thể chạy trên nhiều thiết bị khác nhau bạn cần phải biết về Document object model hay còn được gọi là DOM.

HTML được xây dựng trên cấu trúc DOM. Đây là cấu trúc dạng cây, nó gồm có gốc và các nhánh, các nhánh lại tiếp tục có nhiều nhánh con…Với file HTML, chúng ta bắt đầu từ DOCTYPE. Đây là cách đơn giản để đánh dấu một tài liệu là HTML5.

Tiếp theo là <html> với hai thẻ con là <head> (phần đầu) và <body> (phần thân):

* Ở phần <head>, chúng ta sẽ lưu tất cả các loại thông tin mà thường thì người dùng sẽ không nhìn thấy. Nó được sử dụng để cung cấp thông tin cho trình duyệt và các cỗ máy tìm kiếm. Trong phần <head> còn có thẻ <title>, nó sẽ hiển thị thông tin trên thanh tiêu đề của trình duyệt (browser tab title).

* Trong phần <body> là nội dung có thể hiển thị được (displayable content). Chúng ta sẽ tìm hiểu cách đặt tất cả các tag (thẻ) HTML5. Đây sẽ là phần chiếm kích thước lớn trong file HTML. Và bạn sẽ làm việc với phần này nhiều nhất.

Bạn có thể xem lại ví dụ phần này:

```
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>My First Page</title>

</head>

<body>

    This should be displayed by the browser.

</body>

</html>
```

#### Xác thực code

Bước tiếp theo bạn nên làm là xác thực (validate) code để kiểm tra xem code có đang hợp lệ hay không. Bạn có thể thực hiện kiểm duyệt tự động bằng ứng dụng được cung cấp từ w3.org.

* Bước 1: truy cập trang https://validator.w3.org/
* Bước 2: Bạn có thể dùng 1 trong 3 lựa chọn: điền vào URL (nếu bạn đã đưa trang của bạn lên internet), tải lên file html, hoặc copy/paste code của bạn vào ứng dụng.
* Bước 3: Ấn CHECK và xem kết quả validate ở khung bên dưới.

Bạn có thể thấy một số lỗi hiển thị ra. Bạn hãy dựa vào các lỗi và gợi ý để sửa lỗi cho trang của mình. Bạn hãy thực hiện sửa các lỗi và sau đó có thể kiểm tra lại. Hãy thực hiện để đảm bảo code của bạn không còn lỗi.

### Thẻ (Tag), cấu trúc thẻ và thuộc tính của thẻ

#### Cấu trúc thẻ (tag)

Mỗi thẻ thường có 3 phần: phần mở, thân và phần đóng. Xét ví dụ: <h1>Hello world</h1>

    <h1> là phần mở của thẻ

    </h1> là phần đóng, khác phần mở một chút khi có thêm dấu / và ghép thành cặp tương ứng với phần mở.

    Hello world là phần thân của thẻ. Đây sẽ là nội dung hiển thị trên trang web mà người dùng có thể thấy được. Trong khi phần <h1> và </h1> thì người dùng không thể nhìn thấy bởi vì nó được dùng để đánh dấu.

Một dạng khác của thẻ là thẻ tự đóng (self-closing tag).  Ví dụ như thẻ img: <img src="x.gif" />

Nó chỉ có 1 tag, và nó chứa cả phần mở và phần đóng. Trường hợp này, nội dung hiển thị là ảnh, và nó được cung cấp từ nguồn x.gif. Nó không có văn bản để hiển thị lên, nên nó sẽ tự đóng lại.

#### Thuộc tính của thẻ

Các thẻ được bổ sung thêm thuộc tính (attribute). Thuộc tính được viết theo từng cặp có dạng name = “value”. Ví dụ như class=”subject”

Chú ý rằng, thuộc tính luôn được viết ở phần mở. Một thẻ có thể có nhiều thuộc tính cùng nhau, nhưng các thuộc tính không được phép trùng tên.

#### Block và Inline

Có 2 loại hiển thị phổ biến nhất là block (khối) và inline (nội tuyến).

Các block tag là những tag chiếm một chiều rộng và chiều cao nhất định. Nó sẽ luôn bắt đầu dòng mới, và phía sau nó cũng luôn là dòng mới.

Các inline tag là những tag chỉ chiếm đủ không gian cần thiết. Nếu hai hay nhiều thẻ inline gần nhau, chúng có thể nằm trên cùng 1 dòng. Cho đến khi dòng đó hết chỗ, nó sẽ thực hiện xuống dòng.

#### Một số thẻ phổ biến

Nhóm thẻ heading gồm 6 thẻ từ <h1> đến <h6>. Kích thước thẻ giảm dần từ <h1> đến <h6>.

* Thẻ <p> được sử dụng để đánh dấu một đoạn văn. Đây là thẻ block, nên chúng ta không nên dùng thẻ <p> bên trong các thẻ inline khác. Chúng ta cũng không nên lồng thẻ <p> bên trong một thẻ <p> khác, không đặt heading bên trong một thẻ <p>

* Thẻ <div> là một phần thường lớn hơn một paragraph và đó là nội dung liên quan mà các bạn muốn nhóm lại với nhau.
* Thẻ <ul> tạo ra một danh sách không sắp xếp. Nó được dùng kết hợp với các thẻ <li>. Ví dụ:
```
    <ul>

        <li>Item One</li>

        <li>Item Two</li>        

    </ul>
```
    Tương tự, thẻ <ol> tạo ra danh sách được sắp xếp và nó sẽ hiển thị số thứ tự.
```
    <ol>

        <li>Item One</li>

        <li>Item Two</li>        

    </ol>
```

* Thẻ <br/> dùng để ngắt dòng (line break) và nó là thẻ tự đóng. Nó được dùng để thay thế cho các mã xuống dòng (khi ấn phím Enter)

* Thẻ <img> có 2 thuộc tính quan trọng là src và alt. Thuộc tính src dùng để chỉ định đường dẫn của ảnh sẽ hiển thị lên. Trong khi, thẻ alt (viết tắt của alternative text) chứa văn bản thay thế. Văn bản này sẽ hiển thị thay cho ảnh khi người dùng sử dụng screen reader, hoặc thậm chí nếu ảnh bị mất vì một lý do nào đó, có thể các bạn đã đặt tên sai file chẳng hạn.

#### Kí hiệu đặc biệt

Các kí tự như dấu bé hơn (<), dấu lớn hơn (>)… là các kí tự đặc biệt trong HTML. Nó được gọi là những thực thể đặc biệt (special entity) bởi nó được dùng để tạo ra các thẻ. Vậy nên nếu bạn muốn những kí tự này, bạn cần phải viết nó ở dạng mã hóa (encode).

Để xem danh sách các kí hiệu đặc biệt và ý nghĩa của nó, bạn có thể tham khảo tại: HTML Entities


### Semantic Tags

#### Semantic tags

Bước quan trọng nhất trong việc thiết kế web là thiết kế. Một khi các bạn đã quyết định dùng các tag nào và nhập các file, chúng ta sẽ tập trung vào cách các bạn muốn bố trí trang của mình. Ngoài ra, các bạn cần phải biết rõ những gì các bạn muốn tạo ra trước khi các bạn bắt đầu viết code một cách nghiêm túc.

Xét về mặt ngữ nghĩa, các thẻ HTML phân thành 2 loại:

* Loại có ngữ nghĩa (semantic tag): là các thẻ mà tên của thẻ thể hiện được một cách rõ ràng về nội dung bên trong. Nói một cách khác, khi đọc vào tên thẻ semantic, người ta có thể đoán ra nội dung của nó, mà không cần đọc cụ thể vào nội dung. Điều này là thực sự cần thiết bởi vì các cỗ máy tìm kiếm chỉ cần đọc vào thẻ để tiến hành phân loại nội dung, thay vì phải đọc chi tiết nội dung thẻ. Các lập trình viên khác, khi đọc vào mã nguồn của bạn, cũng dễ dàng hiểu được ý nghĩa của nó. Thẻ semantic tags có rất nhiều loại

Ví dụ: thẻ <img> (viết tắt của image) được dùng để hiển thị ảnh, thẻ <header> dùng để thể hiện cho phần đầu trong nội dung của trang.

* Loại không có ngữ nghĩa (non-semantic tag): không thể hiện nội dung bên trong. Chính vì vậy, thẻ non-semantic được dùng với mục đích chung chung, không xác định được nội dung mà nó sẽ thể hiện.

Có 2 thẻ non-semantic là <div> và <span>. Để thay thế thẻ div, chúng ta cần xem nội dung cụ thể. Có một số trường hợp phổ biến để thay thế cho thẻ div.

Thẻ <header>, <main>, <section>, <nav>, <aside> và <footer> là các thẻ semantic nên được sử dụng.

    <header> thường được sử dụng để nhóm phần giới thiệu
    <main> là phần thân chính của nội dung
    <section> để thể hiện một phần nội dung.
    <aside> thể hiện nội dung phụ, bên cạnh <main>
    <footer> là phần tử cuối cùng của trang, nằm ở dưới cùng.
    <nav> là một phần của trang liên kết đến các trang khác hoặc các phần trong trang của các bạn. Thông thường, các bạn sẽ tìm thấy tag <nav> được nhúng bên trong tag <header>.

### Tạo trang HTML có cấu trúc

Sau khi tìm hiểu về cấu trúc trang HTML và các thẻ semantic, học viên có thể tạo ra HTML để thể hiện nội dung có cấu trúc.

Video trong mục này sẽ hướng dẫn bạn thực hành viết code bằng cách sử dụng các thẻ semantic để tạo trang HTML có cấu trúc. Sau đó, tiến hành kiểm duyệt code.

Đoạn mã HTML được sử dụng (có một số lỗi) trong video như sau:
```
<!DOCTYPE html>

<head>

    <meta charset="UTF-8">

    <title>My First Page</title>

</head>

<body>

    <main><p>THIS IS MY MAIN CODE</main>

  <footer>

      <p>Think of a more interesting footer</p>

  </footer>

</body>

</html>
```
Bạn hãy thực hiện kiểm duyệt và sửa các lỗi ở đoạn code trên.

### Thẻ <img> và thuộc tính

#### Sử dụng hình ảnh và điều chỉnh kích thước

Hình ảnh là loại nội dung phổ biến ở trên web. Để hiển thị hình ảnh, chúng ta sử dụng thẻ <img> (image). Có rất nhiều loại file khác nhau được HTML hỗ trợ. Phổ biến nhất là: JPEG, GIF và PNG. Ngoài ra còn có SVG và BMP.

Hình ảnh sẽ được hiển thị lên theo kích thước mà nó được lưu. Nó có thể hiển thị quá to hoặc quá bé so với màn hình của người dùng. Chúng ta có thể thay đổi kích thước ảnh đã lưu. Nhưng cách này không phải là cách tốt. Vì có rất nhiều kích thước màn hình khác nhau.

Chúng ta có thể sử dụng thuộc tính width (kích thước tính theo chiều ngang) hoặc height (kích thước tính theo chiều dọc) để hiển thị hình ảnh. Chúng ta có thể sử dụng đơn vị pixel (px) hoặc phần trăm (%) khi điều chỉnh kích thước của ảnh.

Một chú ý cần thiết khi chỉnh kích thước ảnh là bạn không nên dùng đồng thời cả 2 thuộc tính width và height. Nó có thể làm “méo” ảnh. Thay vào đó, chỉ nên dùng 1 trong 2 thuộc tính. Thuộc tính còn lại sẽ tự động được tính dựa vào kích thước ảnh, để ảnh không bị méo.

#### Tạo favicons cho trang web

Hình ảnh nhỏ hiển thị ngay bên cạnh tiêu đề (title) của trang web được gọi là favicon. Chúng ta dùng thẻ link đặt trong head để hiển thị ảnh này.
```
<link rel="icon" type="image/png" href="imgs/wd4dlogo.png">
```

#### Thuộc tính alt

Thuộc tính alt cung cấp một văn bản thay thế cho nội dung phi văn bản. Trong trường hợp này là một hình ảnh. Nếu bạn đặt sai đường dẫn ảnh, hoặc vì lí do khác mà ảnh không thể hiển thị lên được, văn bản trong thuộc tính alt sẽ hiển thị thay thế. Nó cũng cung cấp ý nghĩa ngữ nghĩa cho các công cụ tìm kiếm. Nó sẽ giúp các công cụ tìm kiếm nhận ra nội dung của trang của các bạn.

Khi viết nội dung cho thuộc tính alt thì cần chú ý các tiêu chí:

* Chính xác (accurate)
* Súc tích (succinct)
* Tránh dư thừa (redundant)
* Không dùng các cụm như "picure of" (hình ảnh của..) hoặc "graphic of.." (đồ họa của..).


### Sử dụng font awesome để tạo các icon (biểu tượng)

#### Giới thiệu font awesome

Một trong những cách thay thế các ảnh là sử dụng icon. Font Awesome là một bộ sưu tập các icon (biểu tượng) mà các bạn có thể sử dụng cho trang của các bạn và mọi người trên toàn thế giới đều có thể nhận ra chúng.

#### Các bước thực hiện

Chỉ với 2 bước đơn giản để chúng ta sử dụng font awesome:

* Bước 1: nhúng thư viện font awesome trong phần <head> của bạn. Bạn có thể tải về font này hoặc sử dụng online

Đây là 1 ví dụ dùng online: 
```<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer"

    />
```

* Bước 2: lựa chọn icon bạn muốn và đặt mã vào trong trang của bạn (lấy trên web)

Chúng ta dùng thẻ <i> với các class tương ứng với tên icon. Ví dụ, bạn muốn hiển thị icon là một chiếc máy ảnh: <i class="fa fa-camera-retro"></i>

Muốn điều chỉnh kích thước icon, bạn có thể dùng class tương ứng với tỉ lệ. Ví dụ:
```
            <i class="fa fa-camera-retro fa-lg"></i> lớn hơn 33% so với thông thường
            <i class="fa fa-camera-retro fa-2x"></i> lớn gấp đôi
            <i class="fa fa-camera-retro fa-3x"></i> lớn gấp ba
            <i class="fa fa-camera-retro fa-4x"></i> lớn gấp bốn lần
            <i class="fa fa-camera-retro fa-5x"></i> lớn gấp năm lần
```

Bạn có thể tìm các biểu tượng ở đây: The icons (https://fontawesome.com)

### Hyperlink (Siêu liên kết)

1. Hyperlink (siêu liên kết)

Hyperlink (siêu liên kết) thường được gọi tắt là link, các link khiến cho web trở thành một mạng lưới. Các văn bản (document) kết hợp cùng với nhau tạo ra loại kiến thức, các công cụ tìm kiếm. Nó cung cấp nội dung đầy đủ và toàn diện về vấn đề mà người dùng quan tâm. Người dùng có thể tiếp cận kiến thức này bằng cách đi từ trang này sang trang khác.

Link được gọi là anchor link (liên kết neo), chữ a trong tag <a> là viết tắt của từ anchor.

Ví dụ: <a href="http://www.umich.edu">University of Michigan</a>

Một anchor tag <a> có 2 phần khác nhau:

    Phần tham chiếu (hyper reference: viết tắt là href): tham chiếu đến vị trí của nội dung mới. Nó chính là trang đích nếu người dùng click chuột vào link. Ví dụ: http://www.umich.edu
    Phần nội dung (anchor text): là văn bản sẽ hiển thị cho người dùng nhìn thấy. Nó thường được gạch chân. Phần nội dung này có thể là hình ảnh. Bằng cách bạn đặt thẻ <img> vào bên trong thẻ <a>

2. Các loại đường dẫn

Có các loại đường dẫn khác nhau:

* Loại phổ biến nhất được gọi là đường dẫn tuyệt đối (absolute). Chúng ta cần phải nhập một url đầy đủ vào thuộc tính href của hyperlink. Các bạn cần phải có http hoặc https, địa chỉ và bất kỳ loại tên tài liệu bổ sung nào các bạn muốn.
* Đường dẫn tương đối (relative) thường dùng để trỏ đến một trang khác đang nằm trong cùng ứng dụng. Đường dẫn loại này thường chứa thông tin folder và tên file đích. Ví dụ: docs/page2.html
* Đường dẫn nội bộ (internal): trỏ đến một phần nội dung trong trang. Nó sử dụng thuộc tính ID để tham chiếu đến nội dung. Ví dụ: bạn có một mục được đặt id=”history”, bạn có thể sử dụng link có href=”#history” để trỏ đến nó

Một lưu ý khi dùng link là không bao giờ bạn sử dụng đường dẫn đến ổ trên máy tính của bạn. Ví dụ: C:Page hoặc MyDocumentSpage. Khi đưa trang lên web, đường dẫn đó sẽ không còn đúng nữa. Hoặc đơn giản là nếu bạn gửi sang máy khác, đường dẫn đó sẽ không còn đúng nữa.

3. Thuộc tính target (đích)

Nếu các bạn không bao gồm target vào thì khi các bạn click vào một link, link sẽ mở trong cùng một tab hoặc cùng window mà các bạn đang xem. Giá trị mặc định của targer=”_self”.

Chúng ta có thể thay đổi bằng một vài giá trị khác:

Nếu các bạn đặt target = “_blank” (rỗng) các bạn sẽ rời khỏi trang hiện tại của các bạn và mở một tab hoặc window mới để mở trang mới. Điều này có ưu điểm và nhược điểm của nó. Ưu điểm là trang web của các bạn vẫn mở trong window của ai đó. Nhược điểm là nhiều người không thích việc nó tiếp tục mở thêm tab mở thêm tab, và khi họ xem trang của các bạn, họ lại phải mở ngày càng nhiều tab hơn.

Hai giá trị còn lại là “_top” và “_parent” ít được dùng. Giá trị “_parent”  sẽ mở liên kết trong khung chính. Nhưng HTML5 đã loại bỏ khung và không còn dùng nữa.


-------------
### Multimedia (đa phương tiện)

#### Đa phương tiện trong HTML5

Đa phương tiện (multimedia) bao gồm video (đoạn phim) và video (âm thanh) trên trang web của bạn. HTML5 hỗ trợ cả video và audio trên trang.

Trước HTML5, người ta chưa có một cách tổ chức nhất quán cho việc sử dụng đa phương tiện trên tất cả các trình duyệt. Để hiển thị video hoặc audio, người ta thường phải dùng thêm các phần bổ trợ (plugin) như là Quicktime hoặc Flash,…HTML5 mới được thiết kế để tránh việc sử dụng phải sử dụng phần bổ trợ hoặc phần mềm bổ sung mà bạn chưa có trên máy tính của bạn. HTML5 sử dụng hai tag tương ứng là ``<video> và <audio>.``

* Thẻ <video>

<video> sử dụng một thuộc tính source (nguồn) để chỉ ra đường dẫn của file tương ứng. Bạn có thể nhúng cùng lúc nhiều file video khác nhau.
```
<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
Trình duyệt của bạn không hỗ trợ thẻ video.
</video>
```

Ngoài ra, bạn cũng có thể dùng một số thuộc tính phổ biến như:

* Width: kích thước tính theo chiều ngang của video
* Height: kích thước tính theo chiều dọc
* Autoplay: tự động chạy khi video được tải
* Loop: tự động phát lại
* Controls: hiển thị các nút điều khiển như chạy/dừng, hiển thị thời gian, điều chỉnh âm lượng, phóng to, …
* Văn bản thay thế: (tương tự như thuộc tính alt của thẻ <img>) sẽ hiển thị nếu trình duyệt không hỗ trợ tag hoặc không thể phát video, bạn sẽ có gợi ý hữu ích cho người dùng cho họ biết ở đây, họ nên thấy một video.

Không phải loại video nào cũng có thể phát trên HTML5. Nó chỉ hỗ trợ một số định dạng video nhất định gồm 3 loại:
File Format 	Media Type
MP4 	video/mp4
WebM 	video/webm
Ogg 	video/ogg

#### Thẻ <audio>

Thẻ <audio> tương tự như thẻ <video>. Nó cũng dùng thuộc tính source để liên kết đến file. Các thuộc tính phổ biến vẫn là  autoplay, control và loop. Ngoài ra chúng ta cũng có buffered (đệm), muted (tắt tiếng) và volume (âm lượng). Đây là những thuộc tính bổ sung mà bạn có thể thêm vào để kiểm soát những gì người đó đang lắng nghe và âm lượng ở mức nào.

Tương tự như <video> HTML5 chỉ hỗ trợ một số định dạng audio nhất định gồm 3 loại:
File Format 	Media Type
MP3 	audio/mpeg
OGG 	audio/ogg
WAV 	audio/wav

----------------

### Table (Bảng)

#### Bảng

Bảng giúp sắp xếp mọi thứ theo hàng (row) hoặc cột (column) khác nhau. Nó hiển thị dữ liệu dưới dạng bảng gồm các hàng đan với các cột. Nó tạo thành các ô (cell). Nếu bảng có m hàng và n cột, nó sẽ có m*n ô.

Tuy nhiên, việc dùng bảng cần phải có kế hoạch cụ thể. Trước tiên, bạn cần phải xác định nội dung chính xác. Nếu đó thực sự là nội dung nên hiển thị ở chế độ hàng và cột, bạn nên dùng bảng.

Bước tiếp theo, hãy xác định số cột và số hàng bạn sẽ dùng. Bạn cần xác định rõ ràng để tránh việc phải sửa bảng về sau. Bởi vì, việc thêm hay bớt một cột vào bảng mất rất nhiều thời gian.

#### Tạo bảng

Để tạo bảng, chúng ta dùng bộ thẻ <table> <tr> và <td>. Đây là một ví dụ về bảng:

    <table>

        <tr>

            <td>One</td>

            <td>Two</td>

            <td>Three</td>

        </tr>

        <tr>

            <td>Four</td>

            <td>Five</td>

            <td>Six</td>

        </tr>

        <tr>

            <td>Seven</td>

            <td>Eight</td>

            <td>Nine </td>

        </tr>

    </table>

Bạn bắt đầu với tag <table> (bảng) về cơ bản, nó chỉ là một phần tử container (vùng chứa) mà sẽ lưu tất cả các thuộc tính khác và tất cả các tag khác bên trong nó.

Bên trong <table> chúng ta dùng thẻ <tr> để tạo ra các hàng (row) và bên trong mỗi <tr> chúng ta dùng các thẻ <td> cho từng ô.

Mỗi hàng đều có số cột giống nhau. Trừ trường hợp các bạn muốn gộp một vài ô với nhau, chúng ta cần chú ý để số thẻ <td> trong từng <tr> là giống nhau.

Nó sẽ hiển thị lên như sau: 

Bạn có thể thấy, nó có 3 dòng và 3 cột. Nó tạo thành 9 ô cho 9 giá trị.

#### Tiêu đề bảng (table heading)

Tiêu đề bảng (table heading) vào code của bạn. Tiêu đề bảng tức là ở đầu mỗi cột, hoặc thậm chí ở đầu hoặc đầu mỗi hàng, bạn có văn bản được in đậm, cho biết đây không phải là dữ liệu, đây là tên của dữ liệu mà chúng ta đang xem xét.

Chúng ta dùng thẻ <th> thay cho thẻ <td> tiêu đề bảng. Bạn thường đặt tiêu đề là dòng đầu tiên hoặc cột đầu tiên trong bảng.

        <tr>

            <th>Column One</th>

            <th>Column Two</th>

            <th>Column Three</th>

        </tr>

Gộp các ô

Bạn có thể kết hợp nhiều hàng và hoặc nhiều cột bằng cách sử dụng các thuộc tính rowspan và colspan.

Colspan sẽ thực hiện gộp các ô theo hàng. colspan = 5  nếu bạn muốn hợp nhất 5 ô trên cùng 1 hàng (gộp 5 cột).

Rowspan sẽ thực hiện gộp các ô theo cột. Ví dụ: rowspan = 2 nếu bạn muốn hợp nhất 2 ô trên cùng 1 cột (gộp 2 hàng).

Ví dụ:

    <table border="1">

        <tr>

            <th>Child's Name: </th>

            <th>Parent's Name: </th>

        </tr>

        <tr>

            <td rowspan="2">Catherine</td>

            <td>Michael McCarthy</td>

        </tr>

        <tr>

            <td>Colleen McCarthy</td>

        </tr>

        <tr>

            <td>Maggie</td>

            <td>Sheila McGee</td>

        </tr>

    </table>

Sẽ hiển thị như sau:

Table caption (chú thích)

Chúng ta có thể dùng thẻ <caption> để tạo chú thích cho dữ liệu trong bảng.

<caption>Monthly savings</caption>


### Một số tag (thẻ) thường dùng

Nhóm thẻ containers

Container là đơn giản là nơi các bạn có thể đặt code cùng mục tiêu với nhau. Nhóm thẻ này gồm <article> (bài viết) hoặc <aside> (một bên), <section> (phần), <main> (phần chính).

    <header> thường được sử dụng để nhóm phần giới thiệu
    <main> là phần thân chính của nội dung
    <section> để thể hiện một phần nội dung.
    <aside> thể hiện nội dung phụ, bên cạnh <main>
    <footer> là phần tử cuối cùng của trang, nằm ở dưới cùng.
    <nav> là một phần của trang liên kết đến các trang khác hoặc các phần trong trang của các bạn. Thông thường, các bạn sẽ tìm thấy tag <nav> được nhúng bên trong tag <header>.

Đây đều là các thẻ semantic được thêm vào từ HTML5

Nhóm thẻ nội dung

    <hr>: vẽ ra một gạch ngang, giúp phân tách các phần khác nhau
    <address>: trình duyệt sẽ in nghiêng những thứ bên trong nội dung.
    <blockquote>: cho phép thụt lề code và cho phép mọi người biết rằng các bạn đang nhìn vào một trích dẫn
    <details>:kết hợp với một tag <summary> (tóm tắt)

Nhóm thẻ inline

Inline tag có nghĩa là các bạn có thể đặt nó vào trang và các dòng khác cũng sẽ cứ như vậy.

<span> là tag inline ban đầu cho văn bản thuần túy. Ngoài ra còn có <cite>, <abbr> (viết tắt), <time> (thời gian), <code> và sau đó là <sub> (chỉ số dưới) và <sup> (chỉ số trên).


### Kiểm duyệt trang web

#### Kiểm duyệt trang web

Viết mã HTML thường không khó. Trong nhiều trường hợp, mặc dù chúng ta viết sai nhưng trình duyệt vẫn hiển thị đúng theo mong muốn. Nhiều lập trình viên có thói quen viết code, rồi kiểm tra kết quả trên trình duyệt. Nếu thấy nó hiển thị tốt, bạn cho rằng mình đã làm đúng và tiếp tục làm phần mới.

Thực tế là trình duyệt đã tìm kiếm các lỗi và cố gắng sửa những lỗi đó.

Tuy nhiên, không phải trình duyệt nào cũng thực hiện sửa lỗi giống nhau. Và quan trọng hơn, các cỗ máy tìm kiếm sẽ không đánh giá cao nếu trang của bạn còn nhiều lỗi.

Để tránh những lỗi như vậy, chúng ta dùng trình kiểm duyệt được cung cấp miễn phí ở https://validator.w3.org/

Có 3 cách để thực hiện kiểm duyệt code:

* Cách 1: Nếu bạn đã đưa trang web lên internet, bạn có thể cung cấp đường dẫn của trang web vào mục Validate by URI:

* Cách 2: Bạn có thể tải lên file html bằng cách chọn Validate by File Upload:

* Cách 3: Bạn có thể nhập nội dung hoặc copy/paste nội dung vào mục Validate by Direct Input:

Sau khi đã nhập thông tin theo 1 trong 3 cách trên, bạn hãy ấn nut Check để thực hiện kiểm duyệt. Ứng dụng sẽ trả về các thông báo lỗi trong trang của bạn, kèm với phần giải thích và hướng dẫn sửa:

Bạn hãy thực hiện sửa code và tiếp tục kiểm duyệt cho đến khi hết các lỗi.