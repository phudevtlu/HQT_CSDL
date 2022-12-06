CREATE DATABASE QLCHBanSach
use QLCHBanSach
create table KhachHang (
	MaKH int identity(1,1) NOT NULL PRIMARY KEY,
	HoTenKH nvarchar(255),
	DiaChi nvarchar(255),
	DienThoai varchar(100)
)

use QLCHBanSach
create table NhanVien (
	MaNV int identity(1,1) NOT NULL PRIMARY KEY,
	HoTenNV nvarchar(255),
	NgaySinh date,
	DiaChi nvarchar(255),
	DienThoai nvarchar(255),
	NgayLamViec date,
	Luong float
)

use QLCHBanSach
create table Sach(
	MaSach int identity(1,1) NOT NULL PRIMARY KEY,
	TenSach nvarchar(255),
	MaTheLoai int NOT NULL,
	MaNXB int not null,
	MaTacGia int not null,
	NgayXB date,
	GiaSach int,
	SoLuong int
)
ALTER TABLE Sach
ADD CONSTRAINT fk_MaTheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoaiSach(MaTheLoai);
ALTER TABLE Sach
ADD CONSTRAINT fk_MaNXB FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan(MaNXB);
ALTER TABLE Sach
ADD CONSTRAINT fk_MaTacGia FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia);
use QLCHBanSach 
create table TheLoaiSach(
	MaTheLoai int identity(1,1) not null PRIMARY KEY,
	TenTheLoai nvarchar(255)
)

use QLCHBanSach
create table NhaXuatBan(
	MaNXB int identity(1,1) not null primary key,
	TenNXB nvarchar(255)
)

use QLCHBanSach
create table TacGia(
	MaTacGia int identity(1,1) not null primary key,
	TenTacGia nvarchar(255)
)

use QLCHBanSach
create table DonDatSach (
	MaHoaDon int identity(1,1) not null primary key,
	MaKH int not null,
	MaNV int not null,
	NgayLap date,
	TongTien float
)
ALTER TABLE DonDatSach
ADD CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);
ALTER TABLE DonDatSach
ADD CONSTRAINT fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);
use QLCHBanSach
create table CTDonDatSach(
	MaHoaDon int not null,
	MaSach int not null,
	SoLuong int not null,
	ThanhTien float not null
	PRIMARY KEY (MaHoaDon, MaSach),
	CONSTRAINT fk_dondatsach FOREIGN KEY (MaHoaDon) REFERENCES DonDatSach(MaHoaDon),
	CONSTRAINT fk_sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
)
