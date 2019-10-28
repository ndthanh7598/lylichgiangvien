create database lylichgiangvien;
use lylichgiangvien;

-- Tạo các bảng

create table tbl_GiangVien(
	MaGV int identity(1,1) not null,
	TenGV nvarchar(100) not null,
	GioiTinh nvarchar(50),
	NgaySinh date,
	DiaChi nvarchar(500),
	SDT nvarchar(50),
	Email nvarchar(100),
	TenDeTaiNC nvarchar(255) not null,
	NamBatDau date not null,
	NamKetThuc date not null,
	GiaiThuong nvarchar(50),
	TrangThai nvarchar(50) not null,
	MaDV int not null,
	MaHH int not null,
	MaHV int not null
);

create table tbl_TaiKhoan(
	TenTaiKhoan nvarchar(255) not null,
	MatKhau nvarchar(255) not null,
	TrangThai nvarchar(50) not null,
	MaGV int,
	MaCB int,
	MaQuyen int not null
);

create table tbl_Quyen(
	MaQuyen int identity(1,1) not null,
	TenQuyen nvarchar(255) not null
);

create table tbl_CanBo(
	MaCB int identity(1,1) not null,
	TenCB nvarchar(255) not null,
	GioiTinh nvarchar(50),
	NgaySinh date,
	DiaChi nvarchar(255),
	SDT nvarchar(50)
);

create table tbl_BSLyLich(
	MaBS int identity(1,1) not null,
	ThoiGianBS date not null,
	TenDeTaiNC nvarchar(255) not null,
	NamBatDau date not null,
	NamKetThuc date not null,
	GiaiThuong nvarchar(50),
	TrangThai nvarchar(50) not null,
	MaGV int not null
);

create table tbl_DonVi(
	MaDV int identity(1,1) not null,
	TenDV nvarchar(255) not null
);

create table tbl_HocHam(
	MaHH int identity(1,1) not null,
	TenHH nvarchar(255) not null
);

create table tbl_HocVi(
	MaHV int identity(1,1) not null,
	TenHV nvarchar(255) not null
);

-- Tạo khoá và ràng buộc

alter table tbl_GiangVien add constraint PK_GiangVien primary key (MaGV);
alter table tbl_TaiKhoan add constraint PK_TaiKhoan primary key (TenTaiKhoan);
alter table tbl_Quyen add constraint PK_Quyen primary key (MaQuyen);
alter table tbl_CanBo add constraint PK_CanBo primary key (MaCB);
alter table tbl_BSLyLich add constraint PK_BSLyLich primary key (MaBS);
alter table tbl_DonVi add constraint PK_DonVi primary key (MaDV);
alter table tbl_HocHam add constraint PK_HocHam primary key (MaHH);
alter table tbl_HocVi add constraint PK_HocVi primary key (MaHV);

alter table tbl_GiangVien add constraint FK_giangvien_donvi foreign key (MaDV) references tbl_DonVi(MaDV);
alter table tbl_GiangVien add constraint FK_giangvien_hocham foreign key (MaHH) references tbl_HocHam(MaHH);
alter table tbl_GiangVien add constraint FK_giangvien_hocvi foreign key (MaHV) references tbl_HocVi(MaHV);

alter table tbl_TaiKhoan add constraint FK_taikhoan_giangvien foreign key (MaGV) references tbl_GiangVien(MaGV);
alter table tbl_TaiKhoan add constraint FK_taikhoan_canbo foreign key (MaCB) references tbl_CanBo(MaCB);
alter table tbl_TaiKhoan add constraint FK_taikhoan_quyen foreign key (MaQuyen) references tbl_Quyen(MaQuyen);

alter table tbl_BSLyLich add constraint FK_lylichbosung_giangvien foreign key (MaGV) references tbl_GiangVien(MaGV);

-- Thêm dữ liệu

insert into tbl_HocHam(TenHH) values (N'Giáo sư'), (N'Phó giáo sư');

insert into tbl_HocVi(TenHV) values (N'Đại học'), (N'Thạc sĩ'), (N'Tiến sĩ'), (N'Tiến sĩ khoa học');

insert into tbl_CanBo(TenCB, GioiTinh, NgaySinh, DiaChi, SDT) values (N'admin', N'Nam', '1998-05-07', N'Định Công, Hoàng Mai', N'0123456789');

insert into tbl_DonVi(TenDV) values (N'Khoa Công nghệ thông tin'), (N'Khoa CN Điện tử - Thông tin'), (N'Khoa Công nghệ sinh học'),
									(N'Khoa du lịch'), (N'Khoa Luật'), (N'Khoa Kiến trúc'), (N'Khoa Kinh tế'), (N'Khoa Tài chính ngân hàng'),
									(N'Khoa Tạo dáng Công nghiệp'), (N'Khoa Tiếng Anh'), (N'Khoa Tiếng Trung Quốc');

insert into tbl_Quyen(TenQuyen) values (N'Quản trị'), (N'Giảng viên');

insert into tbl_TaiKhoan(TenTaiKhoan, MatKhau, TrangThai, MaGV, MaCB, MaQuyen) values (N'admin', N'123', N'Hoạt động', NULL, 1, 1);

-- Procedure

create procedure get_thongtintaikhoan
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tbl_TaiKhoan
		where TenTaiKhoan like @Taikhoan and MatKhau = @Matkhau
	end