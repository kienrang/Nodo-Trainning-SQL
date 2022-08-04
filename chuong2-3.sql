-- 1, ch?n toàn b? thông tin trong b?ng SALGRADE
SELECT * from SALGRADE;
-- 2, Ch?n toàn b? thông tin trong b?ng EMP
SELECT * from EMP;
--     3. Hi?n th? m?i lo?i ngh? nghi?p
Select JOB from EMP;
-- 4, Hi?n th? tên nhân viên và thu nh?p trong m?t n?m (REMUNERATION)
select ENAME, SAL*12 REMUNERATION from EMP order by REMUNERATION desc;
-- 5. Hi?n th? theo n?i dung d??i ?ây Who, what and when

SELECT EMP.ENAME || ' HAS HELP THE POSITION OF ' || (EMP.JOB) || ' IN DEPT Since ' || EMP.HIREDATE from EMP;

--6. Hi?n th? c?u trúc b?ng emp;
   DESCRIBE SCOTT.EMP

--7. Thay ??i nhãn và ??nh d?ng hi?n th? c?a c?t sal và hiredate trong b?ng emp;

-- Ch??ng 3

-- 1. Ch?n nhân viên trong b?ng EMP có m?c l??ng t? 1000 ??n 2000 (ch?n các tr??ng
-- ENAME, DEPTNO, SAL).

    select EMP.ENAME, EMP.DEPTNO, EMP.SAL from EMP where EMP.SAL between 1000 and 2000;

-- 2. Hi?n th? mã phòng ban, tên phòng ban, s?p x?p theo th? t? tên phòng ban DEPTNO DNAME
    Select DEPTNO, DNAME from DEPT  order by DNAME asc;
-- 3. Hi?n th? danh sách nh?ng nhân viên làm t?i phòng 10 và 20 theo th? t? A,B,C
    select * from EMP where DEPTNO = 10 or DEPTNO = 20;
-- 4. Hi?n th? tên và ngh? nghi?p nh?ng nhân viên làm ngh? th? ký (cleck) t?i phòng 20.
    select ENAME, JOB from EMP where EMP.JOB = 'CLERK' and DEPTNO = 20;
-- 5. Hi?n th? t?t c? nh?ng nhân viên mà tên có các ký t? TH và LL.
    select * from EMP where EMP.ENAME like '%TH%' or EMP.ENAME like '%LL%';
-- 6. Hi?n th? tên nhân viên, ngh? nghi?p, l??ng c?a nh?ng nhân viên có giám ??c qu?n lý.
    select e.ENAME, e.JOB, e.SAL from EMP e where e.JOB <> 'PRESIDENT';
-- 7. Hi?n th? tên nhân viên, mã phòng ban, ngày gia nh?p công ty sao cho gia nh?p công ty trong n?m 1983.
    select e.ENAME, e.DEPTNO, e.HIREDATE from EMP e where  e.HIREDATE like '%_83';
-- 8. Hi?n th? tên nhân viên, l??ng m?t n?m (ANUAL_SAL ), th??ng sao cho l??ng l?n
-- h?n th??ng và ngh? nghi?p là SALEMAN, s?p theo th? t? l??ng gi?m d?n và tên t?ng
    Select e.SAL*12 as ANUAL_SAL, e.COMM from EMP e where e.SAL > e.COMM and e.JOB = 'SALESMAN' order by e.SAL desc
