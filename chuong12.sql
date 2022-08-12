-- 1. Viết đoạn chương trình tìm kiếm các hàng trong bảng EMP với biến được đưa từ
-- ngoài vào là &1 dạng JOb_type(emp.job%type) và đưa ra thông báo thích hợp
-- vào bảng MESSAGES.

 
-- 2. Viết đoạn chương trình ghi dữ liệu vào bảng MESSAGES với cột NUMCOL1 mang giá trị
-- là 1 nếu là row 1 được Insert, 2 nếu row 2 được Insert... . Không được Insert những
-- row có giá trị là 6 hoặc 8, thoát khỏi vòng lặp insert sau giá trị 10. Commit sau vòng
-- lặp. 

-- 3. Liệt kê các cột ENAME, HIREDATE, SAL Với điều kiện EMPNO bằng giá trị biến
-- &EMPLOYEE_NO được đưa vào, sau đó kiểm tra:
-- 1.1 Có phải mức lương lớn hơn 1200
-- 1.2 Tên nhân viên có phải có chứa chữ T
-- 1.3 ngày gia nhập cơ quan có phải là tháng 10 (DEC)
-- và đưa giá trị kiểm tra này vào bảng message cột charcol1 (thử với các giá trị 7654, 7369,
-- 7900, 7876)

-- 4. Đưa vào vòng lặp v từ 1 đến 10 lệnh:
-- UPDATE messages
-- SET numcol2=100
-- WHERE numcol1 = v;
-- nếu bất kỳ một lần update nào đó có số lượng row >1 thì exit khỏi vòng lặp. 