--1. Hi?n th? to�n b? t�n nh�n vi�n v� t�n ph�ng ban l�m vi?c s?p x?p theo t�n ph�ng
--ban. 
select e.ename ,d.dname from EMP e join DEPT d on e.deptno = d.deptno order by d.dname   ;
--2. Hi?n th? t�n nh�n vi�n, v? tr� ??a l�, t�n ph�ng v?i ?i?u ki?n l??ng >1500. 
select e.ename, d.loc, d.dname  from EMP e join DEPT d on e.deptno = d.deptno where e.sal > 1500;

--3. Hi?n th? t�n nh�n vi�n, ngh? nghi?p, l??ng v� m?c l??ng
select e.ename, e.job, e.sal, s.grade from EMP e,salgrade s;
select * from  salgrade;

--4. Hi?n th? t�n nh�n vi�n, ngh? nghi?p, l??ng v� m?c l??ng, v?i ?i?u ki?n m?c l??ng=3. 
select e.ename, e.job, e.sal, s.grade from EMP e,salgrade s where s.grade = 3;
--5. Hi?n th? nh?ng nh�n vi�n t?i DALLAS
select e.* from EMP e join DEPT d on e.deptno = d.deptno where d.loc = 'DALLAS';

--6. Hi?n th? t�n nh�n vi�n , ngh? nghi?p, l??ng, m?c l??ng, t�n ph�ng l�m vi?c tr? nh�n
--vi�n c� ngh? l� cleck v� s?p x?p theo chi?u gi?m. 

select e.ename, e.job, e.sal, s.grade, d.dname from salgrade s ,EMP e join DEPT d on e.deptno = d.deptno where e.job <> 'CLERK' order by e.sal desc;
--7. Hi?n th? chi ti?t v? nh?ng nh�n vi�n ki?m ???c 36000 $ 1 n?m ho?c ngh? l� cleck.
--(g?m c�c tr??ng t�n, ngh?, thu nh?p, m� ph�ng, t�n ph�ng, m?c l??ng)
select e.* from EMP e where e.sal*12 >=36000 or e.job like '%cleck';

--8. Hi?n th? nh?ng ph�ng kh�ng c� nh�n vi�n n�o l�m vi?c.

select * from dept d where d.deptno  not in (select d.deptno from EMP e,  DEPT d where e.deptno in d.deptno);


--9. Hi?n th? m� nh�n vi�n, t�n nh�n vi�n, m� ng??i qu?n l�, t�n ng??i qu?n l�
    
select e.empno,e.ename,e.mgr from EMP e where e.mgr in (SELECT EMPNO FROM EMP E WHERE EXISTS (SELECT EMPNO FROM EMP WHERE EMP.MGR = E.EMPNO));

    
    
--10. Nh? c�u 9 hi?n th? th�m th�ng tin v? �ng KING
--11. Hi?n th? ngh? nghi?p ???c tuy?n d?ng v�o n?m 1981 v� kh�ng ???c tuy?n d?ng v�o
--n?m 1994.
    select  from EMP e
--12. T�m nh?ng nh�n vi�n gia nh?p c�ng ty tr??c gi�m ??c c?a h?.  
--13. T�m t?t c? c�c nh�n vi�n, ng�y gia nh?p c�ng ty, t�n nh�n vi�n, t�n ng??i gi�m ??c
--v� ng�y gia nh?p c�ng ty c?a ng??i gi�m ??c ?y.
--14. T�m nh?ng nh�n vi�n ki?m ???c l??ng cao nh?t trong m?i lo?i ngh? nghi?p
--15. T�m m?c l??ng cao nh?t trong m?i ph�ng ban, s?p x?p theo th? t? ph�ng ban
--16. T�m nh�n vi�n gia nh?p v�o ph�ng ban s?m nh?t 
--17. Hi?n th? nh?ng nh�n vi�n c� m?c l??ng l?n h?n l??ng TB c?a ph�ng ban m� h? l�m vi?c.
--18. Hi?n th? t�n nh�n vi�n, m� nh�n vi�n, m� gi�m ??c, t�n gi�m ??c, ph�ng ban l�m
--vi?c c?a gi�m ??c, m?c l??ng c?a gi�m ??c.
