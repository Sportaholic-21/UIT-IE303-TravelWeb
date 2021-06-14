create database levart
GO

use levart
GO

SET DATEFORMAT DMY
GO

CREATE TABLE continent
(
    continentID int IDENTITY(1,1) PRIMARY KEY,
    continentName varchar(20)
)
GO
CREATE TABLE nation
(
	nationID int IDENTITY(1,1) PRIMARY KEY,
	nationName varchar(100),
	continentID int FOREIGN KEY REFERENCES continent(continentID)
)
GO

CREATE TABLE account
(
    accountID int IDENTITY(1,1) PRIMARY KEY,
    username varchar(20) UNIQUE,
	fullName varchar(50),
    email varchar(100) UNIQUE,
    pass varchar(20),
    avatar varchar(70) default 'https://i.ibb.co/t42CQhf/profile-default.png',
    accountRole bit default 1, /* 0 la admin, 1 la client nha */
	accountAddress varchar(1000) NOT NULL,
	socialMediaLink varchar(1000) default '',
	point int default 0,
)
GO

-- Dành cho việc cập nhật bảng account nếu đã pull file này trước trưa ngày 5/6/2021 hoặc trước đó
/* alter table account
add point int default 0*/

/*alter table account
 * alter column email varchar(100)
 */

CREATE TABLE typology
(
    typologyID int IDENTITY(1,1) PRIMARY KEY,
    typologyName varchar(20),
)
GO

CREATE TABLE tour
(
	tourID int IDENTITY(1,1) PRIMARY KEY,
	nationID int FOREIGN KEY REFERENCES nation(nationID),
	typologyID int FOREIGN KEY REFERENCES typology(typologyID),
	tourName varchar(20),
    shortDesc varchar(200),
	descr varchar(8000),
	price decimal(10,0),
	duration smallint, /* bao nhieu ngay */
	rating float default 0,
    schedule varchar(8000),
    discount float default 0,
	priceDiscount decimal(10,0),
	numberBooking int default 0, /* so luong dat tour cua tour nay */
	numberFeedback int default 0, /* so luong feedback cua tour do */
	coordinate varchar(40) default ''
)
GO
-- Dành cho việc cập nhật bảng tour nếu đã pull file này trước buổi trưa ngày 5/6/2021
/* alter table tour
drop CONSTRAINT FK__tour__continentI__30F848ED
alter table tour
drop column continentID

alter table tour
alter column shortDesc varchar(200)

alter table tour
add coordinate varchar(40) default ''*/ 
CREATE TABLE tourBooking
(
    tourBookingID int IDENTITY(1,1) PRIMARY KEY,
    accountID int FOREIGN KEY REFERENCES account(accountID),
    tourID int FOREIGN KEY REFERENCES tour(tourID),
    bookDate SMALLDATETIME default GETDATE(), /* ngay dat tour, mac dinh la ngay hien tai */
	scheduleDate SMALLDATETIME, /* thoi gian ma date khoi hanh */
    bookStatus int default 1 /* 1: not start yet */
)
GO

CREATE TABLE feedback
(
    feedbackID int IDENTITY(1,1) PRIMARY KEY,
    tourBookingID int FOREIGN KEY REFERENCES tourBooking(tourBookingID),
    feedbackMessage varchar(255),
    star smallint,
)
GO

CREATE TABLE tourImage
(
    tourImageID int IDENTITY(1,1) PRIMARY KEY,
    tourID int FOREIGN KEY REFERENCES tour(tourID),
    imageURL varchar(100),
    tourImageName varchar(100),
    imageRole bit default 1 /* 1 la cho gallery, 0 la cover image */
)
GO
-- Dành cho việc cập nhật kiểu dữ liệu bảng tourImage nếu đã pull file này trước buổi tối 6/6/2021
/* Alter table tourImage
alter column imageURL varchar(100)
Alter table tourImage
alter column tourImageName varchar(100) */

/* ko cho phep cung 1 nguoi va dat cung 1 ngay */
ALTER TABLE tourBooking
  ADD CONSTRAINT ucCodes UNIQUE (accountID, scheduleDate)

