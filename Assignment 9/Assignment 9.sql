-- SQL server
-- 1. NHACUNGCAP
-- 2. DONGXE
-- 3. LOAIDICHVU
-- 4. MUCPHI
-- 5. DANGKYCUNGCAP
create table NHACUNGCAP (
	MaNhaCC varchar(20) primary key,
	TenNhaCC varchar(155) not null unique,
	DiaChi varchar(155) not null,
	SoDT varchar(20) not null unique,
	MaSoThue int not null unique
);
create table DONGXE (
	DongXe varchar(20) primary key,
	HangXe varchar(20) not null,
	SoChoNgoi int not null check(SoChoNgoi >= 2)
);
create table LOAIDICHVU (
	MaLoaiDV varchar(20) primary key,
	TenLoaiDV varchar(155) not null unique
);
create table MUCPHI (
	MaMP varchar(20) primary key,
	DonGia decimal not null,
	MoTa varchar(155) not null
);
create table DANGKYCUNGCAP (
	MaDKCC varchar(20) primary key,
	MaNhaCC varchar(20) not null foreign key references NHACUNGCAP(MaNhaCC),
	MaLoaiDV varchar(20) not null foreign key references LOAIDICHVU(MaLoaiDV),
	DongXe varchar(20) not null foreign key references DONGXE(DongXe),
	MaMP varchar(20) not null foreign key references MUCPHI(MaMP),
	NgayBatDauCungCap date not null,
	NgayKetThucCungCap date not null,
	SoLuongXeDangKy int
);

-- Creat data
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC001', 'Cty TNHH Toan Phap', 'Hai Chau', '05113999888', 568941);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC002', 'Cty Co Phan Dong Du', 'Lien Chieu', '05113999889', 456789);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC003', 'Ong Nguyen Van A', 'Hoa Thuan', '05113999890', 321456);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC004', 'Cty Co Phan Toan Cau Xanh', 'Hai Chau', '05113658945', 513364);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC005', 'Cty TNHH AMA', 'Thanh Khe', '05113875466', 546546);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC006', 'Ba Tran Thi Bich Van', 'Lien Chieu', '05113587469', 524545);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC007', 'Cty TNHH Phan Thanh', 'Thanh Khe', '05113987456', 113021);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC008', 'Ong Phan Dinh Nam', 'Hoa Thuan', '05113532456', 121230);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC009', 'Tap doan Dong Nam A', 'Lien Chieu', '05113987121', 533654);
insert into NHACUNGCAP(MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) values('NCC010', 'Cty Co Phan Rang Dong', 'Lien Chieu', '05113569654', 187864);

insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Hiace', 'Toyota', 16);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Vios', 'Toyota', 5);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Escape', 'Ford', 5);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Cerato', 'KIA', 7);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Forte', 'KIA', 5);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Starex', 'Huyndai', 7);
insert into DONGXE(DongXe, HangXe, SoChoNgoi) values('Grand-i10', 'Huyndai', 7);

insert into LOAIDICHVU(MaLoaiDV, TenLoaiDV) values('DV01', 'Dich vu xe taxi');
insert into LOAIDICHVU(MaLoaiDV, TenLoaiDV) values('DV02', 'Dich vu xe bus cong cong theo tuyen co dinh');
insert into LOAIDICHVU(MaLoaiDV, TenLoaiDV) values('DV03', 'Dich vu xe cho thue theo hop dong');

insert into MUCPHI(MaMP, DonGia, MoTa) values('MP01', 10000, 'Ap dung tu 1/2015');
insert into MUCPHI(MaMP, DonGia, MoTa) values('MP02', 15000, 'Ap dung tu 2/2015');
insert into MUCPHI(MaMP, DonGia, MoTa) values('MP03', 20000, 'Ap dung tu 1/2010');
insert into MUCPHI(MaMP, DonGia, MoTa) values('MP04', 25000, 'Ap dung tu 2/2011');

insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015-11-20', '2016-11-20', 4);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015-11-20', '2017-11-20', 3);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017-11-20', '2018-11-20', 5);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015-11-20', '2019-11-20', 7);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019-11-20', '2020-11-20', 1);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016-11-10', '2021-11-20', 2);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK007', 'NCC005', 'DV02', 'Cerato', 'MP03', '2015-11-30', '2016-01-25', 8);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016-02-28', '2016-08-15', 9);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016-04-27', '2017-04-30', 10);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-11-21', '2016-02-22', 4);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016-12-25', '2017-02-20', 5);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016-04-14', '2017-12-20', 6);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015-12-21', '2016-12-21', 8);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016-05-20', '2016-12-30', 1);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018-04-24', '2019-11-20', 6);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016-06-22', '2016-12-21', 8);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016-09-30', '2019-09-30', 4);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017-12-13', '2018-09-30', 2);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016-01-24', '2016-12-30', 8);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016-05-03', '2017-10-21', 7);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-01-30', '2016-12-30', 9);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016-07-25', '2017-12-30', 6);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017-11-30', '2018-05-20', 5);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017-12-23', '2019-11-30', 8);
insert into DANGKYCUNGCAP(MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap, SoLuongXeDangKy) values('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016-08-24', '2017-10-25', 7);

-- Read data
select * from NHACUNGCAP;
select * from DONGXE;
select * from LOAIDICHVU;
select * from MUCPHI;
select * from DANGKYCUNGCAP;