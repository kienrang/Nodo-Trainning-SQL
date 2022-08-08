--1. T?o b?ng PROJECT v?i các column ???c ch? ra d??i ?ây, PROJID là promary key, và P_END_DATE > P_START_DATE. 
create Table PROJECT_BEERS(
    PROJID NUMBER(4) primary key,
    P_DESC VARCHAR2(20),
    P_START_DATE DATE,
    P_END_DATE DATE,
    BUDGET_AMOUNT NUMBER (7,2),
    MAX_NO_STAFF NUMBER(2),
    check(P_END_DATE > P_START_DATE)
);
--2. T?o b?ng ASSIGNMENTS v?i các column ???c ch? ra d??i ?ây, ??ng th?i c?t
--PROJID là foreign key t?i b?ng PROJECT, c?t EMPNO là foreign key t?i b?ng EMP.
    create table ASSIGNMENTS_BEERS (
    PROJID NUMBER(4) NOT NULL,
    EMPNO NUMBER(4) NOT NULL,
    A_START_DATE DATE,
    A_END_DATE DATE,
    BILL_AMOUNT NUMBER(4,2),
    ASSIGN_TYPE VARCHAR2(2),
    PRIMARY KEY (PROJID,EMPNO),
    Constraint FK_BEER_ASS_AND_PROJECT FOREIGN  KEY (PROJID) REFERENCES SCOTT.PROJECT_BEERS(PROJID),
    Constraint FK_BEER_ASS_AND_EMP FOREIGN  KEY (EMPNO) REFERENCES SCOTT.EMP(EMPNO)
)

select * from PROJECT_BEERS;

--3. Thêm column COMMENTS ki?u LONG vào b?ng PROJECTS. Thêm column HOURS ki?u
--NUMBER vào b?ng ASSIGNMENTS.

    alter table PROJECTS add column COMMENT long;
    alter table ASSIGNMENTS add column HOURS NUMBER;

--4. S? d?ng view USER_OBJECTS hi?n th? t?t c? các ??i t??ng user s? h?u.
--5. Thêm ràng bu?c duy nh?t (UNIQUE) cho 2 column PROJECT_ID và EMPNO c?a b?ng
--ASSIGNMENTS.

    alter table ASSIGNMENTS add Unique (PROJID);
    alter table ASSIGNMENTS add Unique (EMPNO);
--6. Xem các thông tin v? các ràng bu?c trong USER_CONSTRAINTS.
    select * from USER_CONSTRANTS;
--7. Xem trong USER hi?n t?i có t?t c? bao nhiêu b?ng. 
    SELECT COUNT(*) FROM DICTIONARY;

