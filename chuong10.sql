-- 1. Tạo view có hiển thị như sau:
-- select * from aggredates;
Create view view_aggredates as
select
    *
from
    aggredates;

-- 2. Tạo view để nhập số liệu vào bảng ASIGNMENT với các điều kiện sau:
-- PROJID <2000, P_START_DATE<P_END_DATE
-- Các giá trị có thể chấp nhận của assign_type là PS, WT hoặc ED
CREATE VIEW VIEW_ASSIGNMENTS_BEERS AS
SELECT
    *
FROM
    ASSIGNMENTS_BEERS
WHERE
    "PROJID" < 2
    AND "A_START_DATE" < "A_END_DATE" WITH CHECK OPTION;

-- 3. Định nghĩa bảng MESSAGES có cấu trúc
-- NUMCOL1 NUMBER(9,2)
-- NUMCOL2 NUMBER(9,2)
-- CHARCOL1 VARCHAR2(60)
-- CHARCOL2 VARCHAR2(60)
-- DATECOL1 DATE
-- DATECOL2 DATE
CREATE TABLE MESSAGES_BEERS(
    NUMCOL1 NUMBER (9, 2),
    NUMBCOL2 NUMBER(9, 2),
    CHARCOL1 VARCHAR2(60),
    CHARCOL2 VARCHAR2(60),
    DATECOL1 DATE,
    DATECOL2 DATE
);

SELECT
    *
FROM
    MESSAGES_BEERS;