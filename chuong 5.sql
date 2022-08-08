--1. Hi?n th? toàn b? tên nhân viên và tên phòng ban làm vi?c s?p x?p theo tên phòng
--ban. 
select e.ename ,d.dname from EMP e join DEPT d on e.deptno = d.deptno order by d.dname   ;
--2. Hi?n th? tên nhân viên, v? trí ??a lý, tên phòng v?i ?i?u ki?n l??ng >1500. 
select e.ename, d.loc, d.dname  from EMP e join DEPT d on e.deptno = d.deptno where e.sal > 1500;

--3. Hi?n th? tên nhân viên, ngh? nghi?p, l??ng và m?c l??ng
select e.ename, e.job, e.sal, s.grade from EMP e,salgrade s;
select * from  salgrade;

--4. Hi?n th? tên nhân viên, ngh? nghi?p, l??ng và m?c l??ng, v?i ?i?u ki?n m?c l??ng=3. 
select e.ename, e.job, e.sal, s.grade from EMP e,salgrade s where s.grade = 3;
--5. Hi?n th? nh?ng nhân viên t?i DALLAS
select e.* from EMP e join DEPT d on e.deptno = d.deptno where d.loc = 'DALLAS';

--6. Hi?n th? tên nhân viên , ngh? nghi?p, l??ng, m?c l??ng, tên phòng làm vi?c tr? nhân
--viên có ngh? là cleck và s?p x?p theo chi?u gi?m. 

select e.ename, e.job, e.sal, s.grade, d.dname from salgrade s ,EMP e join DEPT d on e.deptno = d.deptno where e.job <> 'CLERK' order by e.sal desc;
--7. Hi?n th? chi ti?t v? nh?ng nhân viên ki?m ???c 36000 $ 1 n?m ho?c ngh? là cleck.
--(g?m các tr??ng tên, ngh?, thu nh?p, mã phòng, tên phòng, m?c l??ng)
select e.* from EMP e where e.sal*12 >=36000 or e.job like '%cleck';

--8. Hi?n th? nh?ng phòng không có nhân viên nào làm vi?c.

select * from dept d where d.deptno  not in (select d.deptno from EMP e,  DEPT d where e.deptno in d.deptno);


--9. Hi?n th? mã nhân viên, tên nhân viên, mã ng??i qu?n lý, tên ng??i qu?n lý
    
select e.empno,e.ename,e.mgr from EMP e where e.mgr in (SELECT EMPNO FROM EMP E WHERE EXISTS (SELECT EMPNO FROM EMP WHERE EMP.MGR = E.EMPNO));

    
    
--10. Nh? câu 9 hi?n th? thêm thông tin v? ông KING
--11. Hi?n th? ngh? nghi?p ???c tuy?n d?ng vào n?m 1981 và không ???c tuy?n d?ng vào
--n?m 1994.
    select  from EMP e
--12. Tìm nh?ng nhân viên gia nh?p công ty tr??c giám ??c c?a h?.  
--13. Tìm t?t c? các nhân viên, ngày gia nh?p công ty, tên nhân viên, tên ng??i giám ??c
--và ngày gia nh?p công ty c?a ng??i giám ??c ?y.
--14. Tìm nh?ng nhân viên ki?m ???c l??ng cao nh?t trong m?i lo?i ngh? nghi?p
--15. Tìm m?c l??ng cao nh?t trong m?i phòng ban, s?p x?p theo th? t? phòng ban
--16. Tìm nhân viên gia nh?p vào phòng ban s?m nh?t 
--17. Hi?n th? nh?ng nhân viên có m?c l??ng l?n h?n l??ng TB c?a phòng ban mà h? làm vi?c.
--18. Hi?n th? tên nhân viên, mã nhân viên, mã giám ??c, tên giám ??c, phòng ban làm
--vi?c c?a giám ??c, m?c l??ng c?a giám ??c.
