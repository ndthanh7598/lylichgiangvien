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

-- Thành
create procedure get_thongtintaikhoan
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tbl_TaiKhoan
		where TenTaiKhoan like @Taikhoan and MatKhau = @Matkhau
	end

create procedure get_donvi
as
	begin
		select * from tbl_DonVi
	end

create procedure get_hocham
as
	begin
		select * from tbl_HocHam
	end

create procedure get_hocvi
as
	begin
		select * from tbl_HocVi
	end

create procedure get_thongtingiangvien
	@maGV int
as
	begin
		select * from tbl_GiangVien where MaGV = @maGV
	end

create procedure update_thongtingiangvien
	@MaGV int,
	@TenGV nvarchar(100),
	@GioiTinh nvarchar(50),
	@NgaySinh date,
	@DiaChi nvarchar(500),
	@SDT nvarchar(50),
	@Email nvarchar(100),
	@TenDeTaiNC nvarchar(255),
	@NamBatDau date,
	@NamKetThuc date,
	@GiaiThuong nvarchar(50),
	@TrangThai nvarchar(50),
	@MaDV int,
	@MaHH int,
	@MaHV int
as
	begin
		update tbl_GiangVien set TenGV = @TenGV, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh,
								DiaChi = @DiaChi, SDT = @SDT, Email = @Email, TenDeTaiNC = @TenDeTaiNC,
								NamBatDau = @NamBatDau, NamKetThuc = NamKetThuc, GiaiThuong = @GiaiThuong,
								TrangThai = @TrangThai, MaDV = @MaDV,MaHH = MaHH, MaHV = @MaHV
					where MaGV = @MaGV
	end

create procedure get_lylichbosung
	@MaGV int
as
	begin
		select * from tbl_BSLyLich where MaGV = @MaGV
	end

create procedure insert_lylichbosung
	@ThoiGianBS date,
	@TenDeTaiNC nvarchar(255),
	@NamBatDau date,
	@NamKetThuc date,
	@GiaiThuong nvarchar(50),
	@TrangThai nvarchar(50),
	@MaGV int
as
	begin
		insert into tbl_BSLyLich(ThoiGianBS,TenDeTaiNC,NamBatDau,NamKetThuc,GiaiThuong,TrangThai,MaGV) values
		(@ThoiGianBS,@TenDeTaiNC,@NamBatDau,@NamKetThuc,@GiaiThuong,@TrangThai,@MaGV)
	end

create procedure check_lylichchuaduyet
	@MaBS int
as
	begin
		select * from tbl_BSLyLich where MaBS = @MaBS and TrangThai = N'chuaduyet'
	end

create procedure get_lylichbosung_theoid
	@MaBS int
as
	begin
		select * from tbl_BSLyLich where MaBS = @MaBS
	end

create procedure delete_lylichbosung
	@MaBS int
as
	begin
		delete from tbl_BSLyLich where MaBS = @MaBS
	end

create procedure update_lylichbosung
	@MaBS int,
	@ThoiGianBS date,
	@TenDeTaiNC nvarchar(255),
	@NamBatDau date,
	@NamKetThuc date,
	@GiaiThuong nvarchar(50)
as
	begin
		update tbl_BSLyLich set ThoiGianBS = @ThoiGianBS, TenDeTaiNC = @TenDeTaiNC, NamBatDau = @NamBatDau,
								NamKetThuc = @NamKetThuc, GiaiThuong = @GiaiThuong
					where MaBS = @MaBS
	end

	
-- Huy

	create proc updatePassWord
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	update tbl_Taikhoan set MatKhau = @matkhau where TenTaiKhoan = @TaiKhoan;

	create proc checkAcccount
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	select * from tbl_TaiKhoan where MatKhau = @matkhau and TenTaiKhoan = @TaiKhoan;


	create proc layTatCaLyLich
	as
 	select GV.MaGV, LL.MaBS, GV.TenGV, LL.TenDeTaiNC, LL.NamBatDau, LL.NamKetThuc, LL.TrangThai, LL.GiaiThuong  from tbl_BSLyLich  LL, tbl_GiangVien GV
	where LL.MaGV = GV.MaGV ;

	create proc layTatCaLyLich_GV
	@tenGV nvarchar(255)
	as
 	select  GV.MaGV, LL.MaBS, GV.TenGV, LL.TenDeTaiNC, LL.NamBatDau, LL.NamKetThuc, LL.TrangThai, LL.GiaiThuong  from tbl_BSLyLich  LL, tbl_GiangVien GV
	where LL.MaGV = GV.MaGV and GV.TenGV like '%'+@tenGV+'%';

	create proc updateTrangThaiLyLich
	@mabs int,
	@trangthai nvarchar(10)
	as
	begin
	if(@trangthai = 1)
		begin 
			update tbl_BSLyLich set TrangThai = 0 where MaBS = @mabs
		end
	else
		begin 
			update tbl_BSLyLich set TrangThai = 1 where MaBS = @mabs
		end
	end;

	create proc layLyLichTheoMaBS
	@mabs nvarchar(15)
	as
	select * from tbl_BSLyLich where MaBS = @mabs;

	create proc update_lylich
	@mabs int,
	@tendetai nvarchar(255),
	@nambatdau datetime,
	@namketthuc datetime,
	@giaithuong nvarchar(255)
	as
	update tbl_BSLyLich set TenDeTaiNC = @tendetai , NamBatDau = @nambatdau,
	NamKetThuc = @namketthuc, GiaiThuong = @giaithuong
	where MaBS = @mabs;

	create proc danhSachHoSoLyLich_GV
	as
	select * from tbl_GiangVien gv, tbl_HocHam hh, tbl_DonVi dv, tbl_HocVi hv where
	gv.MaHH = hh.MaHH and gv.MaHV = hv.MaHV and gv.MaDV = dv.madv;


	create proc updateTrangThaiLyLichGV
	@magv int,
	@trangthai nvarchar(10)
	as
	begin
	if(@trangthai = 'daduyet')
		begin 
			update tbl_GiangVien set TrangThai = N'chuaduyet' where MaGV = @magv
		end
	else
		begin 
			update tbl_GiangVien set TrangThai = N'daduyet' where MaGV = @magv
		end
	end;

	create proc layTatCaLyLichGV
	@tenGV nvarchar(255)
	as
 	select * from tbl_GiangVien gv, tbl_HocHam hh, tbl_DonVi dv, tbl_HocVi hv where
	gv.MaHH = hh.MaHH and gv.MaHV = hv.MaHV and gv.MaDV = dv.madv and gv.TenGV like '%'+@tenGV+'%';