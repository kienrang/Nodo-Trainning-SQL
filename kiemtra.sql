create table ht_kien_nha_xuat_ban(
    nbx_id number(11) primary key,
    ma number(11) unique,
    ten varchar2(100),
    trang_thai number(1, 0),
    dia_chi varchar2(225),
    mo_ta varchar2(255)
);

create table ht_kien_tac_gia(
    tg_id number(11) primary key,
    ma number(11) unique,
    ten varchar2(100),
    sdt varchar2(13),
    dia_chi varchar2(225),
    mo_ta varchar2(255)
);

create table ht_kien_sach(
    s_id number(11) primary key,
    ma number(11) unique,
    ten varchar2(100),
    id_nxb number(11),
    id_tg number(11),
    chu_de varchar2(100),
    nam_xuat_ban date,
    mo_ta varchar2(255),
    sl_con_lai number(5),
    sl_dang_muon number(5),
    tong_sl number(5),
    constraint fk_sack_nxb foreign key(id_nxb) references ht_kien_nha_xuat_ban(nbx_id),
    constraint fk_sack_tg foreign key(id_tg) references ht_kien_tac_gia(tg_id)
);

create table ht_kien_ban_doc(
    bd_id number(11) primary key,
    ma number(11) unique,
    ten varchar2(100),
    sdt varchar2(13),
    dia_chi varchar2(225),
    ngay_sinh date,
    ngay_tao_tk date,
    hang number(1)
);

create table ht_kien_muon_sach(
    ms_id number(11) primary key,
    id_bd number(11),
    id_s number(11),
    so_luong number(5),
    ngay_gio_muon date,
    ngay_gio_tra date,
    trang_thai number(2),
    ghi_chu varchar2(255),
    constraint fk_muon_sach_ban_doc foreign key (id_bd) references ht_kien_ban_doc(bd_id),
    constraint fk_muon_sach_s foreign key (id_s) references ht_kien_sach(s_id)
) --1 ,	Viết script tạo cấu trúc các bảng. Đối với bảng Mượn Sách cần đánh
--partition trên trường ngày giờ mượn, và 2 local index: 1 index trên
--trường id bạn đọc, 1 index trên id sách. Tên indexes theo cấu trúc : TENBANG_IDX_TENTRUONG
alter table
    ht_kien_muon_sach
add
    index idx_muonsach_bd(id_bd);

alter table
    ht_kien_muon_sach
add
    index idx_muonsach_s(id_s);

alter table
    ht_kien_muon_sach
add
    partition pt_muonsach(ngay_gio_muon);

--2.	Viết script tạo sequence cho mỗi bảng. Sequence được dùng để insert trường Id cho các bảng. Tên sequence theo cấu trúc : TENBANG_SEQ
CREATE SEQUENCE ht_kien_nxb_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

CREATE SEQUENCE ht_kien_sach_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

CREATE SEQUENCE ht_kien_tg_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

CREATE SEQUENCE ht_kien_ban_doc_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

CREATE SEQUENCE ht_kien_muon_sach_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

--3.	Viết script tạo unique index cho các bảng nếu có.
alter table
    ht_kien_tac_gia
add
    unique sdt;

alter table
    ht_kien_ban_doc
add
    unique sdt;

--4.	Viết script insert dữ liệu mẫu cho tất cả các bảng.
--       Bảng nhà xuất bản
insert into
    ht_kien_nha_xuat_ban a (
        a.nbx_id,
        a.ma,
        a.ten,
        a.dia_chi,
        a.trang_thai,
        a.mo_ta
    )
values
    (1, 100, 'Toán học VN', 'Từ Liêm', 1, 'ghi chú');

insert into
    ht_kien_nha_xuat_ban a (
        a.nbx_id,
        a.ma,
        a.ten,
        a.dia_chi,
        a.trang_thai,
        a.mo_ta
    )
values
    (2, 200, 'Văn Học VN', 'Cầu giấy', 1, 'ghi chú');

--     Bảng tác giả
insert into
    ht_kien_tac_gia b(b.tg_id, b.ma, b.ten, b.sdt, b.dia_chi, b.mo_ta)
values
    (
        1,
        10,
        'Kiên Ràng',
        '0359738201',
        'Từ Liêm',
        'Đẹp troai'
    );

