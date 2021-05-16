# Mẹo viết commit message hữu ích khi dùng git
 

Git là một hệ thống quản lý phiên bản phân tán phổ biến với mục đích theo dõi sự thay đổi của các tập tin trên máy tính và phối hợp công việc nhóm trên những tập tin này. Là một lập trình viên thì một trong những công cụ cơ bản mà chúng tôi không thể bỏ qua chính là việc sử dụng git trong quy trình làm việc. Sau đây là một trong những sai lầm mà dân lập trình hay mắc phải, về mặt kỹ thuật thì không hẳn nhưng chúng ta hãy tự hỏi rằng “Nếu bạn có thể làm tốt hơn thì tại sao không làm?”


Một số quy tắc nên ghi nhớ khi viết commit message : 

1. Tách dòng chủ đề ra khỏi phần thân bằng một dòng trống 

2. Giới hạn dòng chủ đề tối đa 50 kí tự 

3. Viết hoa dòng chủ đề 

4. Sử dụng câu mệnh lệnh ở dòng chủ đề 

5. Không kết thúc dòng chủ đề bằng dấu chấm 

6. Gói gọn phần thân tối đa 72 kí tự 

7. Sử dụng phần thân để giải thích “Cái gì”,  “Tại sao” với “Như thế nào”


 

## Sai lầm #1: 
Chúng ta có khuynh hướng trộn lẫn chủ đề với phần thân của một commit message : Cách viết phần chủ đề chung với phần thân của thông điệp là một cách làm sai. Khi bạn nhận thấy commit message quá dài để giải thích thì có nghĩa là commit đang thực hiện quá nhiều thứ sẽ phá vỡ nó đi. 

Bạn viết: 

> git commit –m “added new css styling for danger button in order to differentiate between the primary button and other button styles.” 


Thay vì nên viết: 

> git commit –m “Add new feature”

 
 

## Sai lầm #2: 
Không giới hạn chủ đề tối đa 50 kí tự, phần thân của commit message tối đa 72 kí tự: Luôn đảm bảo chủ đề của commit không bao giờ vượt quá 50 kí tự và đây là qui tắc ngón tay cái. Thêm nhiều hơn số kí tự nên có sẽ có khuynh hướng sẽ bị Github cắt bớt đi, và vì những gì chúng ta đang cố gắng truyền tải là để một user nào đó trong nháy mắt biết được một commit đang làm gì.

Một vài commit message yêu cầu giải thích nhiều hơn đặc biệt là khi dòng chủ đề có nội dung mơ hồ, do đó thêm nội dung phần thân sẽ hữu ích trong những trường hợp này. Luôn cố gắng giới hạn số lượng kí tự phần thân tối đa 72 kí tự, và hãy để phần thân giải thích những gì commit đang thực hiện và tại sao lại làm như vậy. 


 

## Sai lầm #3: 

Không viết hoa cho chủ đề của commit 

Bạn viết: 

> git commit –m “added new feature” 

Thay vì nên viết: 
> git commit –m “Add new feature”

![](img/sailam-3.png)
 


## Sai lầm #4:
Kết thúc dòng chủ đề bằng dấu chấm 

Bạn viết: 

> git commit –m “Modified codebase.”
Thay vì nên viết: 
> git commit –m “Modify codebase”

 
 

## Sai lầm #5: 
Không sử dụng câu mệnh lệnh ở dòng chủ đề: 

Mọi git commit đúng chuẩn nên đặt ở dạng mệnh lệnh. “Đơn giản điều này có nghĩa là câu được viết theo dạng một hành động”. Một dòng chủ đề git commit thích hợp nên hoàn thành đúng cấu trúc cho câu sau đây: 


> If applied, this commit will "your subject line here" 

Ví dụ: 

> If applied, this commit will “Add auth to X” 

Từ đó, ta nhận thấy sẽ không đúng với những dạng không mệnh lệnh: 

> If applied, this commit will “added auth to Y” 

 

 

## Sai lầm #6: 
Phần thân giải thích Cái gì, Tại sao với Như thế nào: Như đã giải thích ở số **#2** trên, luôn đảm bảo phần thân của commit giải thích chính xác cái gì và tại sao commit đó đang thực hiện. Giải thích tại sao sự thay đổi đó là cần thiết, và khía cạnh khác mà nó mang lại. Thay vì miêu tả cách mà bạn giải quyết vấn đề trên.



*Một số câu nói vui về git:*

* Why did the commit cross the rebase? To git to the other repo 

Tạm dịch là:  Sao commit qua được rebase? Vì ta git đến repo khác :v 


* In case of fire: git commit, git push, leave the building 

Tạm dịch là:  Khi gặp cháy thì phải git commit, git push, rồi mới rời khỏi tòa nhà :v

 

**Cre:** https://code.likeagirl.io/useful-tips-for-writing-better-git-commit-messages-808770609503?fbclid=IwAR16siuZjdzxxQ4z9gz89BST5DPxINisBxzxVB-emDa-tuLl26KdkV15vsI



Bài viết về git commit đến đây là hết rồi, mời các bạn xem thêm các bài viết khác nhé ! 

***Tuyen Nguyen***
