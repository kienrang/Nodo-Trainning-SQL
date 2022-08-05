--1. Li?t kê tên nhân viên, mã phòng ban và l??ng nhân viên ???c t?ng 15% (PCTSAL).
select e.deptno, e.ename, e.sal + e.sal*0.15 as PCTSAL from EMP e;

--2. Vi?t câu l?nh hi?n th? nh? sau:
select RPAD(e.ename, 8, '*') || LPAD(e.job, 8,'*') from EMP e;
--3. Vi?t câu l?nh hi?n th? nh? sau:
select e.ename || '(' || e.job || ')' from EMP e;
--4. Vi?t câu l?nh hi?n th? nh? sau:
--5. Tìm ngày th? 6 ??u tiên cách 2 tháng so v?i ngày hi?n t?i hi?n th? ngày d??i d?ng 09 February 1990. 
--select NEXT_DAY(GET_DATE(), 'FRIDAY');
--6. Tìm thông itn v? tên nhân viên, ngày gia nh?p công ty c?a nhân viên phòng s? 20, sao cho hi?n th? nh? sau: 
select e.ename , to_char(e.hiredate, 'MONTH,DAY,yyyy') from EMP e;
--7. Hi?n th? tên nhân viên, ngày gia nh?p công ty, ngày xét nâng l??ng (sau ngày gia
--nh?p công ty 1 n?m), s?p x?p theo th? t? ngày xét nâng l??ng.
select e.ename, to_char(e.hiredate, 'dd-MM-yyyy'), to_char(add_months(e.hiredate,12), 'dd-MM-yyyy') from EMP e;

--8. Hi?n th? tên nhân viên và l??ng d??i d?ng
    select e.ename, case when e.sal < 1500 then 'BELOW 1500' when e.sal = 1500 then 'On Taget' when e.sal > 1500 then to_char(e.sal) end  as  SALARY from EMP e;
--9. Cho bi?t th? c?a ngày hi?n t?i
select to_char(CURRENT_DATE, 'DAY') as DAY from DUAL ;
--10. ??a chu?i d??i d?ng nn/nn, ki?m tra n?u khúng khuôn d?ng tr? l?i là YES, ng??c l?i
--là NO. Ki?m tra v?i các chu?i 12/34, 01/1a, 99\88
select DECODE('01/1a','12/34','YES', '01/1a', 'NO', '99\88', 'NO', 'und')  from DUAL;
--11. Hi?n th? tên nhân viên, ngày gia nh?p công ty, ngày l?nh l??ng sao cho ngày l?nh
--l??ng ph?i vào th? 6, nhân viên ch? ???c nh?n l??ng sau ít nh?t 15 ngày làm vi?c t?i
--công ty, s?p x?p theo th? t? ngày gia nh?p công ty.
select e.ename, to_char(e.hiredate, 'dd-MM-yyyy'), to_char(NEXT_DAY(e.hiredate+15, 'FRIDAY'), 'dd-MM-yyyy') as SALARY_DATE from EMP e order by e.hiredate asc;

--4.5.2. Hàm trên nhóm d? li?u
--1. Tìm l??ng th?p nh?t, l?n nh?t và l??ng trung bình c?a t?t c? các nhân viên
select  min(e.sal) as MIN, max(e.sal) MAX, AVG(e.sal) from EMP e;

--2. Tìm l??ng nh? nh?t và l?n c?a m?i lo?i ngh? nghi?p
select min(e.sal) as MIN, max(e.sal) as MAX, e.job MAX from EMP  e group by e.job;
--3. Tìm xem có bao nhiêu giám ??c trong danh sách nhân viên.
select count(*) as Quantity  from EMP e where e.job = 'PRESIDENT';
--4. Tìm t?t c? các phòng ban mà s? nhân viên trong phòng >3
select d.deptno, d.dname from DEPT d where d.deptno in (select e.deptno from EMP e group by e.deptno having count(*) > 3 );

--5. Tìm ra m?c l??ng nh? nh?t c?a m?i nhân viên làm vi?c cho m?t giám ??c nào ?ó
--s?p x?p theo th? t? t?ng d?n c?a m?c l??ng.
--select e.ename, e.sal, e.deptno, e.job from EMP e where e.deptno in (select e.deptno from EMP e group by e.deptno) and e.job <> 'MANAGER';
select e.job, min(e.sal) from EMP e where e.job <> 'MANAGER' group by e.job;



