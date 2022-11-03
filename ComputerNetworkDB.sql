--deleting tables
DROP TABLE IF EXISTS PC CASCADE; 
DROP TABLE IF EXISTS Hardware CASCADE; 
DROP TABLE IF EXISTS Software CASCADE; 
DROP TABLE IF EXISTS Installation CASCADE; 
DROP TABLE IF EXISTS Room CASCADE; 
DROP TABLE IF EXISTS Employee CASCADE; 
--creating tables
CREATE TABLE PC(ID serial PRIMARY KEY, brand varchar(15), cpu varchar(5) , ram smallint, rom smallint, hostnam varchar(15), ipaddr cidr, macaddr macaddr, room_num varchar(5), note varchar(100));
CREATE TABLE Hardware(ID serial PRIMARY KEY, typ varchar(15), brand varchar(15), mod varchar(30), quant smallint);
CREATE TABLE Software(ID serial PRIMARY KEY, nam varchar(20), corp varchar(15) NULL, typ varchar(15), ver varchar(30), licens varchar(5) NULL, quant varchar(5) NULL);
CREATE TABLE Installation(ID serial, pc_id smallint, hard_id smallint, soft_id smallint, dat date);
CREATE TABLE Room(num varchar(5) PRIMARY KEY, floor smallint, pc_quant smallint, emp_passp bigint);
CREATE TABLE Employee(lnam varchar(20), fnam varchar(20), mnam varchar(20), sex varchar(10), ag smallint, passp bigint PRIMARY KEY, phon varchar(15), posit varchar(25));
ALTER TABLE PC ADD FOREIGN KEY(room_num) REFERENCES Room(num);
--adding foreign keys to the tables
ALTER TABLE Installation ADD FOREIGN KEY(pc_id) REFERENCES PC(ID);
ALTER TABLE Installation ADD FOREIGN KEY(hard_id) REFERENCES Hardware(ID);
ALTER TABLE Installation ADD FOREIGN KEY(soft_id) REFERENCES Software(ID);
ALTER TABLE Room ADD FOREIGN KEY(emp_passp) REFERENCES Employee(passp);
--inserting data into the tables
INSERT INTO Employee VALUES('Kolinko', 'Roman', 'Alexandrovich', 'Male', 18, 4017937505, '8 921 867-74-42', 'Database administrator'),
                                                            ('Trofimova', 'Milana', 'Dmitrievna', 'Female', 32, 4390651310, '7 948 315-35-67', 'Programmer'),
                                                            ('Ovsyannikova', 'Ekaterina', 'Semenovna', 'Female', 43, 4234354559, '7 951 814-38-56', 'System administrator'),
                                                            ('Kazakov', 'Svyatoslav', 'Daniilovich', 'Male', 21, 9328104562, '7 976 149-94-22', 'Programmer'),
                                                            ('Kalinin', 'Aleksandr', 'Nikolaevich', 'Male', 21, 2143644467, '7 949 283-41-62', 'System administrator'),
                                                            ('Barsukov', 'Dmitriy', 'Kirillovich', 'Male', 45, 9449123443, '7 924 864-40-36', 'System administrator'),
                                                            ('Volkov', 'Daniil', 'Maksimovich', 'Male', 60, 4325688890, '7 995 382-78-47', 'System administrator'),
                                                            ('Borisova', 'Miroslava', 'Vladislavovna', 'Female', 32, 7744122345, '7 921 516-58-16', 'Technician'),
                                                            ('Pozdnyakova', 'Adelina', 'Makarovna', 'Female', 57, 4235554442, '7 968 207-27-49', 'Technician'),
                                                            ('Belyaeva', 'Olga', 'Ivanovna', 'Female', 19, 8753299012, '7 992 773-19-98', 'System administrator'); 
