select * from project_beers;
--1. Thêm dữ liệu vào bảng PROJECTS
insert into project_beers(PROJID, P_DESC, p_start_date, p_end_date, BUDGET_AMOUNT, MAX_NO_STAFF) 
    values  (1, 'WRITE C030 COURSE','02-JAN-88' , '07-JAN-88', 500, 1);
insert into project_beers(PROJID, P_DESC, p_start_date, p_end_date, BUDGET_AMOUNT, MAX_NO_STAFF) 
    values  (2, 'PROOF READ NOTES','01-JAN-89 ' , '10-JAN-89', 600, 1);
    
--2. Thêm dữ liệu vào bảng ASSIGNMENTS

insert into assignments_beers(PROJID, EMPNO, A_START_DATE, A_END_DATE, BILL_RATE, ASSIGN_TYPE, HOURS) 
    values  (1, 7369,'01-JAN-88' , '03-JAN-88', 50.00, 'WR' , 15);
insert into assignments_beers(PROJID, EMPNO, A_START_DATE, A_END_DATE, BILL_RATE, ASSIGN_TYPE, HOURS) 
    values  (2, 7902,'04-JAN-88' , '07-JAN-88', 55.00 , 'WR' , 20);
insert into assignments_beers(PROJID, EMPNO, A_START_DATE, A_END_DATE, BILL_RATE, ASSIGN_TYPE, HOURS) 
    values  (3, 7844,'01-JAN-89' , '10-JAN-89', 45.50, 'PF' , 30);

--3. Cập nhật trường ASIGNMENT_TYPE từ WT thành WR
    update  assignments_beers set ASSIGN_TYPE = 'WT' where  ASSIGN_TYPE = 'WR';
    
--4. Nhập thêm số liệu vào bảng ASSIGNMENTS.    
insert into assignments_beers(PROJID, EMPNO, A_START_DATE, A_END_DATE, BILL_RATE, ASSIGN_TYPE, HOURS) 
    values  (4, 7698,'12-JAN-89' , '13-JAN-89', 55.05, 'PF' , 40);    
 
    