USE [master]
GO
/****** Object:  Database [levart]    Script Date: 7/4/2021 10:26:06 AM ******/
CREATE DATABASE [levart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'levart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\levart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'levart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\levart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [levart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [levart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [levart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [levart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [levart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [levart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [levart] SET ARITHABORT OFF 
GO
ALTER DATABASE [levart] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [levart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [levart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [levart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [levart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [levart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [levart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [levart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [levart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [levart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [levart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [levart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [levart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [levart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [levart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [levart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [levart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [levart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [levart] SET  MULTI_USER 
GO
ALTER DATABASE [levart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [levart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [levart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [levart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [levart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [levart] SET QUERY_STORE = OFF
GO
USE [levart]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[fullName] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[pass] [varchar](20) NULL,
	[avatar] [varchar](70) NULL,
	[accountRole] [bit] NULL,
	[accountAddress] [varchar](1000) NOT NULL,
	[socialMediaLink] [varchar](1000) NULL,
	[point] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[continent]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[continent](
	[continentID] [int] IDENTITY(1,1) NOT NULL,
	[continentName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[continentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[tourBookingID] [int] NULL,
	[feedbackMessage] [varchar](255) NULL,
	[star] [smallint] NULL,
	[sentimentStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nation]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nation](
	[nationID] [int] IDENTITY(1,1) NOT NULL,
	[nationName] [varchar](100) NULL,
	[continentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[tourID] [int] IDENTITY(1,1) NOT NULL,
	[nationID] [int] NULL,
	[typologyID] [int] NULL,
	[tourName] [varchar](20) NULL,
	[shortDesc] [varchar](200) NULL,
	[descr] [varchar](8000) NULL,
	[price] [decimal](10, 0) NULL,
	[duration] [smallint] NULL,
	[rating] [float] NULL,
	[schedule] [varchar](8000) NULL,
	[discount] [float] NULL,
	[priceDiscount] [decimal](10, 0) NULL,
	[numberBooking] [int] NULL,
	[numberFeedback] [int] NULL,
	[coordinate] [varchar](40) NULL,
	[scheduleCoordinate] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[tourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourBooking]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tourBooking](
	[tourBookingID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[tourID] [int] NULL,
	[bookDate] [smalldatetime] NULL,
	[scheduleDate] [smalldatetime] NULL,
	[bookStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tourBookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourImage]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tourImage](
	[tourImageID] [int] IDENTITY(1,1) NOT NULL,
	[tourID] [int] NULL,
	[imageURL] [varchar](100) NULL,
	[tourImageName] [varchar](100) NULL,
	[imageRole] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[tourImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typology]    Script Date: 7/4/2021 10:26:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typology](
	[typologyID] [int] IDENTITY(1,1) NOT NULL,
	[typologyName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[typologyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([accountID], [username], [fullName], [email], [pass], [avatar], [accountRole], [accountAddress], [socialMediaLink], [point]) VALUES (1, N'ylantt', N'Lan Truong', N'lan@gmail.com', N'1234', N'https://i.ibb.co/t42CQhf/profile-default.png', 0, N'Binh Thuan', N'https://www.facebook.com/ylantt', 0)
INSERT [dbo].[account] ([accountID], [username], [fullName], [email], [pass], [avatar], [accountRole], [accountAddress], [socialMediaLink], [point]) VALUES (2, N'thone', N'Mai Nguyen Duc Tho', N'pastwent12345@gmail.com', N'1234', N'https://i.ibb.co/t42CQhf/profile-default.png', 0, N'Long An', N'https://www.facebook.com/MaiNguyenDucTho/', 4800)
INSERT [dbo].[account] ([accountID], [username], [fullName], [email], [pass], [avatar], [accountRole], [accountAddress], [socialMediaLink], [point]) VALUES (3, N'dungph', N'Phan Hoang Dung', N'kthcm79@gmail.com', N'1234', N'https://i.ibb.co/t42CQhf/profile-default.png', 1, N'TPHCM', N'https://www.facebook.com/HoaThienVu.HDP', 0)
INSERT [dbo].[account] ([accountID], [username], [fullName], [email], [pass], [avatar], [accountRole], [accountAddress], [socialMediaLink], [point]) VALUES (4, N'longnp', N'Nguyen Phuc Long', N'longnp@gmail.com', N'1234', N'https://i.ibb.co/t42CQhf/profile-default.png', 1, N'TPHCM', N'https://www.facebook.com/profile.php?id=100003927772911', 0)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[continent] ON 

INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (1, N'Aisa')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (2, N'Africa')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (3, N'North America')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (4, N'South America')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (5, N'Antarctica')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (6, N'Europe')
INSERT [dbo].[continent] ([continentID], [continentName]) VALUES (7, N'Australia')
SET IDENTITY_INSERT [dbo].[continent] OFF
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([feedbackID], [tourBookingID], [feedbackMessage], [star], [sentimentStatus]) VALUES (7, 4, N'Great', 5, 1)
INSERT [dbo].[feedback] ([feedbackID], [tourBookingID], [feedbackMessage], [star], [sentimentStatus]) VALUES (8, 5, N'nice', 5, 1)
SET IDENTITY_INSERT [dbo].[feedback] OFF
SET IDENTITY_INSERT [dbo].[nation] ON 

INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (1, N'Viet Nam', 1)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (2, N'China', 1)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (3, N'Japan', 1)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (4, N'Laos', 1)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (5, N'France', 2)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (6, N'England', 2)
INSERT [dbo].[nation] ([nationID], [nationName], [continentID]) VALUES (7, N'New Zealand', 3)
SET IDENTITY_INSERT [dbo].[nation] OFF
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (1, 1, 1, N'Ha Long Bay', N'Ha Long Bay has around 1600 islands and islets, forming a spectacular seascape of limestone pillars.', N'Ha Long Bay, located in the Gulf of Tonkin, within Quang Ninh Province, in the northeast of Vietnam, is165 km from the capital of Ha Noi. Covering an area of 43,400 ha and including over 1600 islands and islets, most of which are uninhabitated and unaffected by humans, it forms a spectacular seascape of limestone pillars and is an ideal model of a mature Karst landscape developed during a warm and wet tropical climate. The property’s exceptional scenic beauty is complemented by its great biological interest. The outstanding value of the property is centered around the drowned limestone karst landforms, displaying spectacular pillars with a variety of coastal erosional features such as arches and caves which form a majestic natural scenery. The repeated regression and transgression of the sea on the limestone karst over geological time has produced a mature landscape of clusters of conical peaks and isolated towers which were modified by sea invasion, adding an extra elemant to the process of lateral undercutting of the limstone towers and islands.', CAST(1000 AS Decimal(10, 0)), 4, 4.5, N'HCMC – HANOI – LAO CAI – SAPA (Lunch, dinner);
- Morning: You are present at the domestic terminal, Tan Son Nhat airport at least three hours before the flight time.;
	+ Representative of Vietnam Tourism Company welcomes and supports you to carry out procedures to catch the flight to Hanoi.;
	+ Arriving at Noi Bai airport, the tour guide picks up the delegation to depart for Lao Cai on the longest highway in Vietnam - the connection between Hanoi and the Northwest provinces.;
- Noon: Have lunch.;
	+ The delegation continues to the highland town of Sapa, enjoy the picturesque scenery of the mountains and forests and explore the life of ethnic minorities in the Northwest.;
	+ Visit Cat Cat village, learn about the weaving and dyeing profession of the H''Mong ethnic group and Cat Cat hydroelectric station in the French period - where 3 streams of water combine to form Muong Hoa stream.;
- Afternoon: Have dinner.;
	+ Rest Overnight in Sapa. Feel free to walk around, visit Sapa stone church, attend market night (if going on Saturday night).
/SAPA – FANSIPAN – HANOI (Breakfast, lunch, dinner);
- Morning: Have breakfast buffet at the hotel.;
	+ Depart to visit Fansipan, the highest mountain in Vietnam (3,143 m) in the Hoang Lien Son mountain range, about 9 km southwest of Sa Pa town.;
	+ Visitors conquer the "Roof of Indochina" with the 6.2km-long Fansipan Sa Pa cable car system, achieving two Guinness World Records: The three-wire cable car has the largest difference between the departure and arrival stations in the world: 1410m and the world''s longest three-wire cable car: 6292.5m. From the cable car, visitors can feel the majestic nature, admire the scenery of Muong Hoa valley and Hoang Lien national forest from above.;
	+ In addition, visitors can also come to pilgrimage at the spiritual tourist area - Trinh Pagoda, Ha Pagoda at the arrival station (cable car costs are self-sufficient).;
- Noon: Have lunch.;
	+ Depart for Hanoi.;
- Afternoon: Have dinner. Overnight in Hanoi.;
	+ You can take a walk around the capital, enjoy specialties: La Vong fish vermicelli, Hanoi noodle soup, bung thang, bun cha, ... or enjoy coffee in the old town, Hoan Kiem Lake, join the street. walking, night market, Dong Xuan market, enjoy specialties and buy souvenirs. ;
/HANOI – YEN TU – HA LONG (Breakfast, lunch, dinner);
- Morning: Have breakfast buffet at the hotel.;
	+ Depart to Ha Long, on the way stop to visit Yen Tu mountain - a mountain 1068 m high above sea level, a natural landscape that still preserves a system of historical and cultural relics associated with the birth. , the formation and development of Truc Lam Yen Tu Zen sect, known as "the ancestral land of Vietnamese Buddhism".;
- Noon: Have lunch.;
	+ You go up the mountain by cable car (the cable car cost is self-sufficient), visit Hoa Yen pagoda, Bao Thap, Truc Lam Tam To, Hang Tung 700 years old ... down the mountain to visit Truc Lam Zen Monastery with heavy Nhu Y ball 6 tons was ranked the Guinness World Record in Vietnam.;
	+ Depart for Ha Long city.;
- Afternoon: Have dinner. Overnight in Ha Long.;
	+ You are free to walk around, shop at the night market or join the Sunworld Ha Long Park area with all the majestic indoor and outdoor game areas, including Dragon Park, Queen Cable Car and Sun wheel... (own expense).;
/HA LONG Bay – HANOI – HCMC (Breakfast, Lunch);
- Morning: Have breakfast buffet at the hotel.;
	+ Delegation to the boat to admire the scenery of Ha Long Bay - World natural heritage with thousands of rocky islands with strange shapes - admire the elaborate and splendid beauty of Thien Cung cave, the supernatural beauty of Dinh Huong island, Fighting Chickens, Fighting Dogs… ;
- Noon: Have lunch.;
	+ Depart for Hanoi, tour guide see you off to Noi Bai airport to catch the flight to Ho Chi Minh City.;
End of the tour, farewell and see you again.;', 20, CAST(800 AS Decimal(10, 0)), 3, 3, N'107, 20', N'103.988411, 22.475868, 103.75955690632118, 22.30774368781965, 107.04390713755039, 20.97287140293925, 105.8582641561314, 21.023756680309052')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (2, 1, 1, N'Sapa City', N'Sapa is one of the most attractive tourist destinations in Vietnam, always bringing great experiences by the scenery, people and cool fresh air.', N'Coming to this place, visitors will have the opportunity to admire the magnificent mountain scenery, enjoy the unique culture of the indigenous people and above all experience the peaceful and simple activities every day. of ethnic minorities. Tourists definitely do not miss the opportunity to enjoy delicious dishes such as pork belly, sturgeon, thang co, vegetables or salmon, ... One of the main attractions for visitors is that this place is always open in every season. beautiful and unique. Traveling to Sapa on the occasion of Tet to spring, visitors will see a land of brilliant flowers: white peach blossoms, lovely plum flowers.. and participate in the traditional festivals of the Mong and Dao ethnic minorities. or Giay people, ..Spring through the summer, wearing cool green eyes from the terraced fields or rolling hills, seems to contribute to dispelling the sweltering summer sun. Autumn comes, transforming itself into the pink and purple color of the buckwheat flower fields, the bustling yellow color of the ripe rice fields in the valley. Winter brings with it the romantic experience of snow-covered moments like Korean movies right in the middle of Vietnam. All the elements from scenery to nature, climate and people with unique cultures have blended together to create a very own, very unique and different identity - a land full of charm, attraction on the tourist map of Vietnam.', CAST(328 AS Decimal(10, 0)), 3, 5, N'HCMC – HANOI – LAO CAI – SAPA (Lunch, dinner);
- Morning: You arrive at the domestic terminal, Tan Son Nhat airport at least three hours before the flight time.;
	+ Representative of Viet Travel Company welcomes and supports you to carry out procedures to catch the flight to Hanoi. Arriving at Noi Bai airport, the tour guide picks up the group to depart for Lao Cai on the longest highway in Vietnam - the connection between Hanoi and the Northwest provinces.;
- Noon: Have lunch.;
	+ The delegation continued to the highland town of Sapa, enjoying the picturesque scenery of the mountains and forests and discovering the life of the ethnic minorities in the Northwest.;
- Afternoon: Have dinner. Overnight in Sapa.;
	+ Feel free to walk around, visit Sapa stone church, attend love market night (if going on Saturday night).;
/SAPA – FANSIPAN – SAND BAN (Breakfast, lunch, dinner);
- Morning: Have breakfast buffet at the hotel.;
	+ Depart to visit Fansipan, the highest mountain in Vietnam (3,143 m) in the Hoang Lien Son mountain range, about 9 km southwest of Sapa town. Visitors conquer the "Roof of Indochina" with the 6.2km-long Fansipan Sa Pa cable car system, achieving two Guinness World Records: The three-wire cable car has the largest difference between the departure and arrival stations in the world: 1410m and The longest three-wire cable car in the world: 6292.5m. From the cable car, visitors can feel the majestic nature, admire the scenery of Muong Hoa valley and Hoang Lien national forest from above.;
	+ In addition, visitors can also go to pilgrimage at the spiritual tourist area - Trinh Pagoda, Ha Pagoda at the arrival station (the cable car costs are self-sufficient).;
- Noon: Have lunch.;
	+ Visit Cat Cat village, learn about the weaving and dyeing profession of the H''Mong ethnic group and Cat Cat hydroelectric station in the French period - where 3 streams of water combine to form Muong Hoa stream.;
- Afternoon: Have dinner. Overnight in Sapa.;
	+ You can walk the along the streets at night, enjoy highland specialties such as: grilled armpit pork, grilled eggs, apple cider, interact with ethnic people in the highlands.;
/SAPA – HANOI – HCMC (Breakfast, Lunch);
- Morning: Have breakfast buffet at the hotel.;
	+ You are free to rest at the hotel or buy local specialties as gifts for family and relatives.;
- Noon: Have lunch.;
	+ After lunch, guests are free to move around before heading to some famous destinations in Ha Noi.
	+ Visiting Hanoi capital with: Presidential Palace, fish pond, Uncle Ho''s stilt house, One Pillar Pagoda, Ho Chi Minh Museum.;
	+ Visiting Temple of Literature - Quoc Tu Giam.;
- Afternoon: 
	+ The group is free to go to the market, buy specialties as gifts for relatives and family.;
	+ Tour guide see you off to Noi Bai airport to catch the flight to Ho Chi Minh City.;
End of the tour, farewell and see you again.;', 10, CAST(295 AS Decimal(10, 0)), 3, 1, N'103, 22', N'103.97441698499703, 22.480243438546413, 103.8416954576399, 22.3354309794022, 105.83593358637923, 21.02978888931015')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (3, 1, 1, N'Quang Ninh', N'Quang Ninh is a coastal province in the Northeast region of Vietnam. It can be seen as a "miniature Vietnam" - because of having seas, islands, plains and midlands, hills, and borders.', N'Quang Ninh is a mountainous - coastal province. More than 80% of the land is mountainous. More than two thousand islands floating on the sea are also mountains.
The mountainous region is divided into two regions: the Eastern mountainous region from Tien Yen through Binh Lieu, Hai Ha, Dam Ha to Mong Cai. This is the continuation of the Shi Wan Dai Son mountain range from China, the main direction is northeast - southwest. There are two main mountain ranges: Quang Nam Chau range (1,507m) and Cao Xiem (1,330m) occupying most of the natural area of Binh Lieu, Hai Ha, Dam Ha districts, and the Ngan Chi range (1,166m) in the north of the district. Tien Yen. The western mountains range from Tien Yen through Ba Che, Hoanh Bo, north of Uong Bi town and gradually lower in the north of Dong Trieu district. This mountain area is a series of slightly curved lines, so it is often called the Dong Trieu mountain arc with Yen Tu peak (1,068m) on Uong Bi land and Am Vap peak (1,094m) on Hoanh Bo land.
The midlands and coastal plains consist of low hillsides that are weathered and eroded, creating fields from the foothills down to the riverbanks and the coast. These are Dong Trieu, Uong Bi, northern Yen Hung, southern Tien Yen, Dam Ha, Hai Ha and part of Mong Cai. In estuaries, alluvial deposits form low-tidal fields and flats. These are the areas south of Uong Bi, south of Yen Hung (Ha Nam island), east of Yen Hung, Dong Rui (Tien Yen), south of Dam Ha, southeast of Hai Ha, south of Mong Cai. Although the area is narrow and fragmented, the midlands and coastal plains are convenient for agriculture and transportation, so they are the rich residential areas of Quang Ninh.
The sea and islands of Quang Ninh are a unique terrain. More than two thousand islands make up more than two thirds of the country''s islands (2078/2779), the island stretches along the coastline for more than 250km divided into many layers. There are very large islands such as Cai Bau and Ban Sen islands, and there are islands just like a rockery. There are two districts that are completely islands: Van Don district and Co To district. On Ha Long Bay and Bai Tu Long Bay, there are thousands of limestone islands, which are karst terrain eroded by water, creating thousands of shapes outside and inside are interesting caves.', CAST(450 AS Decimal(10, 0)), 4, 5, N'HCMC - HANOI - HA LONG (Lunch, dinner);
- Morning: You are present at the domestic terminal, Tan Son Nhat airport three hours before the flight time.;
+ Representative of Viet Travel Company welcomes and supports you to check-in procedures for flight to Hanoi. Arriving at the airport, the tour guide will pick you up and depart for Ha Long.;
- Noon: Have lunch.;
+ Visit the Quang Ninh Museum - Library, a unique architectural and artistic work. With the design, arrangement, youthful and modern tones, ... this place still gives you the most complete view of nature and people from prehistoric to modern times of the land, but not visitors feel bored because the space is extremely spacious with art. (except the last Monday of the month closed).;
+ Freely explore Sunworld Ha Long Park with all indoor and outdoor game areas, including Dragon Park, Sun wheel Queen Cable Car... (own expense).;
- Evening: Have dinner. Overnight in Ha Long. You are free to walk around, shop at the night market.;
/HA LONG - NINH BINH (Breakfast, lunch, dinner);
- Morning: Have breakfast buffet at the hotel.;
+ Take a boat to admire the scenery of Ha Long Bay - World natural heritage with thousands of rocky islands with strange shapes - admire the elaborate and splendid beauty of Thien Cung cave, the supernatural beauty of Dinh Huong and Chicken islands. Fighting, Stone Dog…;
- Noon: Have lunch on board. Depart for Ninh Binh, where there is Trang An scenic spot which is recognized by UNESCO as a mixed cultural and natural heritage of the world.;
- Afternoon: Have dinner. Overnight in Ninh Binh. You can freely walk the streets, enjoy Ninh Binh specialties such as mountain goat meat, mountain snails, Yen Mac spring rolls, burnt rice,...;
/NINH BINH - TRANG AN - BAI DINH (Breakfast, lunch, dinner);
- Morning: Have breakfast buffet at the hotel.;
+ Visit to Bai Dinh pagoda - the temple with the most records in Vietnam (the temple has the largest area - The largest bronze Buddha statue in Vietnam).;
- Noon: Have lunch.;
+ Boat trip along the stream in the middle of rice fields to visit Trang An tourist area where limestone strips, valleys and rivers intertwine creating a fanciful, mysterious space, you take a boat to visit Morning Cave. , Dark cave, Wine making cave and learn about the culture and history here.;
- Afternoon: Have dinner. Overnight in Ninh Binh.;
/TAM CHUC - HANOI - HCMC (Breakfast, lunch);
- Morning: Have breakfast buffet at the hotel.;
+ Depart for Hanoi. On the way stop, visit Tam Chuc Pagoda, the largest temple in the world. With an area up to 5,000 hectares, carved 1,200 statues of volcanic lava and possessing many treasures in the world, with majestic scenery, in front, in the middle of the lake are 6 mountains with the shape of a fruit. bell, behind are 7 mountains that can light up when there is moonlight at night, creating a magnificent view to observe.;
- Noon: Have lunch. The group is free to visit Hoan Kiem Lake, Ngoc Son Temple.;
+ Tour guide see you off to Noi Bai airport to catch the flight to Ho Chi Minh City, end the tour, say goodbye to the group and see you again.', 20, CAST(360 AS Decimal(10, 0)), 3, 3, N'107, 20', N'105.79476573596718, 21.217900852986123, 107.03917417656463, 20.97070535606187, 105.96875534255115, 20.250350021940722, 105.85644712087739, 21.022738704091708')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (4, 1, 1, N'Da Nang', N'Known as a must-visit place once in Vietnam. You can enjoy the magnificent view with the poetic Han River and the iconic Dragon Bridge of the tourist coastal city of Da Nang.', N'Da Nang''s weather is typical between the North and the South, but has a more typical southern climate. During the year, Da Nang''s climate is divided into two distinct seasons: the dry season (from December to August) and the rainy season (from September to November). Winter in Da Nang is also affected by cold air. Therefore, the most ideal time to travel to Da Nang is from January to July, the peak is from February to May. At this time, the weather is cool, not too hot, the temperature is about 23 - 38 degrees Celsius suitable for fun activities and sightseeing, swimming. If you go from September to October in Da Nang, there is a lot of rain, in addition to storms, so you will not be able to go out much, cannot swim and cannot go to Cu Lao Cham at this time.
Da Nang is one of the cleanest and most beautiful cities in Vietnam, with a fast economic growth rate. The city has many famous scenic spots such as: Marble Mountains, Cham Island, Han River... and many entertainment areas. In particular, Da Nang has many legendary bridges with unique architecture such as Dragon Bridge, Song Han Bridge... In addition, Da Nang has very good security services, you can rest assured when traveling here.', CAST(328 AS Decimal(10, 0)), 3, 5, N'HCMC – DA NANG – HOI AN (lunch, dinner);
- Morning: You are present at the domestic terminal, Tan Son Nhat airport at least three hours before the flight time.;
+ Representative of Vietnam Travel Company welcomes and supports you to carry out procedures to catch the flight to Da Nang.;
+ Arriving at Da Nang airport, the guide will welcome you to visit the Marble Mountains - is like a giant rock in the heart of Da Nang city with Huyen Khong Cave, Linh Ung Pagoda, Tam Thai Pagoda, Vong Hai Dai ... shopping for souvenirs at Non Nuoc stone carving village.;
- Noon: Have lunch.;
+ Depart for Hoi An, visit Hoi An Ancient Town - a world cultural heritage with Japanese Covered Bridge, Phuc Kien Assembly Hall, Phung Hung Ancient House...;
- Afternoon: Have dinner. Overnight in Da Nang.;
+ You are free to walk the streets, see the famous bridges of Da Nang city: Dragon bridge, Han River bridge, Tran Thi Ly bridge, Thuan Phuoc bridge...;
/DA NANG – BA NA (breakfast, dinner) (lunch at your own expense);
- Morning: Have breakfast buffet at the hotel.;
+ Depart to Ba Na hill where has a unique European climate and is famous for the world''s new record cable car route - Panoramic view of Da Nang city from the cable car (cable car costs are self-sufficient) .;
+ You are free to visit and entertain in Ba Na with Fantasy Park, 3D Mega Cinema 360 degrees with the most modern and only technology available in Vietnam, Two cinemas 4D and 5Di, Xe. Pipe Slide, Wine Cellar, Love Flower Garden, Wax Museum, take pictures at the Golden Bridge, a new super hot attraction in Ba Na…;
+ Visitors can find spiritual symbols such as temples, shrines or statues of Buddhas. It will definitely be a stop for those who wish for peace and health for their family: Linh Ung Pagoda, Linh Chua Linh Tu Temple, Linh Phong Tu Tower, Shakyamuni Statue, Bell Tower, Beer House, Ba Temple , Tru Vu Tra Quan.;
- Noon: Please have lunch at your own expense.;
- Afternoon: Have dinner at the restaurant. Overnight in Danang.;
/DA NANG - HUE - HCMC (breakfast, lunch);
- Morning: Have breakfast buffet at the hotel.;
+ Take a tour of Son Tra peninsula. At there, we will visit Linh Ung Tu and enjoy the beauty of My Khe beach (regarded as one of the most charming beaches on the planet).;
+ Depart for Hue through Hai Van tunnel - the longest road tunnel in Southeast Asia.;
- Noon: Have lunch.;
+ Visiting Hue with the Citadel - Imperial Citadel of 13 Nguyen kings, where there are more than 100 beautiful architectural works: Ngo Mon Gate, Thai Hoa Palace, Forbidden City, The Mieu, Hien Lam Cac, Cuu Dinh, ...;
+ Visit Thien Mu Pagoda - the oldest pagoda in Hue Ancient Capital.;
+ Tour guide see you off to Phu Bai airport, take a flight to Ho Chi Minh City.;
End of the tour, farewell and see you again.', 10, CAST(295 AS Decimal(10, 0)), 4, 4, N'108, 16', N'108.29938047795513, 15.880189129075003, 107.98866731247685, 15.99776606894012, 107.5790008768497, 16.472648521258417')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (5, 1, 1, N'Nha Trang', N'Nha Trang is a famous beach tourism city in Khanh Hoa province. This place is endowed by nature for a very mild climate, beautiful beaches, special and unique historical sites.', N'The coastal city of Nha Trang is the capital of Khanh Hoa province, in the South Central Coast of Vietnam. Nha Trang Bay is one of the most beautiful bays in the world, it is an invaluable gift that nature bestows on this land.
In Nha Trang, Khanh Hoa province to be exact, there are 4 large bays stretching from South to North, including: Cam Ranh Bay, Nha Trang Bay, Nha Phu Bay and Van Phong Bay. The sea here is always calm thanks to being surrounded by islands around the bay I just mentioned above. And marine tourism in Nha Trang also revolves around these bays with some famous tourist attractions such as Cam Ranh beach, Tu Binh beach, Mun island, Tam island, Mieu island, Mot island, Yen island - Hon Noi, the sea. Nha Trang, Diep Son Island, Doc Let, Monkey Island...
In addition to sea tourist destinations, Nha Trang is also extremely famous for cultural and historical sites such as the Cham Pa cultural architectural complex, Ba Ponagar tower, stone church, Long Son pagoda... Famous by tourists Due to the sea calendar, delicious dishes, specialties in Nha Trang are also mostly "sea flavor" such as jellyfish noodles, squid pancakes, fish cake soup, grilled fish, emperor shrimp... In addition, dishes such as spring rolls grilled, can cake, bird''s nest, mango rice paper ... are extremely worth enjoying.', CAST(328 AS Decimal(10, 0)), 4, 5, N'HCMC – PHAN THIET – NHA TRANG (Breakfast, lunch, dinner);
- Morning: Car and Vietnamese tour guide pick you up at the meeting point.;
+ Depart for Nha Trang. Have breakfast at Dau Giay junction. The delegation continued the route to Phan Thiet.;
- Noon: Have lunch.;
+ Journey on National Highway 1A, when you arrive at the border of Binh Thuan - Ninh Thuan, you admire the enchanting beauty of Ca Na beach with clear blue water, long and winding sandy beaches.;
- Afternoon: Arrive in Nha Trang, check in. Have dinner.;
- Evening: Free to walk on the beach, overnight at hotel in Nha Trang.;
/EXPLORER 4 ISLANDS – VINPEARLAND (Breakfast, Lunch) (Dinner at your own expense);
- Morning: Have breakfast. ;
+ Get off the boat to depart for a 4-island excursion, discover the splendor of Hon Ngoc Viet and the best view of the whole coastal city of Nha Trang from the sea.;
+ You have the opportunity to visit Hon Mieu to visit the Aquarium to see sea creatures, swim in Hon Mot, Bai Tranh or snorkel at Hon Mun, experience sea games such as paragliding, water moto, paragliding. , banana float, scuba diving, walking on the seabed, kayaking...
(self-sufficient service costs).;
- Noon: Have lunch.;
+ You are free to choose one of the following two options:;
• Option 1: Nha Trang Mineral Spring Resort I.resort – Body massage with zaccuzi hydraulic system, soak in Hot Mineral Pool, Mud Bath… (own expense).;
• Option 2: You depart to visit Vinpearl (expenses excluded).;
+ Outdoor games: thrilling ferris wheel, cable stayed carousel, trampoline carousel, elephant carousel, roller coaster, ferris wheel, flying bike, pirate ship, fun city, circus animals, circus animals (3 times a day).;
+ Indoor games: four-dimensional movie, car crash, fairy garden, children''s paradise, game supermarket, karaoke room...;
+ Vinpearlland aquarium with an area ????over 3,400 square meters, is a miniature ocean with more than 300 species of beautiful, rare and fancy fish.;
+ Water park area with thrilling games: adventure game area, children''s game area, wave pool, lazy river, adventure family game area...;
- Evening: Have dinner at your own expense.;
+ Overnight in Nha Trang. You are free to walk around, the night market or enjoy seafood at Thap Ba area (own expense).
/THE PONAGAR TOWER – STONE CHURCH (Breakfast, lunch, dinner);
- Morning: Have breakfast.;
+ You visit Nha Trang city: Ponagar Tower: a work of the largest scale and plays an important role in the history of Cham religious architectural art.;
+ Long Son Pagoda: the most famous temple in Nha Trang. The top of the hill is the statue of Kim Than Buddha (also known as the white Buddha) sitting in a lecture, the statue is 21m high, the lotus base is 7m high;
+ The stone church (Christian King Cathedral) with unique architecture in French style.;
- Noon: Have lunch.;
+ Sightseeing, shopping for specialties at Cho Dam commercial center. You are free to visit.;
- Afternoon: Have dinner.;
+ Overnight in Nha Trang.;
/NHA TRANG – HCMC (Breakfast, Lunch);
- Morning: Have breakfast. After that, free sightseeing around Nha Trang.;
- Noon:;
+ Depart to Phan Thiet, have lunch. After the meal, visitors rest and buy souvenirs for their loved ones;
- Afternoon:;
+ The tour group returns to Ho Chi Minh City – Farewell and see you again.;', 10, CAST(295 AS Decimal(10, 0)), 5, 5, N'109, 12', N'108.26091225391383, 10.98303340012986, 109.24168459774654, 12.216398237260345, 109.19608114312634, 12.26558728611357, 109.17966735770432, 12.2529775185103')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (6, 3, 2, N'Tokyo', N'Tokyo is a large city with a population of over 1.38 million. The view is spotless from the Sky Tree tower as well as the Tokyo Tower, a symbol of Tokyo. Your customers are never bored.', N'March and April are the best times in Tokyo with cherry blossoms blooming all over the city. At this time, it is quite cold for visitors from the tropics, the wind is blowing gently, in general, it is ideal to go to Tokyo.
If you love water games, you can go to Tokyo from May to September, the climate is quite hot. The sakura festival will welcome you in the most exciting way. 
As romantic as the dramas, it must come to autumn. The carpets of yellow leaves, little sunshine, cold and gentle wind, walking in the autumn sky is nothing more poetic. If you love water games, you can go to Tokyo from May to 
September, the climate is quite hot. The sakura festival will welcome you in the most exciting way. As romantic as the dramas, it must come to autumn. The carpets of yellow leaves, little sunshine, cold and gentle wind, walking in the autumn sky is nothing more poetic.
Trains and subways are the two most popular means of transport in Tokyo. With 23 separate areas but there are 60 subway lines, so using this means you can go everywhere in Tokyo. However, if there is no subway system in your
country, buying tickets, choosing stations and destinations will be a bit difficult because these trains come and go very quickly. No problem, the staff at each station will guide you very enthusiastically. 
The most famous in Japan is probably the Shinkansen bullet train system, which can take you everywhere in a split second. You can purchase a Shinkansen train ticket or a JR Pass before your trip with Traveloka. No need to search, queue hard, order a few operations and have it right away.', CAST(1090 AS Decimal(10, 0)), 4, 5, N'HCMC – NARITA (Overnight on plane);
- Morning: Car and Vietnamese tour guide pick you up at the meeting point.;
+ Depart for NARITA. Have breakfast at Dau Giay junction. The delegation continued the route to NARITA.;
- Noon: Have lunch.;
+ Journey on National Highway 1A, when you arrive at the border of NARITA.;
- Afternoon: Arrive in NARITA, check in. Have dinner.;
- Evening: Free to walk on the beach, overnight at hotel in NARITA.;
/NARITA – HAKONE – FUJI (Eat two meals);
- Morning: Have breakfast. ;
+ Get off the boat to depart for a 4-island excursion, discover the splendor of Hon Ngoc Viet and the best view of the whole coastal city of NARITA from the sakura.;
+ You have the opportunity to visit Hon Mieu to visit the Aquarium to see sakura creatures, swim in Hon Mot, Bai Tranh or snorkel at Hon Mun, experience sea games such as paragliding, water moto, paragliding. , banana float, scuba diving, walking on the seabed, kayaking...
(self-sufficient service costs).;
- Noon: Have lunch.;
+ You are free to choose one of the following two options:;
• Option 1: HAKONE Mineral Spring Resort I.resort – Body massage with zaccuzi hydraulic system, soak in Hot Mineral Pool, Mud Bath… (own expense).;
• Option 2: You depart to visit HAKONE (expenses excluded).;
+ Outdoor games: thrilling ferris wheel, cable stayed carousel, trampoline carousel, elephant carousel, roller coaster, ferris wheel, flying bike, pirate ship, fun city, circus animals, circus animals (3 times a day).;
+ Indoor games: four-dimensional movie, car crash, fairy garden, children''s paradise, game supermarket, karaoke room...;
+ Vinpearlland aquarium with an area ????over 3,400 square meters, is a miniature ocean with more than 300 species of beautiful, rare and fancy fish.;
+ Water park area with thrilling games: adventure game area, children''s game area, wave pool, lazy river, adventure family game area...;
- Evening: Have dinner at your own expense.;
+ Overnight in FUJI. You are free to walk around, the night market or enjoy seafood at Thap Ba area (own expense).
/FUJI – TOKYO (Three meals) (Breakfast, lunch, dinner);
- Morning: Have breakfast.;
+ You visit FUJI city: Ponagar Tower: a work of the largest scale and plays an important sakura role in the history of Cham religious architectural art.;
+ FUJI Pagoda: the most famous temple in FUJI. The top of the hill is the statue of Kim Than Buddha (also known as the white Buddha) sitting in a lecture, the statue is 21m high, the lotus base is 7m high;
+ The stone church (Christian King Cathedral) with sakura unique architecture in TOKYO style.;
- Noon: Have lunch.;
+ Sightseeing, shopping for specialties at TOKYO commercial center. You are free to visit.;
- Afternoon: Have dinner.;
+ Overnight in TOKYO.;
/NARITA – HO CHI MINH (Breakfast, Lunch);
- Morning: Have breakfast. After that, free sightseeing around TOKYO.;
- Noon:;
+ Depart to Phan Thiet, have lunch. After the meal, visitors rest and buy souvenirs for their loved ones;
- Afternoon:;
+ The tour group returns to Ho Chi Minh City – Farewell and see you again.;', 0, CAST(1090 AS Decimal(10, 0)), 0, 0, N'139.7691994859629,35.68272772462245', N'140.33323664074456, 35.79081594383057, 139.0267361826666, 35.2512804336085, 138.72727753758744, 35.36135965085453, 139.62448597651024, 35.46486862155051')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (7, 3, 3, N'Osaka', N'Osaka is a big city about 400km from Tokyo. From Tokyo, you can travel by Shinkansen about 1 hour and 30 minutes, this is a typical city of the Kansai region. ', N'Osaka is a big city about 400km from Tokyo. From Tokyo, you can travel by Shinkansen about 1 hour and 30 minutes, this is a typical city of the Kansai region. 
Osaka developed into one of the major metropolises it is today about 500 years ago. Japanese samurai Toyotomi Hideyoshi built a castle in this land, taking Osaka 
as a base to develop culture and circulation. It is the second largest metropolis after Tokyo. In terms of cuisine, Osaka is very developed and is also known as the 
"National Kitchen". This is the place to gather delicious local dishes from all over the country. Today, Osaka attracts visitors by delicious dishes typical of Osaka 
such as takoyaki, okonomiyaki, teppanyaki,...and attractions such as Osaka castle, Dotonbori street,...
The North Zone is Osaka of busy neighborhood with a focus on the Umeda area around Osaka Station. There is a very developed metro transport network here, 
known as the neighborhood that produces the latest trends in fashion, art,..."Grand Front Osaka" opened in 2013 as a commercial building. next to Osaka station.
With 266 stores, you can comfortably shop in a space with nature. The southern area is an area with a busy neighborhood spread out with the focus on Namba.
This is a very attractive neighborhood with Dotonbori having restaurants, amusement parks or Shinsaibashi as a cultural center for young people.', CAST(1739 AS Decimal(10, 0)), 4, 5, N' HCM - NARITA - ITAMI (Lunch on the plane, dinner);
- You are present at Tan Son Nhat airport, the tour guide will guide you to check in for flight JL750 (08:00-15:35) to Narita (Tokyo), continue you to take flight JL3005 (16). :55-18:15) go to Itami (Osaka).;
- Delegation to Itami International Airport (Osaka), you do immigration procedures and receive luggage. Car and local guide welcome the group to have dinner at the restaurant.;
- Check in hotel and rest. Overnight in Osaka.;
/OSAKA – KOBE – KYOTO – TSU (Three Meals);
- Breakfast at the hotel, check out procedures. Depart to visit:;
+ Osaka Castle - an ancient castle with winding moats around. This structure is the pride of the people of Osaka (photo taken outside).;
- Continue to depart for Kobe to visit:;
+ Kobe Tower (Kobe Port Tower);
+ Kobe Harborland - is a commercial complex located in front of Osaka Bay, reconstructed from an old factory. Currently, this complex includes many establishments such as Umie, Umie Mosaic or Kobe Renga Soko, in addition to a series of shopping, entertainment, restaurants and hotels.;
- Lunch at the restaurant, you will enjoy the famous Kobe beef. Then Depart to Kyoto to visit: ;
+ Golden Temple (Golden Pavilion Temple) - Kinkakuji Temple - the whole temple was inlaid with gold leaf between the emerald lake.;
+ Shopping at Aeon Mall (if you have time).;
- Dinner at restaurant, check in hotel and rest. Overnight in Tsu.;
/TSU – GAMAGORI – SHIZOUKA – FUJI/HAKONE (Three Meals);
- Morning: Have breakfast.;
+ You visit FUJI city: Ponagar Tower: a work of the largest scale and plays an important sakura role in the history of Cham religious architectural art.;
+ FUJI Pagoda: the most famous temple in FUJI. The top of the hill is the statue of Kim Than Buddha (also known as the white Buddha) sitting in a lecture, the statue is 21m high, the lotus base is 7m high;
+ The stone church (Christian King Cathedral) with sakura unique architecture in TOKYO style.;
- Noon: Have lunch.;
+ Sightseeing, shopping for specialties at TOKYO commercial center. You are free to visit.;
- Afternoon: Have dinner.;
+ Overnight in TOKYO.;
/TOKYO – ODAIBA - HANEDA – HCMC (Breakfast, Lunch);
- Breakfast at the hotel, check out procedures. Depart to visit:;
+ Asakusa Kannon Temple - the most sacred temple in Tokyo, where major national festivals take place along with the legend of the mysterious temple.;
+ Sightseeing and shopping at Nakamise Arcade shopping streetlocated in the temple grounds - is one of the oldest shopping streets in Japan, with a length of about 250m extending from the Kaminarimon gate of Senso-ji Temple to Hozomon. On this street, there are small items with Japanese style such as Edo period toys, bows, fan hairpins; or street foods like Ningyoyaki, Kaminari Okoshi. The famous shops of the Edo period old town line one after another, the lanterns and seasonal decorations in front of the shops, the cobblestone street that extends from the Kaminarimon gate to the Hozomon gate... A Japanese-style street.;
+ Tokyo Sky Tree TV Tower – From the temple, you can see and take pictures of the whole tower.;
- Have lunch at a restaurant, continue to visit:;
+ Sightseeing and shopping at Akihabara electronics market .;
+ Odaiba Bay - visit and take pictures at the panoramic view of Odaiba Bay at night such as Odaba coastal park, Rainbow bridge connecting Odaiba bay and Tokyo, Statue of Liberty - a symbolic copy of New York approved by the French government brought to celebrate the French year in Japan, Tokyo Big Sight exhibition center, AquaCity Odaiba, Especially, you can take pictures with Giant Robot Gumdam… (if you have time);
- Have dinner at the restaurant. Until now, the delegation moved to Haneda airport, took flight JL079 (01:25-05:15).to Ho Chi Minh City. Arriving at Tan Son Nhat airport, after receiving the luggage, the tour guide bids you farewell and see you in the following programs.;', 0, CAST(1739 AS Decimal(10, 0)), 0, 0, N'135.5150089651886, 34.70960866437231', N'140.36362951460225, 35.81653150221384, 135.52998061565725, 34.69169372774142, 138.72619862018786, 35.36656574740686, 139.77684730159925, 35.718240852556136')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (8, 7, 2, N' Auckland', N'he diverse cultural mix gives the city a vibrant and rich identity with many museums, galleries, festivals and countless events that reflect its diversity. ', N'With a population of around 1.5 million, New Zealands largest city and gateway to exploring all of the rest and welcoming around 70% of all visitors to the country. The diverse cultural mix gives the city a vibrant and
rich identity with many museums, galleries, festivals and countless events that reflect its diversity. Unlike any other city in the world, Auckland was built from a field of active volcanoes. There are 50 volcanoes 
scattered throughout the city, and these are all stimulating yet safe destinations for visitors to admire the city and its yacht mooring harbor. The beaches embracing both the east and west coasts make this place not only 
an attractive destination in the summer but also in the winter. Not only that, but this is also a great high jump point for those traveling on a campervan to explore landscapes from the north or the Coromandel peninsula to the east. 
You can sample food, wine, craft beer and experience the nightlife at Ponsonby, Wynyard Quarter, Britomart or Viaduct, home to countless new bars, restaurants and clubs. There are many shops located right in front of you. 
Hop on a ferry to Waiheke for a chance to visit lots of fine wineries, or head to Rangitoto to climb a cooled crater. Both islands lie in the middle of Hauraki Bay, completely within view of Auckland.
Visit the Auckland Museum of Art, the Museum of Transport & Technology, or the Auckland Memorial Museum for a taste of Indigenous, colonial and Pacific history, culture and art.', CAST(2700 AS Decimal(10, 0)), 4, 1, N' HANOI – MELBOURNE;
- Tour guide picks you up at Noi Bai airport, procedures for flight to Melbourne . You stay overnight on the plane.;
/ MELBOURNE – MELBOURNE Zoo - AUCKLAND;
- After breakfast, the car picks you up to visit Melbourne Zoo , Australias largest zoo, including more than 320 animals living in Australia such as Kangaroo, Emu, Koala, Dingo and many animals brought from other countries. such as: lion, tiger, leopard, giraffe from Africa; Panda white bears come from China and many species are being preserved from extinction.;
At the same time, Melbourne Zoo also has a recovery center for rare animals and endangered species. These species come from Africa and Asia.;
- You will see the animals being cared for very carefully by the experienced staff of Melbourne Zoo.;
- Group lunch at the restaurant . The car takes you to the airport for a flight to Auckland - New Zealand. ;
- Arrive in Auckland, the car picks up the delegation to check in the hotel, have dinner, and stay overnight at the hotel in Auckland;
/ AUCKLAND – SYDNEY ;
- After breakfast at the hotel, the car takes you to the airport for a flight to Sydney city, to Sydney, the car takes you to have lunch at a restaurant. ;
- Afternoon: Start the program to explore Sydney city with beautiful scenes such as:  ;
+ Queen Victoria Building,;
+ Botanic Gardens - Botanic Gardens,;
+ Sydney Opera House - symbol of Sydney,;
+ Darling Harbor Jetty,;
+ Mrs. Macquaries Chair,;
+ The Rocks - Historic cape and panoramic view of the city. ;
- Evening: Dinner at the restaurant. You stay overnight at the hotel. ;
/SYDNEY – HANOI;
- After breakfast, you check out and depart for the airport for a flight back to Vietnam.;', 10, CAST(2430 AS Decimal(10, 0)), 0, 0, N'174.76128773644797, -36.85058336426201', N'144.94630159384488, -37.828904150310606, 174.7344322566558, -36.860634769190284, -33.871597268314844, 151.2072227821072, 151.19713027081974, -33.85339447477942')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (12, 5, 2, N' Paris', N'Paris is divided into four distinct seasons. The best tourist season is from late spring (April) to early summer (June) and around autumn because this is the best time ', N'Paris is divided into four distinct seasons. The best tourist season is from late spring (April) to early summer (June) and around autumn because this is the time when Paris "shows off" the best of this city. 
If you come to Paris in the spring, you will definitely love the romantic beauty of this place, this season is also the favorite season of the French. Like spring in every other country, spring in France is filled 
with flowers all over the streets, on balconies and in every little house. You will see Paris appear like a familiar movie: People wearing thin robes, sitting at outdoor cafes enjoying a cup of coffee while looking at the street.
In summer, the weather is pleasant, the hottest is only up to 32 °C because this is a temperate country. At this time, people often gather at public swimming pools, artificial seas to soak in the water, to sunbathe and enjoy cool
drinks to dispel the heat. Only one drawback is that tourists flock to this season very crowded. Next to autumn, the weather is cooler than summer, sometimes there will be rain, so in general, the weather is humid and a bit cold. 
Therefore, if you travel in the fall, you should also prepare a thick coat and umbrella in case it suddenly rains. In winter, the temperature will be quite harsh for people from tropical countries like us because during the day, 
it is quite cloudy, the day is cold. ', CAST(1740 AS Decimal(10, 0)), 4, 1, N' HCMC - PARIS (Eating on the plane);
- You gather at the airport. HDV picks you up at Tan Son Nhat International Airport, procedures for flight to Paris. Snack and overnight on the plane. (Transit depending on the airline);
/ PARIS – CITY TOUR (Lunch, Dinner);
- Arrive at Paris International Airport, depart to visit:
+ Arc De Triomphe - a historical symbol of France.
+ Concorde Square - one of the 10 most famous squares in the world. This is the place that gathers many historical monuments and the most magnificent architectural works in Paris.
+ Notre Dame Cathedral: a famous tourist attraction in Paris associated with the story "The Hunchback of Notre Dame".
- Have lunch, then visit & take pictures at the foot of the Eiffel Tower: to record unforgettable images with the symbol of France. Take a boat trip on the romantic Seine river, admire the magnificent city of Paris.
- After dinner, you return to the hotel to rest.
/ PARIS – LUXEMBOURG (Three meals) ;
- You have breakfast and check out. Depart for the beautiful city of Luxembourg - the capital of the Grand Duchy of Luxembourg. Then visit:
+ DArme Square .
+ Take pictures of the Grand Ducal Palace and the Old Quarter - feel the peace and multiculturalism of the land straddling the European-Roman and German-European cultural border.
- Have dinner and check in hotel overnight in Luxembourg.
/ LUXEMBOURG - FRANFURT - HCMC (Breakfast, Lunch);
- After breakfast you check out, the car will take you to Frankfurt - the commercial center of Germany, the important fair city in the world. Visit the Frankfurt Cathedral built in 852 and the Banking and Finance District.
- You have lunch then free to visit until the appointment time, car and tour guide take you to the airport for flight to Vietnam. 
- Arrive in Vietnam – end of the program. See you later.', 15, CAST(1479 AS Decimal(10, 0)), 0, 0, N'2.35287755537782, 48.89606444041092 ', N'2.345558897074439, 48.88685988203424, 2.296526415691078, 48.85673492009218, 6.105437196607668, 49.61124694117077, 8.681436604782052, 50.111405258077355')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (14, 6, 2, N' London', N'The spring to visit the magnificent and ancient capital of London. If you are a shopaholic, then come to England, especially when you travel to London. ', N'The spring to visit the magnificent and ancient capital of London. If you are a shopaholic, then come to England, especially when you travel to London, you will find all the fashion 
stores that meet your needs. Until now, London is still known as the center of the largest concentration of leading consumer brands in the world. Besides, go on a spring tour of 
EnglandVisitors will be set foot through legendary & peaceful cities such as Cotswolds, a small town with interesting stone houses, Stratford Upon Avon home of famous writer
William Shakespeare. Or the tourist city of Manchester - known as a prosperous and developed city in all fields, this is a city famous for two famous football teams in the world
Manchester United and Manchester City. Each place in the UK has its own beauty. Before the end of the program, our delegation visited Brunei - a famous place rich in oil & gold. 
The UK tour  with Brunei or the UK Brunei 7 Days 6 Nights tour will be one of the most interesting tours that you will never forget atVietnam Travel .', CAST(1800 AS Decimal(10, 0)), 6, 1, N' VIETNAM  - LONDON (on plane);
- You gather at the airport, HDV Vietnam Travel company helps you do airline procedures for transit flights in Brunei. Arriving in Brunei, the car takes you to visit and take pictures outside some famous places in Brunei such as:;
+ Jame Asr Mosque - the mosque of Saint Ali and Saint James of Islam in Brunie;
+ Israna Nurul Iman Palace - in Arabic means "Palace of the Light of the Saints". This is the largest Royal Palace in the world today…;
- Then the group continued to connect flight to London. You eat, rest on the plane.;
/ LONDON - CITY TOUR (Lunch, Afternoon);
- 06h25: Delegation to London Heathrow airport. The bus will take you to the center of London to visit and take pictures outside some typical works: ;
+ The Palace of Westminster or London Houses of Parliament is where the two houses of Parliament hold meetings. ;
+ Big Ben clock tower - 96m high, located in the complex of Westminster Palace on the banks of the River Thame (renovating expected until 2021);
+ Parliament Square .;
+ Until now, London tourism is still known as the center of the largest concentration of leading consumer brands in the world. Therefore, freely shopping here, you will find all the fashion stores that meet your needs. ;
/ LONDON - OXFORD - MANCHESTER (Three meals);
- The group has breakfast in the morning, check-out procedures, depart for Oxford City. Upon arrival, the group had lunch and then visited the outside:;
+ The University of Oxford is the oldest and most famous in the world;
+ Oxford Castle;
+ Ashmolean Museum - the worlds first university museum;
+ Christ Church University;
+ Church of Santa Maria ...;
- Continue, depart to Manchester - the second largest city in England and is known as the "Capital of the North of England".;
- After lunch, visit the famous attractions here: ;
+ Take a tour inside Old Trafford Stadium or the Theater of Dreams, which is the home ground of football club Manchester United.;
- Dinner and overnight at hotel in Manchester.;
/  MANCHESTER - STRATFORD UPON AVON (Eat three meals);
-After breakfast, the group will check out. The delegation continued to visit a city tour Manchester:;
+ Albert Square;
+ Manchester City Hall;
+ Manchester Cathedral - is a medieval church, has ten bells in the church tower cast in 1925 by Gillett & Johnston and rings the bells on Sunday mornings and special occasions Manchester theatre, China Town…;
- After that, the group continued the journey to Stratford Upon Avon - where the great playwright William Shakespeare was born and also his final resting place.;
- Have lunch, then visit and take pictures at Holy Trinity Church , Nashs house - the house of Shakespeares grandson. Next to Nashs house, there is a rather large and beautiful flower garden, in the middle of the garden there is a stele stating: This was once a house of Shakespeare.;
- Dinner, check-in and overnight at Straford Upon Avon.;
/  STRATFORD UPON AVON - COTSWOLDS - LONDON - BRUNEI AIRPORT (Breakfast, lunch, dinner on the plane);
- Delegation breakfast. The bus takes you back to London, on the way to visit the Cotswolds - a complex of beautiful small towns and pleasant cool villages along with extremely fancy and unique stone houses. . Continue back to London for lunch, then depart to the airport for Brunei flight BI 004 at (17:55 – 14:35 + 1) .;
/TO BRUNEI - VIETNAM ;
- 14h35: Arrive in Brunei, you continue to connect to Vietnam at 18:50. Arriving at the airport, after completing immigration procedures to Vietnam & receiving personal luggage, the head of the Vietnamese tour group bids you farewell. End of tour.;
', 0, CAST(1800 AS Decimal(10, 0)), 0, 0, N'-0.12838350516407102, 51.51659566067253', N'-0.1250749976450482, 51.50266986068257, -0.14305028789655344, 51.50289821165239, -1.259707513674539, 51.7555972584516, -1.2675911726725428, 51.7580992172283, -1.8433622456862755, 51.83306422937963, 114.5470950119866, 4.621301456988099')
INSERT [dbo].[tour] ([tourID], [nationID], [typologyID], [tourName], [shortDesc], [descr], [price], [duration], [rating], [schedule], [discount], [priceDiscount], [numberBooking], [numberFeedback], [coordinate], [scheduleCoordinate]) VALUES (15, 2, 4, N' Tibet', N'Autumn Tibet  Travel - Tay Tang is towering over the globe, with vast steppes thousands of kilometers away from us, with twists and turns that are hard to forget. ', N'Along Travel Vietnam explore Fall Tibet. There are places that have come many times back and forth, leaving without regret. There are lands that meet for the first time, surprised by contact 
and parting, and suddenly feel nostalgic. Autumn Tibet  Travel - Tay Tang is towering over the globe, with vast steppes thousands of kilometers away from us, with twists and turns that are hard 
to forget. The rolling mountains, the strange customs and habits, along with the solid religious beliefs, the gentle and spontaneous people. Autumn Tibet tour with Vietnam Travel you will have the 
opportunity to explore Sera Monastery called "Sera Mahayana Temple"  It is one of the six main temples of the Gelug Sect of Tibetan Buddhism. Along with Drepung Monastery and Ganden Monastery, 
these are the three major temples in Lhasa. The oldest temple was built in three large temples. Sera Monastery is a national key cultural relic protection unit. Located in the northern foothills
of Lhasa, it lies in the foothills of Sera, and is surrounded by willow forests. Since ancient times, this is where Buddhist monks lived.', CAST(1700 AS Decimal(10, 0)), 5, 1, N'  HCMC - CITY - LHASA (Breakfast, lunch on the plane, dinner);
You gather at Tan Son Nhat airport, gate 2 - international terminal, check in for a flight to Lhasa, transit in Chengdu on flight 3U84480 (04:30-09:05) and flight 3U8695 (11:50 – 14:15) of Sichuan Airlines.;
In the afternoon, the car and local guide will pick up the delegation to the hotel to rest to adapt to the height of 3600m.;
Group dinner and free to explore Lhasa at night.;
Overnight at INTERCONIENTAL hotel or similar.;
Note: Avoid the case of altitude sickness, you should limit the use of stimulant drinks such as alcohol, coffee .. should drink a lot of water.;
/ POTALA Palace – NORBULINGKA (Eat three meals);
- After breakfast, depart to visit:;
+ Potala Palace - the holiest and most massive religious architecture in Tibet. Potala was started construction in the 7th century, and was restored by the 5th Dalai Lama after the destruction of historical upheavals. This restoration took 50 years to complete on a huge scale. The palace is 117 meters high, including 13 floors, occupying an area of ????about 130,000 square meters. Palace building materials are mainly earth, stone and wood which are transported manually. Up to now, more than 6 centuries, Potala has not been damaged by any changes.;
+ Dai Chieu sacred temple ( JoKhang Temple ), is a Buddhist tantric temple in the center of Lhasa old town, included in UNESCOs world heritage list since 2000 in Lhasa, is a famous temple in Barkhor.;
+ Group lunch at local restaurant. Then continue to visit:;
+ Norbulingka Summer Palace (La Bo Lam Khai). In Tibetan, Norbulingka means "garden of gems". The palace was built in the 18th century, where the Dalai Lama often hangs out in the summer. This is also home to the largest and most beautiful royal garden in the historical sites in Tibet.;
+ Sera Monastery known as "Sera Mahayana Temple"  is one of the six main temples of the Gelug Sect of Tibetan Buddhism. Along with Drepung Monastery and Ganden Monastery, these are the three major temples in Lhasa. The oldest temple was built in three large temples. Sera Monastery is a national key cultural relic protection unit. Located in the northern foothills of Lhasa, it lies in the foothills of Sera, and is surrounded by willow forests. Since ancient times, this is where Buddhist monks lived. ;
+ Group have dinner and free to explore Lhasa to bring.;
+ Overnight at INTERCONTINENTAL Hotel or similar;
/ LHASA - SHIGATE (Three meals);
- Have breakfast at Hotel. Depart for Shigate - the second largest city of Tibet. On the way, you can see the majestic landscape. Visiting group:;
+ Yamdrok Sacred Lake - this is a lake located more than 100km northeast of Lhasa. ;
+ Farewell to Lake Yamdrok, the group had lunch and the car took the group over;
+ Karola Eternal Glacier: At an altitude of 4960m, from a distance, Karola Glacier looks like an erupting volcano but lava is replaced by white snow dunes. ;
+ Palkhor Monastery : built in 1418, is a monastery with architectural features of the Han, Tibetan and Nepalese. ;
+ In the history of Tibet, there was disagreement between these three schools. But since the founding of Palkhor Monastery nearly 600 years ago, the three sects have coexisted based on mutual respect and shared doctrines, thus making Palkhor Monastery a place of peace and freedom. in. ;
+ Group dinner and overnight at Shigate ;
+ Overnight at 4 * Hotel - QIAOMULANGZONG or equivalent (because this area does not have 5 * international standard hotels, so the group will sleep at 4 * hotels).;
/  LHASA – CANH DO (Breakfast, lunch, dinner on the plane) ;
- Breakfast at the hotel, check out procedures, depart for sightseeing:;
+ Barkhor Street -  located close to Dai Chieu Temple, this is considered a market of the Tibetans, where many products and items of the land of Tibet are displayed, all showing a mysterious beauty, with a strange attraction to people. with viewers. ;
+ Group have lunch, then HDV take the delegation to Lhasa airport for flight 3U8720 (16:40-19:05)  to Chengdu (You stay at Chengdu airport 5h) ;
/  CITY - HO CHI MINH CITY ;
- The delegation continued to take flight 3U8447 (00:55 ~ 03:30)  to Ho Chi Minh City. End of tour program. The delegation bid farewell, see you again in the next journey of Vietnam Tourism.;', 10, CAST(1530 AS Decimal(10, 0)), 0, 0, N'91.1418826095198, 29.649935512392407', N'91.17937908719605, 29.7144072632149, 91.11910491084905, 29.655634034896515, 88.95644164697289, 29.342985425996453, 91.02363939506694, 29.6786169566231, 104.12566282887131, 30.71336991712082')
SET IDENTITY_INSERT [dbo].[tour] OFF
SET IDENTITY_INSERT [dbo].[tourBooking] ON 

INSERT [dbo].[tourBooking] ([tourBookingID], [accountID], [tourID], [bookDate], [scheduleDate], [bookStatus]) VALUES (1, 1, 1, CAST(N'2021-06-05T20:45:00' AS SmallDateTime), CAST(N'2021-06-08T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[tourBooking] ([tourBookingID], [accountID], [tourID], [bookDate], [scheduleDate], [bookStatus]) VALUES (4, 2, 5, CAST(N'2021-06-07T16:44:00' AS SmallDateTime), CAST(N'2021-06-20T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[tourBooking] ([tourBookingID], [accountID], [tourID], [bookDate], [scheduleDate], [bookStatus]) VALUES (5, 2, 2, CAST(N'2021-06-07T20:46:00' AS SmallDateTime), CAST(N'2021-06-10T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[tourBooking] ([tourBookingID], [accountID], [tourID], [bookDate], [scheduleDate], [bookStatus]) VALUES (15, 2, 3, CAST(N'2021-06-24T12:30:00' AS SmallDateTime), CAST(N'2021-06-26T00:00:00' AS SmallDateTime), 3)
SET IDENTITY_INSERT [dbo].[tourBooking] OFF
SET IDENTITY_INSERT [dbo].[tourImage] ON 

INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (33, 1, N'https://i.ibb.co/QXdXGXc/Ha-Long-Bay-Cover-Img.jpg', N'Ha Long Bay cover image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (34, 1, N'https://i.ibb.co/LgxkY3g/Ha-Long-Bay-Gallery-1.jpg', N'Ha Long Bay gallery image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (35, 1, N'https://i.ibb.co/rFkWr1y/Ha-Long-Bay-Gallery-2.jpg', N'Ha Long Bay gallery image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (36, 1, N'https://i.ibb.co/qJ6qbcj/Ha-Long-Bay-Gallery-3.jpg', N'Ha Long Bay gallery image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (37, 1, N'https://i.ibb.co/TRsGNJp/Ha-Long-Bay-Gallery-4.jpg', N'Ha Long Bay gallery image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (38, 2, N'https://i.ibb.co/S76gNFS/Sapa-Cover-Image.jpg', N'Sapa Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (39, 2, N'https://i.ibb.co/FHPtVqr/Sapa-Gallery-1.jpg', N'Sapa Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (40, 2, N'https://i.ibb.co/PC2gQzn/Sapa-Gallery-2.jpg', N'Sapa Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (41, 2, N'https://i.ibb.co/D5M3WNS/Sapa-Gallery-3.jpg', N'Sapa Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (42, 2, N'https://i.ibb.co/VS7t8DL/Sapa-Gallery-4.jpg', N'Sapa Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (44, 3, N'https://i.ibb.co/PhX7kCH/Quang-Ninh-Gallery-1.jpg', N'Quang Ninh Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (45, 3, N'https://i.ibb.co/qm0BC9X/Quang-Ninh-Gallery-2.jpg', N'Quang Ninh Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (46, 3, N'https://i.ibb.co/gVzHdrD/Quang-Ninh-Gallery-3.jpg', N'Quang Ninh Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (47, 3, N'https://i.ibb.co/CnQ65dh/Quang-Ninh-Gallery-4.jpg', N'Quang Ninh Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (48, 3, N'https://i.ibb.co/h1cTxxX/Quang-Ninh-Cover-Image.jpg', N'Quang Ninh Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (49, 4, N'https://i.ibb.co/0pLQQSV/Da-Nang-Cover-Image.jpg', N'Da Nang Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (50, 4, N'https://i.ibb.co/71XQLdL/Da-Nang-Gallery-Image-1.jpg', N'Da Nang Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (51, 4, N'https://i.ibb.co/Y2BGK28/Da-Nang-Gallery-Image-2.jpg', N'Da Nang Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (52, 4, N'https://i.ibb.co/Hr0xScw/Da-Nang-Gallery-Image-3.jpg', N'Da Nang Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (53, 4, N'https://i.ibb.co/3BhGZZ1/Da-Nang-Gallery-Image-4.jpg', N'Da Nang Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (54, 5, N'https://i.ibb.co/kKQMqL8/Nha-Trang-Cover-Image.jpg', N'Nha Trang Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (55, 5, N'https://i.ibb.co/0ZFSQqq/Nha-Trang-Gallery-Image-1.jpg', N'Nha Trang Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (56, 5, N'https://i.ibb.co/xHnDCLR/Nha-Trang-Gallery-Image-2.png', N'Nha Trang Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (57, 5, N'https://i.ibb.co/DPXPpMb/Nha-Trang-Gallery-Image-3.jpg', N'Nha Trang Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (58, 5, N'https://i.ibb.co/JdKMHxq/Nha-Trang-Gallery-Image-4.jpg', N'Nha Trang Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (59, 6, N'https://i.ibb.co/7R0stDp/Tokyo-Cover-Image.jpg', N'Tokyo Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (60, 6, N'https://i.ibb.co/DgjLrQq/Tokyo-Gallery-Image-1.jpg', N'Tokyo Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (61, 6, N'https://i.ibb.co/KK1vJRk/Tokyo-Gallery-Image-2.jpg', N'Tokyo Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (62, 6, N'https://i.ibb.co/c1Ftv0f/Tokyo-Gallery-Image-3.jpg', N'Tokyo Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (63, 6, N'https://i.ibb.co/kXnWH5t/Tokyo-Gallery-Image-4.jpg', N'Tokyog Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (64, 7, N'https://i.ibb.co/1dfm45g/Osaka-Gallery-Image-3.jpg', N'Osaka Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (65, 7, N'https://i.ibb.co/xFTHKXj/Osaka-Gallery-Image-1.jpg', N'Osaka Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (66, 7, N'https://i.ibb.co/hf9FWCh/Osaka-Gallery-Image-2.jpg', N'Osaka Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (67, 7, N'https://i.ibb.co/1dfm45g/Osaka-Gallery-Image-3.jpg', N'Osaka Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (68, 7, N'https://i.ibb.co/wB2z6pP/Osaka-Gallery-Image-4.jpg', N'Osaka Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (69, 8, N'https://i.ibb.co/nkvTysM/Auckland-Gallery-Image-1.jpg', N'Auckland Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (70, 8, N'https://i.ibb.co/nkvTysM/Auckland-Gallery-Image-1.jpg', N'Auckland Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (71, 8, N'https://i.ibb.co/SR7wFKZ/Auckland-Gallery-Image-2.jpg', N'Auckland Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (72, 8, N'https://i.ibb.co/BBzRWq2/Auckland-Gallery-Image-3.jpg', N'Auckland Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (73, 8, N'https://i.ibb.co/VtSxkq2/Auckland-Gallery-Image-4.jpg', N'Auckland Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (74, 12, N'https://i.ibb.co/6FbtNg9/Paris-Gallery-Image-2.jpg', N'Paris Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (75, 12, N'https://i.ibb.co/ChCQtPz/Paris-Gallery-Image-1.jpg', N'Paris Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (76, 12, N'https://i.ibb.co/6FbtNg9/Paris-Gallery-Image-2.jpg', N'Paris Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (77, 12, N'https://i.ibb.co/0jGgmqg/Paris-Gallery-Image-3.jpg', N'Paris Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (78, 12, N'https://i.ibb.co/tYjQ834/Paris-Gallery-Image-4.jpg', N'Paris Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (79, 14, N'https://i.ibb.co/XtRyXsC/London-Cover-Image.jpg', N'London Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (80, 14, N'https://i.ibb.co/LRFRX8f/London-Gallery-Image-1.jpg', N'London Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (81, 14, N'https://i.ibb.co/LvPsb7R/London-Gallery-Image-2.jpg', N'London Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (82, 14, N'https://i.ibb.co/2dzHhgx/London-Gallery-Image-3.jpg', N'London Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (83, 14, N'https://i.ibb.co/hW4q5JJ/London-Gallery-Image-4.jpg', N'London Gallery Image 4', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (84, 15, N'https://i.ibb.co/ZVvmZGT/Tibet-Cover-Image.jpg', N'Tibet Cover Image', 0)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (85, 15, N'https://i.ibb.co/jJp8RWk/Tibet-Gallery-Image-1.jpg', N'Tibet Gallery Image 1', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (86, 15, N'https://i.ibb.co/0G6pxQ7/Tibet-Gallery-Image-2.jpg', N'Tibet Gallery Image 2', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (87, 15, N'https://i.ibb.co/wcnD3GX/Tibet-Gallery-Image-3.jpg', N'Tibet Gallery Image 3', 1)
INSERT [dbo].[tourImage] ([tourImageID], [tourID], [imageURL], [tourImageName], [imageRole]) VALUES (88, 15, N'https://i.ibb.co/64GSbb0/Tibet-Gallery-Image-4.jpg', N'Tibet Gallery Image 4', 1)
SET IDENTITY_INSERT [dbo].[tourImage] OFF
SET IDENTITY_INSERT [dbo].[typology] ON 

INSERT [dbo].[typology] ([typologyID], [typologyName]) VALUES (1, N'Relax')
INSERT [dbo].[typology] ([typologyID], [typologyName]) VALUES (2, N'Cultural')
INSERT [dbo].[typology] ([typologyID], [typologyName]) VALUES (3, N'History')
INSERT [dbo].[typology] ([typologyID], [typologyName]) VALUES (4, N'Adventure')
SET IDENTITY_INSERT [dbo].[typology] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__AB6E6164F0307CF0]    Script Date: 7/4/2021 10:26:07 AM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__F3DBC5726CC54821]    Script Date: 7/4/2021 10:26:07 AM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unTour]    Script Date: 7/4/2021 10:26:07 AM ******/
ALTER TABLE [dbo].[tour] ADD  CONSTRAINT [unTour] UNIQUE NONCLUSTERED 
(
	[tourName] ASC,
	[nationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ucCodes]    Script Date: 7/4/2021 10:26:07 AM ******/
ALTER TABLE [dbo].[tourBooking] ADD  CONSTRAINT [ucCodes] UNIQUE NONCLUSTERED 
(
	[accountID] ASC,
	[bookDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ('https://i.ibb.co/t42CQhf/profile-default.png') FOR [avatar]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((1)) FOR [accountRole]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ('') FOR [socialMediaLink]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ((0)) FOR [numberBooking]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ((0)) FOR [numberFeedback]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ('') FOR [coordinate]
GO
ALTER TABLE [dbo].[tour] ADD  DEFAULT ('') FOR [scheduleCoordinate]
GO
ALTER TABLE [dbo].[tourBooking] ADD  DEFAULT (getdate()) FOR [bookDate]
GO
ALTER TABLE [dbo].[tourBooking] ADD  DEFAULT ((1)) FOR [bookStatus]
GO
ALTER TABLE [dbo].[tourImage] ADD  DEFAULT ((1)) FOR [imageRole]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([tourBookingID])
REFERENCES [dbo].[tourBooking] ([tourBookingID])
GO
ALTER TABLE [dbo].[nation]  WITH CHECK ADD FOREIGN KEY([continentID])
REFERENCES [dbo].[continent] ([continentID])
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD FOREIGN KEY([nationID])
REFERENCES [dbo].[nation] ([nationID])
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD FOREIGN KEY([typologyID])
REFERENCES [dbo].[typology] ([typologyID])
GO
ALTER TABLE [dbo].[tourBooking]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[tourBooking]  WITH CHECK ADD FOREIGN KEY([tourID])
REFERENCES [dbo].[tour] ([tourID])
GO
ALTER TABLE [dbo].[tourImage]  WITH CHECK ADD FOREIGN KEY([tourID])
REFERENCES [dbo].[tour] ([tourID])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [AC_ROLE] CHECK  (([accountRole]=(1) OR [accountRole]=(0)))
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [AC_ROLE]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [star_feedback] CHECK  (([star]>=(0) AND [star]<=(5)))
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [star_feedback]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [discount_tour] CHECK  (([discount]>=(0) AND [discount]<=(100)))
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [discount_tour]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [rating_tour] CHECK  (([rating]>=(0) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [rating_tour]
GO
ALTER TABLE [dbo].[tourBooking]  WITH CHECK ADD  CONSTRAINT [status_tourBooking] CHECK  (([bookStatus]>=(1) AND [bookStatus]<=(4)))
GO
ALTER TABLE [dbo].[tourBooking] CHECK CONSTRAINT [status_tourBooking]
GO
ALTER TABLE [dbo].[tourImage]  WITH CHECK ADD  CONSTRAINT [imgTour_role] CHECK  (([imageRole]=(1) OR [imageRole]=(0)))
GO
ALTER TABLE [dbo].[tourImage] CHECK CONSTRAINT [imgTour_role]
GO
USE [master]
GO
ALTER DATABASE [levart] SET  READ_WRITE 
GO
