-- 1, ch?n to�n b? th�ng tin trong b?ng SALGRADE
SELECT * from SALGRADE;
-- 2, Ch?n to�n b? th�ng tin trong b?ng EMP
SELECT * from EMP;
--     3. Hi?n th? m?i lo?i ngh? nghi?p
Select JOB from EMP;
-- 4, Hi?n th? t�n nh�n vi�n v� thu nh?p trong m?t n?m (REMUNERATION)
select ENAME, SAL*12 REMUNERATION from EMP order by REMUNERATION desc;
-- 5. Hi?n th? theo n?i dung d??i ?�y Who, what and when

SELECT EMP.ENAME || ' HAS HELP THE POSITION OF ' || (EMP.JOB) || ' IN DEPT Since ' || EMP.HIREDATE from EMP;

--6. Hi?n th? c?u tr�c b?ng emp;
   DESCRIBE SCOTT.EMP

--7. Thay ??i nh�n v� ??nh d?ng hi?n th? c?a c?t sal v� hiredate trong b?ng emp;

-- Ch??ng 3

-- 1. Ch?n nh�n vi�n trong b?ng EMP c� m?c l??ng t? 1000 ??n 2000 (ch?n c�c tr??ng
-- ENAME, DEPTNO, SAL).

    select EMP.ENAME, EMP.DEPTNO, EMP.SAL from EMP where EMP.SAL between 1000 and 2000;

-- 2. Hi?n th? m� ph�ng ban, t�n ph�ng ban, s?p x?p theo th? t? t�n ph�ng ban DEPTNO DNAME
    Select DEPTNO, DNAME from DEPT  order by DNAME asc;
-- 3. Hi?n th? danh s�ch nh?ng nh�n vi�n l�m t?i ph�ng 10 v� 20 theo th? t? A,B,C
    select * from EMP where DEPTNO = 10 or DEPTNO = 20;
-- 4. Hi?n th? t�n v� ngh? nghi?p nh?ng nh�n vi�n l�m ngh? th? k� (cleck) t?i ph�ng 20.
    select ENAME, JOB from EMP where EMP.JOB = 'CLERK' and DEPTNO = 20;
-- 5. Hi?n th? t?t c? nh?ng nh�n vi�n m� t�n c� c�c k� t? TH v� LL.
    select * from EMP where EMP.ENAME like '%TH%' or EMP.ENAME like '%LL%';
-- 6. Hi?n th? t�n nh�n vi�n, ngh? nghi?p, l??ng c?a nh?ng nh�n vi�n c� gi�m ??c qu?n l�.
    select e.ENAME, e.JOB, e.SAL from EMP e where e.JOB <> 'PRESIDENT';
-- 7. Hi?n th? t�n nh�n vi�n, m� ph�ng ban, ng�y gia nh?p c�ng ty sao cho gia nh?p c�ng ty trong n?m 1983.
    select e.ENAME, e.DEPTNO, e.HIREDATE from EMP e where  e.HIREDATE like '%_83';
-- 8. Hi?n th? t�n nh�n vi�n, l??ng m?t n?m (ANUAL_SAL ), th??ng sao cho l??ng l?n
-- h?n th??ng v� ngh? nghi?p l� SALEMAN, s?p theo th? t? l??ng gi?m d?n v� t�n t?ng
    Select e.SAL*12 as ANUAL_SAL, e.COMM from EMP e where e.SAL > e.COMM and e.JOB = 'SALESMAN' order by e.SAL desc
