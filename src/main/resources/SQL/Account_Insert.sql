INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('ylantt', 'lan@gmail.com', '1234', 'Binh Thuan', 'https://www.facebook.com/ylantt', 'Truong Thi Y Lan')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('thone', 'pastwent12345@gmail.com', '1234', 'Long An', 'https://www.facebook.com/MaiNguyenDucTho/', 'Mai Nguyen Duc Tho')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('dungph', 'kthcm79@gmail.com', '1234', 'TPHCM', 'https://www.facebook.com/HoaThienVu.HDP', 'Phan Hoang Dung')
INSERT INTO account(username, email, pass, accountAddress, socialMediaLink, fullName) values ('longnp', 'longnp@gmail.com', '1234', 'TPHCM', 'https://www.facebook.com/profile.php?id=100003927772911', 'Nguyen Phuc Long')
select * from account

update account 
set socialMediaLink='https://www.facebook.com/HoaThienVu.HDP'
where username = 'dungph'