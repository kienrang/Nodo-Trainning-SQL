--1. T?o b?ng PROJECT v?i c�c column ???c ch? ra d??i ?�y, PROJID l� promary key, v� P_END_DATE > P_START_DATE. 
create Table PROJECT_BEERS(
    PROJID NUMBER(4) primary key,
    P_DESC VARCHAR2(20),
    P_START_DATE DATE,
    P_END_DATE DATE,
    BUDGET_AMOUNT NUMBER (7,2),
    MAX_NO_STAFF NUMBER(2),
    check(P_END_DATE > P_START_DATE)
);
--2. T?o b?ng ASSIGNMENTS v?i c�c column ???c ch? ra d??i ?�y, ??ng th?i c?t
--PROJID l� foreign key t?i b?ng PROJECT, c?t EMPNO l� foreign key t?i b?ng EMP.
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

--3. Th�m column COMMENTS ki?u LONG v�o b?ng PROJECTS. Th�m column HOURS ki?u
--NUMBER v�o b?ng ASSIGNMENTS.

    alter table PROJECTS add column COMMENT long;
    alter table ASSIGNMENTS add column HOURS NUMBER;

--4. S? d?ng view USER_OBJECTS hi?n th? t?t c? c�c ??i t??ng user s? h?u.
    DESCRIBE USER_OBJECT;

--5. Th�m r�ng bu?c duy nh?t (UNIQUE) cho 2 column PROJECT_ID v� EMPNO c?a b?ng
--ASSIGNMENTS.

    alter table ASSIGNMENTS add Unique (PROJID);
    alter table ASSIGNMENTS add Unique (EMPNO);
--6. Xem c�c th�ng tin v? c�c r�ng bu?c trong USER_CONSTRAINTS.
        SELECT * FROM USER_CONSTRAINTS

--7. Xem trong USER hi?n t?i c� t?t c? bao nhi�u b?ng. 
SELECT  COUNT(PROJECT_BEERS) COUNT_TABLE FROM DICTIONARY
