--1. Li?t k� t�n nh�n vi�n, m� ph�ng ban v� l??ng nh�n vi�n ???c t?ng 15% (PCTSAL).
select e.deptno, e.ename, e.sal + e.sal*0.15 as PCTSAL from EMP e;

--2. Vi?t c�u l?nh hi?n th? nh? sau:
select RPAD(e.ename, 8, '*') || LPAD(e.job, 8,'*') from EMP e;
--3. Vi?t c�u l?nh hi?n th? nh? sau:
select e.ename || '(' || e.job || ')' from EMP e;
--4. Vi?t c�u l?nh hi?n th? nh? sau:
--5. T�m ng�y th? 6 ??u ti�n c�ch 2 th�ng so v?i ng�y hi?n t?i hi?n th? ng�y d??i d?ng 09 February 1990. 
--select NEXT_DAY(GET_DATE(), 'FRIDAY');
--6. T�m th�ng itn v? t�n nh�n vi�n, ng�y gia nh?p c�ng ty c?a nh�n vi�n ph�ng s? 20, sao cho hi?n th? nh? sau: 
select e.ename , to_char(e.hiredate, 'MONTH,DAY,yyyy') from EMP e;
--7. Hi?n th? t�n nh�n vi�n, ng�y gia nh?p c�ng ty, ng�y x�t n�ng l??ng (sau ng�y gia
--nh?p c�ng ty 1 n?m), s?p x?p theo th? t? ng�y x�t n�ng l??ng.
select e.ename, to_char(e.hiredate, 'dd-MM-yyyy'), to_char(add_months(e.hiredate,12), 'dd-MM-yyyy') from EMP e;

--8. Hi?n th? t�n nh�n vi�n v� l??ng d??i d?ng
    select e.ename, case when e.sal < 1500 then 'BELOW 1500' when e.sal = 1500 then 'On Taget' when e.sal > 1500 then to_char(e.sal) end  as  SALARY from EMP e;
--9. Cho bi?t th? c?a ng�y hi?n t?i
select to_char(CURRENT_DATE, 'DAY') as DAY from DUAL ;
--10. ??a chu?i d??i d?ng nn/nn, ki?m tra n?u kh�ng khu�n d?ng tr? l?i l� YES, ng??c l?i
--l� NO. Ki?m tra v?i c�c chu?i 12/34, 01/1a, 99\88
select DECODE('01/1a','12/34','YES', '01/1a', 'NO', '99\88', 'NO', 'und')  from DUAL;
--11. Hi?n th? t�n nh�n vi�n, ng�y gia nh?p c�ng ty, ng�y l?nh l??ng sao cho ng�y l?nh
--l??ng ph?i v�o th? 6, nh�n vi�n ch? ???c nh?n l??ng sau �t nh?t 15 ng�y l�m vi?c t?i
--c�ng ty, s?p x?p theo th? t? ng�y gia nh?p c�ng ty.
select e.ename, to_char(e.hiredate, 'dd-MM-yyyy'), to_char(NEXT_DAY(e.hiredate+15, 'FRIDAY'), 'dd-MM-yyyy') as SALARY_DATE from EMP e order by e.hiredate asc;

--4.5.2. H�m tr�n nh�m d? li?u
--1. T�m l??ng th?p nh?t, l?n nh?t v� l??ng trung b�nh c?a t?t c? c�c nh�n vi�n
select  min(e.sal) as MIN, max(e.sal) MAX, AVG(e.sal) from EMP e;

--2. T�m l??ng nh? nh?t v� l?n c?a m?i lo?i ngh? nghi?p
select min(e.sal) as MIN, max(e.sal) as MAX, e.job MAX from EMP  e group by e.job;
--3. T�m xem c� bao nhi�u gi�m ??c trong danh s�ch nh�n vi�n.
select count(*) as Quantity  from EMP e where e.job = 'PRESIDENT';
--4. T�m t?t c? c�c ph�ng ban m� s? nh�n vi�n trong ph�ng >3
select d.deptno, d.dname from DEPT d where d.deptno in (select e.deptno from EMP e group by e.deptno having count(*) > 3 );

--5. T�m ra m?c l??ng nh? nh?t c?a m?i nh�n vi�n l�m vi?c cho m?t gi�m ??c n�o ?�
--s?p x?p theo th? t? t?ng d?n c?a m?c l??ng.
--select e.ename, e.sal, e.deptno, e.job from EMP e where e.deptno in (select e.deptno from EMP e group by e.deptno) and e.job <> 'MANAGER';
select e.job, min(e.sal) from EMP e where e.job <> 'MANAGER' group by e.job;