GO
/* ko cho phep 2 tour trung ten va trung quoc gia */
ALTER TABLE tour
  ADD CONSTRAINT unTour UNIQUE (tourName, nationID)

GO
/* rang buoc account chi co gia tri 0 va 1 */
ALTER TABLE account
ADD CONSTRAINT AC_ROLE
CHECK (accountRole IN (0, 1))

GO
/* rang buoc img role chi co gia tri 0 va 1 */
ALTER TABLE tourImage
ADD CONSTRAINT imgTour_role
CHECK (imageRole IN (0, 1))

GO
/* rang buoc star feedback co gia tri tu 0 toi 5 */
ALTER TABLE feedback
ADD CONSTRAINT star_feedback
CHECK (star between 0 and 5)

GO
/* rang buoc rating tour co gia tri tu 0 toi 5 */
ALTER TABLE tour
ADD CONSTRAINT rating_tour
CHECK (rating between 0 and 5)

GO
/* rang buoc % discount tu 0 den 100 */
ALTER TABLE tour
ADD CONSTRAINT discount_tour
CHECK (discount between 0 and 100)

GO
/* rang buoc % discount tu 0 den 100 */
ALTER TABLE tourBooking
ADD CONSTRAINT status_tourBooking
CHECK (bookStatus between 1 and 4)

GO

/* Tạo trigger tự động thêm giá tiền sau khi giảm giá khi đã có giá tiền gốc và % giảm giá*/
create trigger insupd_discountPrice on tour 
for Insert, Update
as
begin
		Update tour
		set priceDiscount = price * ((100 - discount)/100)
end
go


/* ngay schedule date >= bookDate -> ngay muon di >= ngay dat tour */
CREATE TRIGGER tg_schedule_book ON tourBooking FOR INSERT, UPDATE AS BEGIN
	DECLARE @book SMALLDATETIME,
			@schedule SMALLDATETIME,
			@MAKH CHAR(4)
	SELECT @book = bookDate, @schedule = scheduleDate FROM INSERTED
	IF @schedule <= @book BEGIN
		PRINT 'schedule date must be greater than booking date'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT 'Success'
END
GO

/* rating cua tour bang trung binh cong cua star feedback */
CREATE TRIGGER tg_rating ON feedback FOR INSERT, UPDATE AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM INSERTED
	UPDATE tour
	SET rating = (
		SELECT AVG(star) FROM feedback
		WHERE tourID = @tourID
	)
	WHERE tourID = @tourID
END
GO

/* point tăng khi thêm feedback */
CREATE TRIGGER tg_increasePoint ON feedback FOR INSERT, UPDATE AS BEGIN
	DECLARE @tourBookingID CHAR(4), @accountID int
	SELECT @tourBookingID = tourBookingID FROM INSERTED
	SELECT @accountID = (SELECT accountID from tourBooking where tourBookingID = @tourBookingID)
	UPDATE account
	SET point = point + 100
	WHERE accountID = @accountID
END
GO

CREATE TRIGGER tg_rating_del ON feedback FOR DELETE AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM deleted
	UPDATE tour
	SET rating = (
		SELECT AVG(star) FROM feedback
		WHERE tourID = @tourID
	)
	WHERE tourID = @tourID
END

GO
/* tang so luong feedback cua tour len 1 moi khi co feedback */
CREATE TRIGGER tg_feedbackInsert ON feedback FOR INSERT AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM INSERTED
	UPDATE tour
	SET numberFeedback += 1
	WHERE tourID = @tourID
END
go

CREATE TRIGGER tg_feedback_delete ON feedback FOR delete AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM deleted
	UPDATE tour
	SET numberFeedback -= 1
	WHERE tourID = @tourID
END
GO
/* tang so luong booking cua tour len 1 moi khi co feedback */
CREATE TRIGGER tg_booking_add ON feedback FOR INSERT AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM INSERTED
	UPDATE tour
	SET numberBooking += 1
	WHERE tourID = @tourID
END
go

CREATE TRIGGER tg_booking_del ON feedback FOR delete AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM deleted
	UPDATE tour
	SET numberBooking -= 1
	WHERE tourID = @tourID
END
GO

/* SP_WHO 
KILL 59
drop database levart */