INSERT INTO Room VALUES('1', 3, 2, 4017937505),
                                                      ('400', 4, 1, 7744122345),
                                                      ('400A', 4, 1, 2143644467),
                                                      ('204', 2, 6, 8753299012),
                                                      ('304', 3, 10, 4390651310),
                                                      ('309', 3, 1, 7744122345),
                                                      ('400B', 4, 1, 4325688890),
                                                      ('207', 2, 1, 4234354559),
                                                      ('401', 4, 1, 8753299012),
                                                      ('403', 4, 1, 9328104562),
                                                      ('310', 3, 1, 9328104562),
                                                      ('311', 3, 1, 4235554442),
                                                      ('215A', 2, 1, 4325688890),
                                                      ('217', 2, 1, 7744122345),
                                                      ('228', 2, 1, 9449123443);
INSERT INTO PC(brand, cpu, ram, rom, hostnam, ipaddr, macaddr, room_num, note) VALUES('ASUS', 'Intel', 8, 256, 'romankolinPC', '192.168.0.104', '18:C0:4D:F9:95:67', 1, 'Excellent condition'),
                                                                                                                                                             ('HUAWEY', 'Intel', 8, 256, 'romankolinUB', '192.168.0.107', '70:32:17:CD:71:B1', 1, 'Excellent condition'),
                                                                                                                                                             ('HONOR', 'Intel', 8, 128, 'rPC', '192.168.0.101', '28:C8:96:1E:65:FE', 304, 'Good condition'),
                                                                                                                                                             ('Hewlett-Packard', 'AMD', 8, 256, 'rUB', '192.168.0.102', '03:D7:99:7F:36:EF', 304, 'Good condition'),
                                                                                                                                                             ('Apple', 'Intel', 16, 128, 'kPC', '192.168.0.103', '16:F3:75:5B:65:FF', 311, 'Require repair'),
                                                                                                                                                             ('Acer', 'AMD', 8, 256, 'kUB', '192.168.0.105', '19:E7:75:4F:77:DF', 204, 'Require repair'),
                                                                                                                                                             ('Apple', 'AMD', 32, 128, 'rkPC', '192.168.0.106', '01:B5:59:4C:56:FF', 401, 'Require inspection'),
                                                                                                                                                             ('Acer', 'Intel', 16, 512, 'rkUB', '192.168.0.108', '08:B6:86:8B:95:FE', 207, 'Good condition'),
                                                                                                                                                             ('ASUS', 'Intel', 4, 512, 'romanPC', '192.168.0.109', '02:D0:48:4C:78:FE', 400, 'Require inspection'),
                                                                                                                                                             ('Hewlett-Packard', 'AMD', 8, 256, 'romanUB', '192.168.0.110', '01:A6:99:6B:68:EF', 228, 'Good condition'),
                                                                                                                                                             ('ASUS', 'AMD', 8, 256, 'kolinPC', '192.168.0.111', '06:B2:95:6F:46:FF', '400B', 'Good condition'),
                                                                                                                                                             ('ASUS', 'Intel', 8, 256, 'kolinUB', '192.168.0.112', '21:C2:65:6F:37:DF', 217, 'Require inspection'),
                                                                                                                                                             ('HONOR', 'Intel', 8, 128, 'roman', '192.168.0.113', '08:B6:89:5B:78:FF', '215A', 'Require inspection'),
                                                                                                                                                             ('ASUS', 'Intel', 16, 128, 'kolin', '192.168.0.114', '04:F9:48:3D:68:EE', 204, 'Good condition'),
                                                                                                                                                             ('ASUS', 'Intel', 32, 256, 'romankolin', '192.168.0.115', '06:D4:46:7D:96:FF', 304, 'Require inspection'),
                                                                                                                                                             ('Apple', 'AMD', 8, 512, 'r', '192.168.0.116', '22:C9:46:6B:37:FF', 304, 'Good condition'),
                                                                                                                                                             ('Hewlett-Packard', 'Intel', 8, 256, 'k', '192.168.0.117', '17:E6:57:6F:77:EE', 304, 'Good condition'),
                                                                                                                                                             ('Acer', 'Intel', 8, 256, 'rk', '192.168.0.118', '09:F1:85:5E:58:DE', 304, 'Good condition'),
                                                                                                                                                             ('Hewlett-Packard', 'AMD', 8, 256, 'f', '192.168.0.119', '23:E9:65:3E:75:DF', 304, 'Good condition'),
                                                                                                                                                             ('HONOR', 'Intel', 32, 256, 'ff', '192.168.0.120', '03:D2:46:8D:55:FE', 204, 'Good condition'),
                                                                                                                                                             ('Acer', 'AMD', 8, 256, 'fff', '192.168.0.121', '26:F9:97:6D:67:FE', '400A', 'Good condition'),
                                                                                                                                                             ('Apple', 'Intel', 8, 128, 'ffff', '192.168.0.122', '00:D1:87:7B:76:FF', 304, 'Good condition'),
                                                                                                                                                             ('ASUS', 'Intel', 4, 128, 'fffff', '192.168.0.123', '06:E5:96:6D:45:EF', 304, 'Require repair'),
                                                                                                                                                             ('HONOR', 'Intel', 16, 128, 'ffffff', '192.168.0.124', '25:B4:46:7E:88:EE', 204, 'Require inspection'),
                                                                                                                                                             ('Hewlett-Packard', 'Intel', 8, 256, 'fffffff', '192.168.0.125', '13:E9:58:2C:68:FF', 403, 'Good condition'),
                                                                                                                                                             ('ASUS', 'Intel', 4, 512, 'ffffffff', '192.168.0.126', '08:B8:65:1B:47:EF', 310, 'Good condition'),
                                                                                                                                                             ('Acer', 'Intel', 32, 256, 'fffffffff', '192.168.0.127', '08:A0:45:1D:58:DF', 309, 'Good condition'),
                                                                                                                                                             ('Apple', 'AMD', 16, 512, 'ffffffffff', '192.168.0.128', '22:B3:75:6F:38:DF', 304, 'Require repair'),
                                                                                                                                                             ('Acer', 'Intel', 16, 128, 'rkf', '192.168.0.129', '24:D3:85:4F:97:FE', 204, 'Good condition'),
                                                                                                                                                             ('Hewlett-Packard', 'AMD', 8, 256, 'romankolinf', '192.168.0.130', '09:D4:95:1F:46:DF', 204, 'Require repair'); 
