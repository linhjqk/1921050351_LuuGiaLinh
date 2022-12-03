-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2021 lúc 04:13 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlydulich`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hdvdl`
--

CREATE TABLE `hdvdl` (
  `MaHDVDL` int(11) NOT NULL,
  `TenHDVDL` varchar(30) DEFAULT NULL,
  `SoDienThoai` int(20) DEFAULT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `SoCMT` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL,
  `TenKhachHang` varchar(30) NOT NULL,
  `NgaySinh` date NOT NULL,
  `GioiTinh` varchar(10) NOT NULL,
  `DiaChi` varchar(50) NOT NULL,
  `SoDienThoai` int(20) NOT NULL,
  `CMT` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachsan`
--

CREATE TABLE `khachsan` (
  `MaKhachSan` int(11) NOT NULL,
  `TenKhachSan` varchar(40) DEFAULT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `TieuChuan` int(1) DEFAULT NULL,
  `DienThoai` int(20) DEFAULT NULL,
  `GiaTien` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `TenNhanVien` varchar(30) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `PassWord` varchar(30) NOT NULL,
  `QuyenHan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `UserName`, `PassWord`, `QuyenHan`) VALUES
(1, 'Bùi Trung Hiếu', 'buitrunghieu', 'buitrunghieu', 'admin'),
(2, 'Nguyễn Việt Anh', 'nguyenvietanh', 'nguyenvietanh', 'admin'),
(3, 'Bùi Nam Anh', 'buinamanh', 'buinamanh', 'admin'),
(4, 'PhamTruongAnh', 'phamtruongan', 'phamtruongan', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudangkitour`
--

CREATE TABLE `phieudangkitour` (
  `MaPhieu` int(11) NOT NULL,
  `TenPhieu` varchar(30) DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaKhachSan` int(11) DEFAULT NULL,
  `MaTour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudangkitourchitiet`
--

CREATE TABLE `phieudangkitourchitiet` (
  `MaPhieuChiTiet` int(11) NOT NULL,
  `TenPhieuChiTiet` varchar(50) DEFAULT NULL,
  `MaPhieuTour` int(11) DEFAULT NULL,
  `MaTaiXe` int(11) DEFAULT NULL,
  `MaPhuongTien` int(11) DEFAULT NULL,
  `MaHDVDL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuongtien`
--

CREATE TABLE `phuongtien` (
  `MaPhuongTien` int(11) NOT NULL,
  `TenPhuongTien` varchar(20) DEFAULT NULL,
  `SoGhe` int(3) DEFAULT NULL,
  `BienKiemSoat` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taixe`
--

CREATE TABLE `taixe` (
  `MaTaiXe` int(11) NOT NULL,
  `TenTaiXe` varchar(30) DEFAULT NULL,
  `SoDienThoai` int(20) DEFAULT NULL,
  `KinhNghiem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `MaTour` int(11) NOT NULL,
  `TenTour` varchar(40) DEFAULT NULL,
  `Gia` int(10) DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  `TinhTrang` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `hdvdl`
--
ALTER TABLE `hdvdl`
  ADD PRIMARY KEY (`MaHDVDL`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKhachHang`);

--
-- Chỉ mục cho bảng `khachsan`
--
ALTER TABLE `khachsan`
  ADD PRIMARY KEY (`MaKhachSan`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Chỉ mục cho bảng `phieudangkitour`
--
ALTER TABLE `phieudangkitour`
  ADD PRIMARY KEY (`MaPhieu`),
  ADD KEY `MaKhachHang` (`MaKhachHang`),
  ADD KEY `MaTour` (`MaTour`),
  ADD KEY `MaKhachSan` (`MaKhachSan`);

--
-- Chỉ mục cho bảng `phieudangkitourchitiet`
--
ALTER TABLE `phieudangkitourchitiet`
  ADD PRIMARY KEY (`MaPhieuChiTiet`),
  ADD KEY `MaPhieuTour` (`MaPhieuTour`),
  ADD KEY `MaPhuongTien` (`MaPhuongTien`),
  ADD KEY `MaHDVDL` (`MaHDVDL`),
  ADD KEY `MaTaiXe` (`MaTaiXe`);

--
-- Chỉ mục cho bảng `phuongtien`
--
ALTER TABLE `phuongtien`
  ADD PRIMARY KEY (`MaPhuongTien`);

--
-- Chỉ mục cho bảng `taixe`
--
ALTER TABLE `taixe`
  ADD PRIMARY KEY (`MaTaiXe`);

--
-- Chỉ mục cho bảng `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`MaTour`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hdvdl`
--
ALTER TABLE `hdvdl`
  MODIFY `MaHDVDL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khachsan`
--
ALTER TABLE `khachsan`
  MODIFY `MaKhachSan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNhanVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `phieudangkitour`
--
ALTER TABLE `phieudangkitour`
  MODIFY `MaPhieu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phieudangkitourchitiet`
--
ALTER TABLE `phieudangkitourchitiet`
  MODIFY `MaPhieuChiTiet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phuongtien`
--
ALTER TABLE `phuongtien`
  MODIFY `MaPhuongTien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taixe`
--
ALTER TABLE `taixe`
  MODIFY `MaTaiXe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tour`
--
ALTER TABLE `tour`
  MODIFY `MaTour` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phieudangkitour`
--
ALTER TABLE `phieudangkitour`
  ADD CONSTRAINT `phieudangkitour_ibfk_1` FOREIGN KEY (`MaKhachSan`) REFERENCES `khachsan` (`MaKhachSan`),
  ADD CONSTRAINT `phieudangkitour_ibfk_2` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`),
  ADD CONSTRAINT `phieudangkitour_ibfk_3` FOREIGN KEY (`MaKhachSan`) REFERENCES `khachhang` (`MaKhachHang`);

--
-- Các ràng buộc cho bảng `phieudangkitourchitiet`
--
ALTER TABLE `phieudangkitourchitiet`
  ADD CONSTRAINT `phieudangkitourchitiet_ibfk_1` FOREIGN KEY (`MaPhieuTour`) REFERENCES `phieudangkitour` (`MaPhieu`),
  ADD CONSTRAINT `phieudangkitourchitiet_ibfk_2` FOREIGN KEY (`MaPhuongTien`) REFERENCES `phuongtien` (`MaPhuongTien`),
  ADD CONSTRAINT `phieudangkitourchitiet_ibfk_3` FOREIGN KEY (`MaHDVDL`) REFERENCES `hdvdl` (`MaHDVDL`),
  ADD CONSTRAINT `phieudangkitourchitiet_ibfk_4` FOREIGN KEY (`MaTaiXe`) REFERENCES `taixe` (`MaTaiXe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
