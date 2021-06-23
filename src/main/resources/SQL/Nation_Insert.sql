/* File này để thêm tên các quốc gia thuộc châu lục nào */

-- Được cập nhật vào ngày 13/6/2021
-- Aisa
Insert into nation(nationName, continentID) values ('Viet Nam', 1)
Insert into nation(nationName, continentID) values ('China', 1)
Insert into nation(nationName, continentID) values ('Japan', 1)

-- Europe
Insert into nation(nationName, continentID) values ('France', 2)
Insert into nation(nationName, continentID) values ('England', 2)
-- Australia
Insert into nation(nationName, continentID) values ('New Zealand', 3)

Select * from nation
select * from continent