insert into
    ht_kien_tac_gia b(b.tg_id, b.ma, b.ten, b.sdt, b.dia_chi, b.mo_ta)
values
    (
        2,
        20,
        'Kiên Beers',
        '0359738202',
        'Cầu giấy',
        'Hát hay'
    );

-- bảng sách
insert into
    ht_kien_sach s (
        s.s_id,
        s.ma,
        s.ten,
        s.id_nxb,
        s.id_tg,
        s.chu_de,
        s.nam_xuat_ban,
        s.mo_ta,
        s.sl_con_lai,
        s.sl_dang_muon,
        s.tong_sl
    )
values
    (
        1,
        1000,
        'Toan sieu cap vip pro',
        1,
        1,
        'Toán Học',
        to_date('2022-8-1', 'yyyy-mm-dd'),
        'Rất là dễ hiểu',
        5,
        20,
        25
    );

insert into
    ht_kien_sach s (
        s.s_id,
        s.ma,
        s.ten,
        s.id_nxb,
        s.id_tg,
        s.chu_de,
        s.nam_xuat_ban,
        s.mo_ta,
        s.sl_con_lai,
        s.sl_dang_muon,
        s.tong_sl
    )
values
    (
        2,
        2000,
        'Toan sieu cap ',
        1,
        1,
        'Toán Học',
        to_date('2022-8-1', 'yyyy-mm-dd'),
        'Rất là dễ hiểu',
        50,
        80,
        130
    );

insert into
    ht_kien_sach s (
        s.s_id,
        s.ma,
        s.ten,
        s.id_nxb,
        s.id_tg,
        s.chu_de,
        s.nam_xuat_ban,
        s.mo_ta,
        s.sl_con_lai,
        s.sl_dang_muon,
        s.tong_sl
    )
values
    (
        3,
        3000,
        'Toan thấp cap',
        2,
        1,
        'Toán Học',
        to_date('2022-8-1', 'yyyy-mm-dd'),
        'Rất là dễ hiểu',
        100,
        100,
        200
    );

--     bảng bạn đọc
insert into
    ht_kien_ban_doc(id, ma, ten, sdt, dia_chi, ngay_sinh, ngay_tao_tk, hang)
values
    (
        1,
        100,
        'Bear',
        '033655870',
        'Thanh Trì',
        to_date('2001-09-07'),
        to_date('2022-8-1'),
        3
    );

insert into
    ht_kien_ban_doc(id, ma, ten, sdt, dia_chi, ngay_sinh, ngay_tao_tk, hang)
values
    (
        2,
        200,
        'Beers',
        '033655870',
        'Cầu giấy',
        to_date('2002-01-07'),
        to_date('2022-8-1'),
        4
    );

insert into
    ht_kien_ban_doc(id, ma, ten, sdt, dia_chi, ngay_sinh, ngay_tao_tk, hang)
values
    (
        3,
        300,
        'Kym',
        '033655870',
        'Từ Liêm',
        to_date('2003-03-07'),
        to_date('2022-8-1'),
        1
    );

select
    *
from
    ht_kien_ban_doc;

-- bảng mượn sách
insert into
    ht_kien_muon_sach (
        ms_id,
        id_bd,
        id_s,
        so_luong,
        ngay_gio_muon,
        ngay_gio_tra,
        trang_thai,
        ghi_chu
    )
values
    (
        1,
        1,
        1,
        10,
        TO_DATE('2019-07-07', 'YYYY-MM-DD'),
        TO_DATE('2019-08-08', 'YYYY-MM-DD'),
        0,
        N 'KHÔNG'
    );

insert into
    ht_kien_muon_sach (
        ms_id,
        id_bd,
        id_s,
        so_luong,
        ngay_gio_muon,
        ngay_gio_tra,
        trang_thai,
        ghi_chu
    )
values
    (
        1,
        2,
        3,
        2,
        TO_DATE('2019-07-07', 'YYYY-MM-DD'),
        TO_DATE('2019-08-08', 'YYYY-MM-DD'),
        0,
        N 'KHÔNG'
    );

