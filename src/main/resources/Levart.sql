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

CREATE TABLE account
(
    accountID int IDENTITY(1,1) PRIMARY KEY,
    username varchar(20) UNIQUE,
    email varchar(20) UNIQUE,
    pass varchar(20),
    accountRole bit default 1, /* 0 la admin, 1 la client nha */
)
GO

CREATE TABLE typology
(
    typologyID int IDENTITY(1,1) PRIMARY KEY,
    typologyName varchar(20),
)
GO

CREATE TABLE tour
(
	tourID int IDENTITY(1,1) PRIMARY KEY,
	continentID int FOREIGN KEY REFERENCES continent(continentID),
	typologyID int FOREIGN KEY REFERENCES typology(typologyID),
	tourName varchar(20),
    shortDesc varchar(100),
	descr varchar(8000),
	price money,
	nation varchar(20),
	duration smallint, /* bao nhieu ngay */
	rating float default 0,
    schedule varchar(8000),
    discount float default 0,
	numberBooking int default 0, /* so luong dat tour cua tour nay */
	numberFeedback int default 0 /* so luong feedback cua tour do */
)
GO

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
    imageURL varchar(20),
    tourImageName varchar(20),
    imageRole bit default 1 /* 1 la cho gallery, 0 la cover image */
)

GO
/* ko cho phep cung 1 nguoi va dat cung 1 ngay */
ALTER TABLE tourBooking
  ADD CONSTRAINT ucCodes UNIQUE (accountID, bookDate)

GO
/* ko cho phep 2 tour trung ten va trung quoc gia */
ALTER TABLE tour
  ADD CONSTRAINT unTour UNIQUE (tourName, nation)

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
/* ngay schedule date >= bookDate -> ngay muon di >= ngay dat tour */
CREATE TRIGGER tg_schedule_book ON tourBooking FOR INSERT, UPDATE AS BEGIN
	DECLARE @book SMALLDATETIME,
			@schedule SMALLDATETIME,
			@MAKH CHAR(4)
	SELECT @book = bookDate, @schedule = scheduleDate FROM INSERTED
	IF @schedule =< @book BEGIN
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

CREATE TRIGGER tg_booking_del ON feedback FOR delete AS BEGIN
	DECLARE @tourID CHAR(4)
	SELECT @tourID = tourBookingID FROM deleted
	UPDATE tour
	SET numberBooking -= 1
	WHERE tourID = @tourID
END


GO
insert into typology values('entertainment');
insert into continent values('Asia');
insert into tour(numberFeedback, numberBooking, typologyID, continentID, tourName, nation, shortDesc, descr, schedule, price, discount, duration, rating) values(10, 10, 1, 1, 'Ha Long Bay', 'Viet Nam', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56.7, 0, 3, 4)
insert into account values('ylant', 'lan@gmail.com', '123', 1);
insert into account values('ylant2', 'lan2@gmail.com', '1233', 1);
insert into tourBooking(accountID, tourID, scheduleDate, bookStatus) values(1, 1, '03/02/2022', 4)
insert into tourBooking(accountID, tourID, scheduleDate, bookStatus) values(2, 1, '04/02/2023', 3)
insert into tour(numberFeedback, numberBooking, typologyID, continentID, tourName, nation, shortDesc, descr, schedule, price, discount, duration, rating) values(12, 12, 1, 1, 'Da Nang', 'Viet Nam', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 56.7, 0, 13, 3)
insert into tourBooking(accountID, tourID, scheduleDate, bookStatus) values(1, 2, '02/02/2022', 3)

/* SP_WHO 
KILL 55
drop database levart