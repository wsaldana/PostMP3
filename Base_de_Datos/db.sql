--------------------------------------------PASAR DIGRAMA A CODIGO--------------------------------------------------

--CREAR TABLA USER
create table Usuario(
	id_user int NOT NULL SERIAL PRIMARY KEY,
	username varchar(25) NOT NULL,
	contrasena varchar(25) NOT NULL,
);

--LLENAR TABLA USER
insert into Usuario values (1, 'user1', '123456');--artistas
insert into Usuario values (2, 'user2', 'jamonconqueso');
insert into Usuario values (3, 'user3', 'jaela123');
insert into Usuario values (4, 'user4', 'requezon21');
insert into Usuario values (5, 'user5', 'latracalosa66');
insert into Usuario values (6, 'user6', 'agentecul');
insert into Usuario values (7, 'user7', 'pinocho23');
insert into Usuario values (8, 'user8', 'riquelme');
insert into Usuario values (9, 'user9', 'donramon64');--managers
insert into Usuario values (10, 'user10', 'pepeypique');
insert into Usuario values (11, 'user11', 'mcabstract');
insert into Usuario values (12, 'user12', 'bocariver');
insert into Usuario values (13, 'user13', 'drewmac65');
insert into Usuario values (14, 'user14', 'burgerking90');--usuarios
insert into Usuario values (15, 'user15', 'rockets4');
insert into Usuario values (16, 'user16', 'huevosyfrijoles');

--CREAR TABLA ARTIST
create table Artist (
	id_artist int NOT NULL,
	art_name varchar(25),
	date_sub date,
	id_user int,
	id_manager int,
	primary key (id_artist)
);

--LLENAR TABLA ARTIST 
insert into Artist values(1,'Bad Bunny','2016-11-28',1,1);
insert into Artist values(2,'The Weeknd','2017-07-25',2,1);
insert into Artist values(3,'Dua Lipa','2016-04-20',3,1);
insert into Artist values(4,'J Balvin','2014-01-01',4,2);
insert into Artist values(5,'Ricardo Arjona','2010-06-18',5,2);
insert into Artist values(6,'Christian Nodal','2015-09-25',6,3);
insert into Artist values(7,'Queen','1980-04-20',7, 4);
insert into Artist values(8,'Guns and Roses','2000-05-10',8, 5);

--CREAR TABLA MANAGER
create table Manager (
	id_manager int NOT NULL,
	date_sub date,
	id_user int NOT NULL,
	primary key (id_manager)
);

--LLENAR TABLA MANAGER 
insert into Manager values(1,'2015-11-28',9);
insert into Manager values(2,'2010-05-25',10);
insert into Manager values(3,'2015-04-20',11);
insert into Manager values(4,'1980-03-26',12);
insert into Manager values(5,'2000-01-28',13);

--CREAR TABLA SONG
create table Song(
	id_song int NOT NULL,
	song_name varchar(35),
	genre varchar(30),
	url varchar(200),
	enabled boolean NOT NULL,
	id_artist int,
	id_album int,
	primary key (id_song)
);

--LLENAR TABLA SONG
insert into Song values(1, 'safaera', 'reggaeton','URL', true ,1,1);--bad Bunny YHLQMDLG
insert into Song values(2, 'la santa', 'reggaeton','URL',true,1,1);
insert into Song values(3, 'ignorantes', 'reggaeton','URL',false,1,1);
insert into Song values(4, 'como antes', 'reggaeton', 'URL',true,1,2);--bad Bunny X 100PRE		
insert into Song values(5, 'otra noche en miami', 'reggaeton', 'URL',true,1,2);
insert into Song values(6, 'save your tears', 'r&b/soul', 'URL',true,2,3);--The weekend After Hours
insert into Song values(7, 'in your eyes', 'r&b/soul', 'URL',true,2,3);
insert into Song values(8, 'starboy', 'r&b/soul', 'URL',true,2,4);--The weekend Starboy
insert into Song values(9, 'secrets', 'r&b/soul', 'URL',false,2,4);
insert into Song values(10, 'love again', 'pop', 'URL',true,3,5);--dua lipa future nostalgia
insert into Song values(11, 'break my heart', 'pop', 'URL',true,3,5);
insert into Song values(12, 'cool', 'pop','URL' ,true,3,5);
insert into Song values(13, 'physical', 'pop','URL' ,true,3,5);
insert into Song values(14, 'rojo', 'reggaeton','URL',true,4,6);--J Balvin colores
insert into Song values(15, 'blanco', 'reggaeton','URL' ,false,4,6);
insert into Song values(16, 'ella', 'latin pop', 'URL',true,5,7);--Ricardo Arjona circo soledad
insert into Song values(17, 'vivir', 'latin pop','URL',false,5,7);
insert into Song values(18, 'dime tu', 'latin pop', 'URL',true,5,7);
insert into Song values(19, 'adios amor', 'banda','URL',true,6,8);--Christian Nodal me deje llevar
insert into Song values(20, 'me deje llevar', 'banda','URL',true,6,8);
insert into Song values(21, 'probablemente', 'banda','URL',true,6,8);
insert into Song values(22, 'i want to break free', 'classic rock','URLURL',false,7,9);--Queen bohemian rhapsody
insert into Song values(23, 'under pressure', 'classic rock','URL',true,7,9);
insert into Song values(24, 'better', 'rock','URL',true,8,10);--Guns and roses Chinese Democracy
insert into Song values(25, 'this is love', 'rock', 'URL',true,8,10);



