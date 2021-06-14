INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('ylantt', 'lan@gmail.com', '1234', 'Binh Thuan', 'fb.com/hi', 'Truong Thi Y Lan')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('thone', 'pastwent12345@gmail.com', '1234', 'Long An', 'fb.com/hi..', 'Mai Nguyen Duc Tho')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('dungph', 'kthcm79@gmail.com', '1234', 'TPHCM', 'fb.com/HoaThienVu.HDP', 'Phan Hoang Dung')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('longnp', 'longnp@gmail.com', '1234', 'TPHCM', 'fb.com/Sportaholic', 'Nguyen Phuc Long')
select * from account

update account 
set accountRole = 0
where username = 'ylantt'