INSERT INTO Hardware(typ, brand, mod, quant) VALUES('CPU', 'Intel', 'Intel Core i3-1115G4', 25),
                                                                                                  ('CPU', 'AMD', 'AMD Ryzen 3 1200', 10),
                                                                                                  ('RAM', 'AMD', 'AMD Radeon R7 Performance', 55),
                                                                                                  ('ROM', 'Kingston', 'Kingston KC600', 40),
                                                                                                  ('Motherboard', 'GIGABYTE', 'GIGABYTE B560M H', 35),
                                                                                                  ('Power supply', 'Xilence Gaming', 'Xilence Gaming XN215', 35),
                                                                                                  ('Cooler', 'ID-COOLING', 'ID-COOLING SE-903-R', 45),
                                                                                                  ('Case', 'DEXP', 'DEXP AWS-DE7', 35),
                                                                                                  ('Monitor', 'Acer', 'Acer Aspire C24-1650', 35),
                                                                                                  ('Mouse', 'Defender', 'Defender #1 MM-605', 35),
                                                                                                  ('Keyboard', 'DEXP', 'DEXP K-505BU', 35); 
INSERT INTO Software(nam, corp, typ, ver, licens, quant) VALUES('Linux', '', 'system', 'Ubuntu 20.04', '', ''),
                                                                                                                 ('Windows', 'Microsoft', 'system', 'Windows 10 Home', 'yes', 30),
                                                                                                                 ('MySQL', '', 'application', '8.0.31-0ubuntu0.20.04.1', '', ''),
                                                                                                                 ('Android Studio', 'Google', 'application', 'Android Studio Chipmunk', '', ''),
                                                                                                                 ('Visual Studio', 'Microsoft', 'application', 'Visual Studio Community 2019', '', ''); 