--CREAR TABLA ALBUM
create table Album (
	id_album int NOT NULL,
	album_name varchar(30),
	date_pub date,
	id_artist int,
	primary key (id_album)
);

--LLENAR TABLA ALBUM 
insert into Album values(1,'YHLQMDLG','2020-06-25',1);
insert into Album values(2,'X 100PRE','2018-07-25',1);
insert into Album values(3,'After Hours','2020-07-20',2);
insert into Album values(4,'Starboy','2016-05-26',2);
insert into Album values(5,'Future Nostalgia','2020-08-28',3);
insert into Album values(6,'Colores','2020-08-25',4);
insert into Album values(7,'Circo Soledad','2017-04-20',5);
insert into Album values(8,'Me deje llevar','2020-09-26',6);
insert into Album values(9,'Bohemian Rhapsody','1986-11-28',7);
insert into Album values(10,'Chinese Democracy','2008-07-25',8);


--CREAR TABLA PLAYLIST
create table Playlist (
	id_playlist int NOT NULL,
	paylist_name varchar(25),
	id_user int,
	primary key (id_playlist)
);

--LLENAR TABLA PLAYLIST 
insert into Playlist values(1,'RegionalMex',14);
insert into Playlist values(2,'Rock',15);
insert into Playlist values(3,'Español',15);
insert into Playlist values(4,'BadBunnyMix',1);
insert into Playlist values(5,'ArjonaMix',16);
insert into Playlist values(6,'JBalvinMix',2);
insert into Playlist values(7,'TheWeekndmix',13);


--CREAR TABLA REQUEST
create table Request (
	id_request int NOT NULL,
	date_sub date,
	id_song int,
	primary key (id_request)
);

--LLENAR TABLA REQUEST 
insert into Request values(1,'2020-01-28',1);
insert into Request values(2,'2020-03-25',5);
insert into Request values(3,'2020-05-20',1);
insert into Request values(4,'2021-09-26',15);
insert into Request values(5,'2020-02-28',20);
insert into Request values(6,'2021-07-25',4);
insert into Request values(7,'2020-04-20',1);
insert into Request values(8,'2021-09-26',21);
insert into Request values(9,'2020-04-28',6);
insert into Request values(10,'2019-07-25',16);
insert into Request values(11,'2020-03-25',4);
insert into Request values(12,'2019-04-20',16);
insert into Request values(13,'2020-04-26',21);


--CREAR TABLA User_Request 
create table User_Request(
	id_user int NOT NULL,
	id_request int NOT NULL
);
--LLENAR TABLA User_Request
insert into User_Request values(14,1);
insert into User_Request values(14,2);
insert into User_Request values(14,3);
insert into User_Request values(14,4);
insert into User_Request values(15,5);
insert into User_Request values(15,6);
insert into User_Request values(15,7);
insert into User_Request values(16,8);
insert into User_Request values(16,9);
insert into User_Request values(16,10);
insert into User_Request values(1,11);
insert into User_Request values(2,12);
insert into User_Request values(3,13);
insert into User_Request values(9,14);
insert into User_Request values(13,15);

--CREAR TABLA User_Request 
create table Playlist_song(
	id_playlist int NOT NULL,
	id_song int NOT NULL
);
--LLENAR TABLA User_Request
insert into Playlist_song values(1,19);
insert into Playlist_song values(1,20);
insert into Playlist_song values(1,21);
insert into Playlist_song values(2,22);
insert into Playlist_song values(2,23);
insert into Playlist_song values(2,24);
insert into Playlist_song values(2,25);
insert into Playlist_song values(3,1);
insert into Playlist_song values(3,2);
insert into Playlist_song values(3,3);
insert into Playlist_song values(3,4);
insert into Playlist_song values(3,5);
insert into Playlist_song values(3,14);
insert into Playlist_song values(3,15);
insert into Playlist_song values(3,16);
insert into Playlist_song values(3,17);
insert into Playlist_song values(3,18);
insert into Playlist_song values(3,19);
insert into Playlist_song values(3,20);
insert into Playlist_song values(3,21);
insert into Playlist_song values(4,1);
insert into Playlist_song values(4,2);
insert into Playlist_song values(4,3);
insert into Playlist_song values(4,4);
insert into Playlist_song values(4,5);
insert into Playlist_song values(5,16);
insert into Playlist_song values(5,17);
insert into Playlist_song values(5,18);
insert into Playlist_song values(6,14);
insert into Playlist_song values(6,15);
insert into Playlist_song values(7,6);
insert into Playlist_song values(7,7);
insert into Playlist_song values(7,8);
insert into Playlist_song values(7,9);

---------------------------------------------REVISION------------------------------------------------------------
--SELECTS PARA REVISAR LA DATA EN LAS TABLAS
select * from Usuario;
select * from Artist;
select * from Manager;
select * from Song;
select * from Album;
select * from Playlist;
select * from Request;
select * from User_Request;
select * from Playlist_song;