--5.	Hiển thị dách sách tác giả và tổng số lượng sách của tác giả gồm các trường thông tin:
--Mã Tác Giả, Tên Tác Giả, Chủ Đề, Số Lượng Sách
--Sắp xếp theo số lượng sách giảm dần.
select
    tg.ma,
    tg.ten,
    s.chu_de,
    s.tong_sl
from
    ht_kien_sach s
    join ht_kien_tac_gia tg on s.id_tg = tg.tg_id
order by
    s.tong_sl desc;

--6.	Hiển thị 10 quyển sách có số lượng được mượn nhiều nhất gồm các trường thông tin:
--Mã Sách, Tên Sách, Tên Nhà Xuất Bản, Tên Tác Giả, Chủ Đề, Năm Xuất Bản, Số Lượng Còn Lại, Số Lượng Đã Mượn, Tổng Số
SELECT
    s.ma,
    s.ten,
    nxb.ten,
    tg.ten,
    s.chu_de,
    s.nam_xuat_ban,
    s.sl_con_lai,
    s.sl_dang_muon,
    s.tong_sl
FROM
    ht_kien_tac_gia tg
    JOIN ht_kien_sach s ON tg.tg_id = s.id_tg
    JOIN ht_kien_nha_xuat_ban nxb on nxb.nbx_id = s.id_nxb
WHERE
    ROWNUM < 5
ORDER BY
    s.sl_con_lai DESC;

--7.	Hiển thị  thông tin bạn đọc và sách được mượn từ ngày đầu tháng hiện tại đến thời điểm hiện tại.
--Mã Bạn Đọc, Tên Bạn Đọc, Mã Sách, Tên Sách, Ngày Giờ Mượn, Số lượng
--Sắp xếp theo ngày giờ mượn giảm dần, Tên bạn đọc tăng dần.
select
    c.ma,
    c.ten,
    s.ma,
    s.ten,
    ms.ngay_gio_muon,
    ms.so_luong
from
    ht_kien_ban_doc c
    join ht_kien_muon_sach ms on c.bd_id = ms.id_bd
    join ht_kien_sach s on s.s_id = ms.id_s
where
    trunc(sysdate, 'month') >= ms.ngay_gio_muon
    and ms.ngay_gio_muon <= trunc(sysdate)
order by
    ms.ngay_gio_muon desc;

--
--8.	Hiển thị 10 quyển sách có số lượng được mượn nhiều nhất tính từ đầu năm 2022
--Mã Sách, Tên Sách, Số Lượng Đã Được Mượn.
--
--9.	Hiển thị danh sách bạn đọc và số lần mượn sách tính từ đầu năm 2022 sắp xếp theo tên bạn đọc tăng dần:
--Mã Bạn Đọc, Tên Bạn Đọc, Số Lần Mượn
--10.	Hiển thị thông tin bạn đọc gồm có:
--Mã Bạn Đọc, Tên Bạn Đọc, Tuổi (được tính dựa vào trường ngày sinh)
select
    bd.ma,
    bd.ten,
    (
        to_number(to_char(sysdate, 'yyyy')) - to_number(to_char(bd.ngay_sinh, 'yyyy'))
    ) as tuoi
from
    ht_kien_ban_doc bd --
    --11.	Thống kê tổng số bạn đọc theo độ tuổi
    --Tuổi, Tổng số Bạn Đọc
    --
    --12.	Thống kê số lượng sách được xuất bản theo Nhà Xuất Bản, Theo năm xuất bản.
    --
    --Năm Xuất Bản, Mã Nhà Xuất Bản,Tên Nhà Xuất Bản, Số Lượng Sách
    --Sắp xếp theo Năm xuất bản giảm dần, Tên Nhà xuất bản tăng dần.
    --13.	Hiển thị 5 quyển sách được các bạn đọc có độ tuổi từ 18 đến 25 mượn nhiều nhất tính từ đầu năm 2022. (Tính theo trường số lượng mượn của sách)
    --Mã Sách, Tên Sách, Số Lượng Được Mượn
    --
    --14.	Hiển thị toàn bộ bạn đọc và sách mà bạn đọc đấy mượn, sẽ có bạn chưa mượn vẫn cần hiển thị và tên sách để là null.
    --Mã bạn đọc, tên ban đọc, tên sách