INSERT INTO Installation(pc_id, hard_id, soft_id, dat) VALUES(1, 1, 1, '2022-08-20'),
                                                                                                           (1, 1, 1, '2021-09-20'),
                                                                                                           (5, 10, 3, '2020-09-25'),
                                                                                                           (29, 8, 3, '2021-04-05'),
                                                                                                           (17, 6, 4, '2021-04-05'),
                                                                                                           (30, 6, 4, '2020-09-25'),
                                                                                                           (16, 3, 4, '2021-04-05'),
                                                                                                           (5, 2, 4, '2021-04-05'),
                                                                                                           (28, 2, 4, '2021-04-05'),
                                                                                                           (16, 2, 4, '2020-09-25'),
                                                                                                           (3, 2, 3, '2020-09-25'),
                                                                                                           (30, 11, 3, '2021-04-05'),
                                                                                                           (29, 11, 3, '2020-09-25'),
                                                                                                           (14, 10, 3, '2020-09-25'),
                                                                                                           (14, 9, 2, '2021-04-05'),
                                                                                                           (15, 9, 2, '2021-04-05'),
                                                                                                           (15, 2, 2, '2021-04-05'),
                                                                                                           (7, 3, 4, '2021-04-05'),
                                                                                                           (28, 3, 5, '2020-09-25'),
                                                                                                           (2, 4, 5, '2020-09-25'),
                                                              						   (7, 4, 5, '2021-04-05'),
                                                                                                           (13, 4, 5, '2021-04-05'),
                                                                                                           (12, 5, 4, '2021-04-05'),
                                                                                                           (12, 6, 4, '2021-04-05'),
                                                                                                           (13, 5, 4, '2020-09-25'),
                                                                                                           (2, 6, 2, '2020-09-25'),
                                                                                                           (6, 7, 2, '2021-04-05'),
                                                                                                           (4, 7, 3, '2021-04-05'),
                                                                                                           (4, 7, 3, '2021-04-05'),
                                                                                                           (3, 7, 3, '2021-04-05'),
                                                                                                           (27, 8, 2, '2021-04-05'),
                                                                                                           (11, 8, 2, '2021-04-05'),
                                                                                                           (10, 9, 2, '2021-04-05'),
                                                                                                           (11, 3, 2, '2021-04-05'),
                                                                                                           (27, 6, 2, '2021-04-05'),
                                                                                                           (6, 6, 3, '2021-04-05'),
                                                                                                           (10, 3, 3, '2020-09-25'),
                                                                                                           (9, 5, 3, '2021-04-05'),
                                                                                                           (9, 5, 3, '2021-04-05'),
                                                                                                           (8, 5, 3, '2021-04-05'),
                                                                                                           (8, 5, 3, '2021-04-05'),
                                                                                                           (22, 2, 4, '2021-04-05'),
                                                                                                           (18, 2, 4, '2021-04-05'),
                                                                                                           (19, 2, 4, '2021-04-05'),
                                                                                                           (19, 5, 4, '2021-04-05'),
                                                                                                           (18, 7, 4, '2021-04-05'),
                                                                                                           (21, 7, 4, '2021-04-05'),
                                                                                                           (17, 2, 4, '2021-04-05'),
                                                                                                           (20, 4, 4, '2020-09-25'),
                                                                                                           (21, 4, 5, '2021-04-05'),
                                                                                                           (20, 4, 5, '2021-04-05'),
                                                                                                           (25, 4, 5, '2021-04-05'),
                                                                                                           (26, 8, 4, '2021-04-05'),
                                                                                                           (26, 8, 4, '2020-09-25'),
                                                                                                           (24, 9, 4, '2021-04-05'),
                                                                                                           (25, 8, 5, '2021-04-05'),
                                                                                                           (22, 8, 3, '2020-09-25'),
                                                                                                           (23, 3, 3, '2021-04-05'),
                                                                                                           (24, 4, 2, '2020-09-25'),
                                                                                                           (23, 5, 3, '2021-04-05');