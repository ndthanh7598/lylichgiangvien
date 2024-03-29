USE [master]
GO
/****** Object:  Database [lylichgiangvien]    Script Date: 14/11/2019 04:08:21 CH ******/
CREATE DATABASE [lylichgiangvien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lylichgiangvien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.THANH\MSSQL\DATA\lylichgiangvien.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lylichgiangvien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.THANH\MSSQL\DATA\lylichgiangvien_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lylichgiangvien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lylichgiangvien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lylichgiangvien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lylichgiangvien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lylichgiangvien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lylichgiangvien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lylichgiangvien] SET ARITHABORT OFF 
GO
ALTER DATABASE [lylichgiangvien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lylichgiangvien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [lylichgiangvien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lylichgiangvien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lylichgiangvien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lylichgiangvien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lylichgiangvien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lylichgiangvien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lylichgiangvien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lylichgiangvien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lylichgiangvien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lylichgiangvien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lylichgiangvien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lylichgiangvien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lylichgiangvien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lylichgiangvien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lylichgiangvien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lylichgiangvien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lylichgiangvien] SET RECOVERY FULL 
GO
ALTER DATABASE [lylichgiangvien] SET  MULTI_USER 
GO
ALTER DATABASE [lylichgiangvien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lylichgiangvien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lylichgiangvien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lylichgiangvien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lylichgiangvien', N'ON'
GO
USE [lylichgiangvien]
GO
/****** Object:  StoredProcedure [dbo].[check_lylichchuaduyet]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[check_lylichchuaduyet]
	@MaBS int
as
	begin
		select * from tbl_BSLyLich where MaBS = @MaBS and TrangThai = N'chuaduyet'
	end
GO
/****** Object:  StoredProcedure [dbo].[checkAcccount]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkAcccount]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	select * from tbl_TaiKhoan where MatKhau = @matkhau and TenTaiKhoan = @TaiKhoan;
GO
/****** Object:  StoredProcedure [dbo].[danhSachHoSoLyLich_GV]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[danhSachHoSoLyLich_GV]
	as
	select * from tbl_GiangVien gv, tbl_HocHam hh, tbl_DonVi dv, tbl_HocVi hv where
	gv.MaHH = hh.MaHH and gv.MaHV = hv.MaHV and gv.MaDV = dv.madv;
GO
/****** Object:  StoredProcedure [dbo].[delete_lylichbosung]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_lylichbosung]
	@MaBS int
as
	begin
		delete from tbl_BSLyLich where MaBS = @MaBS
	end
GO
/****** Object:  StoredProcedure [dbo].[get_donvi]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_donvi]
as
	begin
		select * from tbl_DonVi
	end
GO
/****** Object:  StoredProcedure [dbo].[get_hocham]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_hocham]
as
	begin
		select * from tbl_HocHam
	end
GO
/****** Object:  StoredProcedure [dbo].[get_hocvi]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_hocvi]
as
	begin
		select * from tbl_HocVi
	end
GO
/****** Object:  StoredProcedure [dbo].[get_lylichbosung]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_lylichbosung]
	@MaGV int
as
	begin
		select * from tbl_BSLyLich where MaGV = @MaGV
	end
GO
/****** Object:  StoredProcedure [dbo].[get_lylichbosung_theoid]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_lylichbosung_theoid]
	@MaBS int
as
	begin
		select * from tbl_BSLyLich where MaBS = @MaBS
	end
GO
/****** Object:  StoredProcedure [dbo].[get_thongtingiangvien]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_thongtingiangvien]
	@maGV int
as
	begin
		select * from tbl_GiangVien where MaGV = @maGV
	end
GO
/****** Object:  StoredProcedure [dbo].[get_thongtintaikhoan]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thongtintaikhoan]
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tbl_TaiKhoan
		where TenTaiKhoan like @Taikhoan and MatKhau = @Matkhau
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_lylichbosung]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_lylichbosung]
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
GO
/****** Object:  StoredProcedure [dbo].[layLyLichTheoMaBS]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[layLyLichTheoMaBS]
	@mabs nvarchar(15)
	as
	select * from tbl_BSLyLich where MaBS = @mabs;
GO
/****** Object:  StoredProcedure [dbo].[layTatCaLyLich]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[layTatCaLyLich]
	as
 	select GV.MaGV, LL.MaBS, GV.TenGV, LL.TenDeTaiNC, LL.NamBatDau, LL.NamKetThuc, LL.TrangThai, LL.GiaiThuong  from tbl_BSLyLich  LL, tbl_GiangVien GV
	where LL.MaGV = GV.MaGV ;
GO
/****** Object:  StoredProcedure [dbo].[layTatCaLyLich_GV]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[layTatCaLyLich_GV]
	@tenGV nvarchar(255)
	as
 	select  GV.MaGV, LL.MaBS, GV.TenGV, LL.TenDeTaiNC, LL.NamBatDau, LL.NamKetThuc, LL.TrangThai, LL.GiaiThuong  from tbl_BSLyLich  LL, tbl_GiangVien GV
	where LL.MaGV = GV.MaGV and GV.TenGV like '%'+@tenGV+'%';
GO
/****** Object:  StoredProcedure [dbo].[layTatCaLyLichGV]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[layTatCaLyLichGV]
	@tenGV nvarchar(255)
	as
 	select * from tbl_GiangVien gv, tbl_HocHam hh, tbl_DonVi dv, tbl_HocVi hv where
	gv.MaHH = hh.MaHH and gv.MaHV = hv.MaHV and gv.MaDV = dv.madv and gv.TenGV like '%'+@tenGV+'%';
GO
/****** Object:  StoredProcedure [dbo].[update_lylich]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_lylich]
	@mabs int,
	@tendetai nvarchar(255),
	@nambatdau datetime,
	@namketthuc datetime,
	@giaithuong nvarchar(255)
	as
	update tbl_BSLyLich set TenDeTaiNC = @tendetai , NamBatDau = @nambatdau,
	NamKetThuc = @namketthuc, GiaiThuong = @giaithuong
	where MaBS = @mabs;
GO
/****** Object:  StoredProcedure [dbo].[update_lylichbosung]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_lylichbosung]
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
GO
/****** Object:  StoredProcedure [dbo].[update_thongtingiangvien]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_thongtingiangvien]
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
GO
/****** Object:  StoredProcedure [dbo].[updatePassWord]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatePassWord]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	update tbl_Taikhoan set MatKhau = @matkhau where TenTaiKhoan = @TaiKhoan;
GO
/****** Object:  StoredProcedure [dbo].[updateTrangThaiLyLich]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateTrangThaiLyLich]
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
GO
/****** Object:  StoredProcedure [dbo].[updateTrangThaiLyLichGV]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateTrangThaiLyLichGV]
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
GO
/****** Object:  Table [dbo].[tbl_BSLyLich]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BSLyLich](
	[MaBS] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGianBS] [date] NULL,
	[TenDeTaiNC] [nvarchar](255) NULL,
	[NamBatDau] [date] NULL,
	[NamKetThuc] [date] NULL,
	[GiaiThuong] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaGV] [int] NULL,
 CONSTRAINT [PK_BSLyLich] PRIMARY KEY CLUSTERED 
(
	[MaBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CanBo]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CanBo](
	[MaCB] [int] IDENTITY(1,1) NOT NULL,
	[TenCB] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_CanBo] PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_DonVi]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DonVi](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](255) NULL,
 CONSTRAINT [PK_DonVi] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_GiangVien]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GiangVien](
	[MaGV] [int] IDENTITY(1,1) NOT NULL,
	[TenGV] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[TenDeTaiNC] [nvarchar](255) NULL,
	[NamBatDau] [date] NULL,
	[NamKetThuc] [date] NULL,
	[GiaiThuong] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaDV] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[MaHV] [int] NOT NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_HocHam]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HocHam](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](255) NULL,
 CONSTRAINT [PK_HocHam] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_HocVi]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HocVi](
	[MaHV] [int] IDENTITY(1,1) NOT NULL,
	[TenHV] [nvarchar](255) NULL,
 CONSTRAINT [PK_HocVi] PRIMARY KEY CLUSTERED 
(
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Quyen]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](255) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TaiKhoan]    Script Date: 14/11/2019 04:08:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TaiKhoan](
	[TenTaiKhoan] [nvarchar](255) NOT NULL,
	[MatKhau] [nvarchar](255) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaGV] [int] NULL,
	[MaCB] [int] NULL,
	[MaQuyen] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_BSLyLich] ON 

INSERT [dbo].[tbl_BSLyLich] ([MaBS], [ThoiGianBS], [TenDeTaiNC], [NamBatDau], [NamKetThuc], [GiaiThuong], [TrangThai], [MaGV]) VALUES (1, CAST(0x50400B00 AS Date), N'Nghiên cứu 1', CAST(0xDB3A0B00 AS Date), CAST(0x493C0B00 AS Date), N'Giải thưởng 2', N'daduyet', 2)
INSERT [dbo].[tbl_BSLyLich] ([MaBS], [ThoiGianBS], [TenDeTaiNC], [NamBatDau], [NamKetThuc], [GiaiThuong], [TrangThai], [MaGV]) VALUES (3, CAST(0x5E400B00 AS Date), N'Nghiên cứu khoa học', CAST(0x7E3D0B00 AS Date), CAST(0xE73E0B00 AS Date), N'Giải thưởng khoa học', N'chuaduyet', 2)
SET IDENTITY_INSERT [dbo].[tbl_BSLyLich] OFF
SET IDENTITY_INSERT [dbo].[tbl_CanBo] ON 

INSERT [dbo].[tbl_CanBo] ([MaCB], [TenCB], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) VALUES (1, N'admin', N'Nam', CAST(0xAB210B00 AS Date), N'Định Công, Hoàng Mai', N'0123456789')
SET IDENTITY_INSERT [dbo].[tbl_CanBo] OFF
SET IDENTITY_INSERT [dbo].[tbl_DonVi] ON 

INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (1, N'Khoa Công nghệ thông tin')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (2, N'Khoa CN Điện tử - Thông tin')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (3, N'Khoa Công nghệ sinh học')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (4, N'Khoa Du lịch')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (5, N'Khoa Luật')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (6, N'Khoa Kiến trúc')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (7, N'Khoa Kinh tế')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (8, N'Khoa Tài chính ngân hàng')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (9, N'Khoa Tạo dáng Công nghiệp')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (10, N'Khoa Tiếng Anh')
INSERT [dbo].[tbl_DonVi] ([MaDV], [TenDV]) VALUES (11, N'Khoa Tiếng Trung Quốc')
SET IDENTITY_INSERT [dbo].[tbl_DonVi] OFF
SET IDENTITY_INSERT [dbo].[tbl_GiangVien] ON 

INSERT [dbo].[tbl_GiangVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [Email], [TenDeTaiNC], [NamBatDau], [NamKetThuc], [GiaiThuong], [TrangThai], [MaDV], [MaHH], [MaHV]) VALUES (2, N'Giảng viên 1', N'Nữ', CAST(0x2D210B00 AS Date), N'Hoàng Mai, Hà Nội', N'01234567889', N'gv1@gmail.com', N'Đề tài 1', CAST(0xDB3A0B00 AS Date), CAST(0x493C0B00 AS Date), N'Giải thưởng 1', N'chuaduyet', 4, 2, 3)
SET IDENTITY_INSERT [dbo].[tbl_GiangVien] OFF
SET IDENTITY_INSERT [dbo].[tbl_HocHam] ON 

INSERT [dbo].[tbl_HocHam] ([MaHH], [TenHH]) VALUES (1, N'Giáo sư')
INSERT [dbo].[tbl_HocHam] ([MaHH], [TenHH]) VALUES (2, N'Phó giáo sư')
SET IDENTITY_INSERT [dbo].[tbl_HocHam] OFF
SET IDENTITY_INSERT [dbo].[tbl_HocVi] ON 

INSERT [dbo].[tbl_HocVi] ([MaHV], [TenHV]) VALUES (1, N'Đại học')
INSERT [dbo].[tbl_HocVi] ([MaHV], [TenHV]) VALUES (2, N'Thạc sĩ')
INSERT [dbo].[tbl_HocVi] ([MaHV], [TenHV]) VALUES (3, N'Tiến sĩ')
INSERT [dbo].[tbl_HocVi] ([MaHV], [TenHV]) VALUES (4, N'Tiến sĩ khoa học')
SET IDENTITY_INSERT [dbo].[tbl_HocVi] OFF
SET IDENTITY_INSERT [dbo].[tbl_Quyen] ON 

INSERT [dbo].[tbl_Quyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Quản trị')
INSERT [dbo].[tbl_Quyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'Giảng viên')
SET IDENTITY_INSERT [dbo].[tbl_Quyen] OFF
INSERT [dbo].[tbl_TaiKhoan] ([TenTaiKhoan], [MatKhau], [TrangThai], [MaGV], [MaCB], [MaQuyen]) VALUES (N'admin', N'123', N'hoatdong', NULL, 1, 1)
INSERT [dbo].[tbl_TaiKhoan] ([TenTaiKhoan], [MatKhau], [TrangThai], [MaGV], [MaCB], [MaQuyen]) VALUES (N'giangvien', N'123', N'hoatdong', 2, NULL, 2)
ALTER TABLE [dbo].[tbl_BSLyLich]  WITH CHECK ADD  CONSTRAINT [FK_lylichbosung_giangvien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[tbl_GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[tbl_BSLyLich] CHECK CONSTRAINT [FK_lylichbosung_giangvien]
GO
ALTER TABLE [dbo].[tbl_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_giangvien_donvi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[tbl_DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[tbl_GiangVien] CHECK CONSTRAINT [FK_giangvien_donvi]
GO
ALTER TABLE [dbo].[tbl_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_giangvien_hocham] FOREIGN KEY([MaHH])
REFERENCES [dbo].[tbl_HocHam] ([MaHH])
GO
ALTER TABLE [dbo].[tbl_GiangVien] CHECK CONSTRAINT [FK_giangvien_hocham]
GO
ALTER TABLE [dbo].[tbl_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_giangvien_hocvi] FOREIGN KEY([MaHV])
REFERENCES [dbo].[tbl_HocVi] ([MaHV])
GO
ALTER TABLE [dbo].[tbl_GiangVien] CHECK CONSTRAINT [FK_giangvien_hocvi]
GO
ALTER TABLE [dbo].[tbl_TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_taikhoan_canbo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[tbl_CanBo] ([MaCB])
GO
ALTER TABLE [dbo].[tbl_TaiKhoan] CHECK CONSTRAINT [FK_taikhoan_canbo]
GO
ALTER TABLE [dbo].[tbl_TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_taikhoan_giangvien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[tbl_GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[tbl_TaiKhoan] CHECK CONSTRAINT [FK_taikhoan_giangvien]
GO
ALTER TABLE [dbo].[tbl_TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_taikhoan_quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[tbl_Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[tbl_TaiKhoan] CHECK CONSTRAINT [FK_taikhoan_quyen]
GO
USE [master]
GO
ALTER DATABASE [lylichgiangvien] SET  READ_WRITE 
GO
