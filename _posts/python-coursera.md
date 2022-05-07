Lists: có thể thay đổi vị trí index của data. (mutable-có thể thay đổi)

Tuples: không thể thay đổi index ứng với data (immutable). Các function trả về kết quả dạng nhiều value thì đó là tuple đấy.

Ví dụ: hàm convert_seconds ``return hours, mins, secs``
hours, mins, secs = convert_seconds(5000)
=> gán các giá trị trong tuple ra từng variables
