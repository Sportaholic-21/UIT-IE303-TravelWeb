/* File này dùng để drop toàn bộ thông tin của bảng */

------- Dùng khi muốn xóa nhưng không reset ID (Nhớ thêm where sau tên bảng nếu muốn xóa 1 hàng cụ thể nha)
delete from typology
delete from continent
delete from tour
delete from nation
delete from tourBooking
delete from account
delete from feedback
delete from tourImage

------- Dùng khi muốn xóa hết và reset lại ID
-- Bảng typology
DBCC CHECKIDENT ('typology', RESEED, 0)
GO

-- Bảng nation
DBCC CHECKIDENT ('nation', RESEED, 0)
GO

-- Bảng continent
DBCC CHECKIDENT ('continent', RESEED, 0)
GO

-- Bảng tour
DBCC CHECKIDENT ('tour', RESEED, 0)
GO

-- Bảng tourBooking
DBCC CHECKIDENT ('tourBooking', RESEED, 0)
GO

-- Bảng account
DBCC CHECKIDENT ('account', RESEED, 0)
GO

-- Bảng feedback
DBCC CHECKIDENT ('feedback', RESEED, 0)
GO

-- Bảng tourImage
DBCC CHECKIDENT ('tourImage', RESEED, 0)
GO