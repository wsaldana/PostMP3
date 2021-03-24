--------------------------------------------PASAR DIGRAMA A CODIGO--------------------------------------------------
DROP TABLE IF EXISTS Usuario;

--CREAR TABLA USER
create table Usuario(
	id_user SERIAL NOT NULL PRIMARY KEY,
	username varchar(25) NOT NULL,
	contrasena varchar(25) NOT NULL
);

--LLENAR TABLA USER
insert into Usuario(username,contrasena) values ('user1', '123456');--artistas
insert into Usuario(username,contrasena) values ('user2', 'jamonconqueso');
insert into Usuario(username,contrasena) values ('user3', 'jaela123');
insert into Usuario(username,contrasena) values ('user4', 'requezon21');
insert into Usuario(username,contrasena) values ('user5', 'latracalosa66');
insert into Usuario(username,contrasena) values ('user6', 'agentecul');
insert into Usuario(username,contrasena) values ('user7', 'pinocho23');
insert into Usuario(username,contrasena) values ('user8', 'riquelme');
insert into Usuario(username,contrasena) values ('user9', 'donramon64');--managers
insert into Usuario(username,contrasena) values ('user10', 'pepeypique');
insert into Usuario(username,contrasena) values ('user11', 'mcabstract');
insert into Usuario(username,contrasena) values ('user12', 'bocariver');
insert into Usuario(username,contrasena) values ('user13', 'drewmac65');
insert into Usuario(username,contrasena) values ('user14', 'burgerking90');--usuarios
insert into Usuario(username,contrasena) values ('user15', 'rockets4');
insert into Usuario(username,contrasena) values ('user16', 'huevosyfrijoles');
insert into Usuario(username,contrasena) values ('user18', '27827');

DROP TABLE IF EXISTS Manager;
--CREAR TABLA MANAGER
create table Manager (
	id_manager int NOT NULL PRIMARY KEY,
	date_sub date
);
ALTER TABLE Manager ADD FOREIGN KEY (id_manager) REFERENCES Usuario(id_user);
--LLENAR TABLA MANAGER 
insert into Manager values(9,'2015-11-28');
insert into Manager values(10,'2010-05-25');
insert into Manager values(11,'2015-04-20');
insert into Manager values(12,'1980-03-26');
insert into Manager values(13,'2000-01-28');

DROP TABLE IF EXISTS Artist;
--CREAR TABLA ARTIST
create table Artist (
	id_artist int NOT NULL PRIMARY KEY,
	art_name varchar(25) NOT NULL UNIQUE,
	date_sub date NOT NULL,
	id_manager int
);
ALTER TABLE Artist ADD FOREIGN KEY (id_artist) REFERENCES Usuario(id_user);
ALTER TABLE Artist ADD FOREIGN KEY (id_manager) REFERENCES Manager(id_manager);
--LLENAR TABLA ARTIST 
insert into Artist values(1,'Bad Bunny','2016-11-28',9);
insert into Artist values(2,'The Weeknd','2017-07-25',9);
insert into Artist values(3,'Dua Lipa','2016-04-20',9);
insert into Artist values(4,'J Balvin','2014-01-01',10);
insert into Artist values(5,'Ricardo Arjona','2010-06-18',10);
insert into Artist values(6,'Christian Nodal','2015-09-25',11);
insert into Artist values(7,'Queen','1980-04-20',12);
insert into Artist values(8,'Guns and Roses','2000-05-10', 13);


DROP TABLE IF EXISTS Album;
--CREAR TABLA ALBUM
create table Album (
	id_album SERIAL NOT NULL PRIMARY KEY,
	album_name varchar(30) NOT NULL,
	date_pub date NOT NULL,
	id_artist int NOT NULL
);
ALTER TABLE Album ADD FOREIGN KEY (id_artist) REFERENCES Artist(id_artist);
--LLENAR TABLA ALBUM 
insert into Album values(default,'YHLQMDLG','2020-06-25',1);
insert into Album values(default,'X 100PRE','2018-07-25',1);
insert into Album values(default,'After Hours','2020-07-20',2);
insert into Album values(default,'Starboy','2016-05-26',2);
insert into Album values(default,'Future Nostalgia','2020-08-28',3);
insert into Album values(default,'Colores','2020-08-25',4);
insert into Album values(default,'Circo Soledad','2017-04-20',5);
insert into Album values(default,'Me deje llevar','2020-09-26',6);
insert into Album values(default,'Bohemian Rhapsody','1986-11-28',7);
insert into Album values(default,'Chinese Democracy','2008-07-25',8);

insert into Album values(default,'Album','2021-03-22',8);


DROP TABLE IF EXISTS Song;
--CREAR TABLA SONG
create table Song(
	id_song SERIAL NOT NULL PRIMARY KEY,
	song_name varchar(35) NOT NULL,
	genre varchar(30) NOT NULL,
	url varchar(200) NOT NULL,
	enabled boolean DEFAULT true,
	id_artist int NOT NULL,
	id_album int
);
ALTER TABLE Song ADD FOREIGN KEY (id_artist) REFERENCES Artist (id_artist);
ALTER TABLE Song ADD FOREIGN KEY (id_album) REFERENCES Album (id_album);
--LLENAR TABLA SONG
insert into Song values(default, 'safaera', 'reggaeton','URL', true ,1,1);--bad Bunny YHLQMDLG
insert into Song values(default, 'la santa', 'reggaeton','URL',true,1,1);
insert into Song values(default, 'ignorantes', 'reggaeton','URL',false,1,1);
insert into Song values(default, 'como antes', 'reggaeton', 'URL',true,1,2);--bad Bunny X 100PRE		
insert into Song values(default, 'otra noche en miami', 'reggaeton', 'URL',true,1,2);
insert into Song values(default, 'save your tears', 'r&b/soul', 'URL',true,2,3);--The weekend After Hours
insert into Song values(default, 'in your eyes', 'r&b/soul', 'URL',true,2,3);
insert into Song values(default, 'starboy', 'r&b/soul', 'URL',true,2,4);--The weekend Starboy
insert into Song values(default, 'secrets', 'r&b/soul', 'URL',false,2,4);
insert into Song values(default, 'love again', 'pop', 'URL',true,3,5);--dua lipa future nostalgia
insert into Song values(default, 'break my heart', 'pop', 'URL',true,3,5);
insert into Song values(default, 'cool', 'pop','URL' ,true,3,5);
insert into Song values(default, 'physical', 'pop','URL' ,true,3,5);
insert into Song values(default, 'rojo', 'reggaeton','URL',true,4,6);--J Balvin colores
insert into Song values(default, 'blanco', 'reggaeton','URL' ,false,4,6);
insert into Song values(default, 'ella', 'latin pop', 'URL',true,5,7);--Ricardo Arjona circo soledad
insert into Song values(default, 'vivir', 'latin pop','URL',false,5,7);
insert into Song values(default, 'dime tu', 'latin pop', 'URL',true,5,7);
insert into Song values(default, 'adios amor', 'banda','URL',true,6,8);--Christian Nodal me deje llevar
insert into Song values(default, 'me deje llevar', 'banda','URL',true,6,8);
insert into Song values(default, 'probablemente', 'banda','URL',true,6,8);
insert into Song values(default, 'i want to break free', 'classic rock','URLURL',false,7,9);--Queen bohemian rhapsody
insert into Song values(default, 'under pressure', 'classic rock','URL',true,7,9);
insert into Song values(default, 'better', 'rock','URL',true,8,10);--Guns and roses Chinese Democracy
insert into Song values(default, 'this is love', 'rock', 'URL',true,8,10);


DROP TABLE IF EXISTS Playlist;
--CREAR TABLA PLAYLIST
create table Playlist (
	id_playlist SERIAL NOT NULL PRIMARY KEY,
	paylist_name varchar(25),
	id_user int
);
ALTER TABLE playlist  ADD FOREIGN KEY (id_user) REFERENCES usuario (id_user);
--LLENAR TABLA PLAYLIST 
insert into Playlist values(default,'RegionalMex',14);
insert into Playlist values(default,'Rock',15);
insert into Playlist values(default,'Español',15);
insert into Playlist values(default,'BadBunnyMix',1);
insert into Playlist values(default,'ArjonaMix',16);
insert into Playlist values(default,'JBalvinMix',2);
insert into Playlist values(default,'TheWeekndmix',13);


DROP TABLE IF EXISTS Request;
--CREAR TABLA REQUEST
create table Request (
	id_request SERIAL NOT NULL PRIMARY KEY,
	date_req date NOT NULL,
	id_song int NOT NULL,
	id_user int NOT NULL
);
ALTER TABLE request ADD FOREIGN KEY (id_song) REFERENCES song (id_song);
ALTER TABLE request ADD FOREIGN KEY (id_user) REFERENCES usuario (id_user);
--LLENAR TABLA REQUEST 
insert into Request values(default,'2020-01-28',1,1);
insert into Request values(default,'2020-03-25',5,1);
insert into Request values(default,'2020-05-20',1,2);
insert into Request values(default,'2021-09-26',15,2);
insert into Request values(default,'2020-02-28',20,3);
insert into Request values(default,'2021-07-25',4,4);
insert into Request values(default,'2020-04-20',1,2);
insert into Request values(default,'2021-09-26',21,5);
insert into Request values(default,'2020-04-28',6,6);
insert into Request values(default,'2019-07-25',16,7);
insert into Request values(default,'2020-03-25',4,3);
insert into Request values(default,'2019-04-20',16,2);
insert into Request values(default,'2020-04-26',21,2);
insert into Request values(default,'2021-03-22',21,2);

DROP TABLE IF EXISTS Playlist_song;
--CREAR TABLA Playlist_song 
create table Playlist_song(
	id_playlist_song SERIAL NOT NULL PRIMARY KEY,
	id_playlist int NOT NULL,
	id_song int NOT NULL
);
ALTER TABLE Playlist_song ADD FOREIGN KEY (id_playlist) REFERENCES playlist (id_playlist);
ALTER TABLE Playlist_song ADD FOREIGN KEY (id_song) REFERENCES song (id_song);
--LLENAR TABLA User_Request
insert into Playlist_song values(default,1,19);
insert into Playlist_song values(default,1,20);
insert into Playlist_song values(default,1,21);
insert into Playlist_song values(default,2,22);
insert into Playlist_song values(default,2,23);
insert into Playlist_song values(default,2,24);
insert into Playlist_song values(default,2,25);
insert into Playlist_song values(default,3,1);
insert into Playlist_song values(default,3,2);
insert into Playlist_song values(default,3,3);
insert into Playlist_song values(default,3,4);
insert into Playlist_song values(default,3,5);
insert into Playlist_song values(default,3,14);
insert into Playlist_song values(default,3,15);
insert into Playlist_song values(default,3,16);
insert into Playlist_song values(default,3,17);
insert into Playlist_song values(default,3,18);
insert into Playlist_song values(default,3,19);
insert into Playlist_song values(default,3,20);
insert into Playlist_song values(default,3,21);
insert into Playlist_song values(default,4,1);
insert into Playlist_song values(default,4,2);
insert into Playlist_song values(default,4,3);
insert into Playlist_song values(default,4,4);
insert into Playlist_song values(default,4,5);
insert into Playlist_song values(default,5,16);
insert into Playlist_song values(default,5,17);
insert into Playlist_song values(default,5,18);
insert into Playlist_song values(default,6,14);
insert into Playlist_song values(default,6,15);
insert into Playlist_song values(default,7,6);
insert into Playlist_song values(default,7,7);
insert into Playlist_song values(default,7,8);
insert into Playlist_song values(default,7,9);

---------------------------------------------REVISION------------------------------------------------------------
--SELECTS PARA REVISAR LA DATA EN LAS TABLAS
select * from Usuario;
select * from Artist;
select * from Manager;
select * from Song;
select * from Album;
select * from Playlist;
select * from Request;
--select * from User_Request;
select * from Playlist_song;


UPDATE Song SET enabled='false' WHERE id_song='12'

SELECT username FROM Usuario WHERE username='user1' AND contrasena='123456'

SELECT * FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE LOWER(s.song_name) LIKE LOWER('%Saf%') OR LOWER(a.art_name) LIKE LOWER('%Saf%') AND s.enabled = true

DELETE FROM Artist WHERE id_artist = 8

SELECT current_date - date_pub FROM album
SELECT date_pub FROM album
SELECT * FROM album WHERE (current_date - date_pub)<7 ORDER BY (current_date - date_pub)<7 ASC

create table Request (
	id_request SERIAL NOT NULL PRIMARY KEY,
	date_req date NOT NULL,
	id_song int NOT NULL,
	id_user int NOT NULL
);
create table Song(
	id_song SERIAL NOT NULL PRIMARY KEY,
	song_name varchar(35) NOT NULL,
	genre varchar(30) NOT NULL,
	url varchar(200) NOT NULL,
	enabled boolean DEFAULT true,
	id_artist int NOT NULL,
	id_album int
);

SELECT sa.art_name, COUNT(*) as reqs
FROM(
	request r INNER JOIN 

	(SELECT s.id_song, a.art_name 
	FROM song s INNER JOIN artist a 
	ON s.id_artist = a.id_artist) AS sa 
	
	ON r.id_song = sa.id_song
)WHERE (current_date - r.date_req) < 90
GROUP BY sa.art_name
ORDER BY reqs DESC


SELECT a.art_name, COUNT(*) as ncanciones
FROM song s INNER JOIN artist a 
ON s.id_artist = a.id_artist
GROUP BY a.art_name
ORDER BY ncanciones DESC 
LIMIT 10

SELECT s.genre, COUNT(*) as nreq
FROM song s INNER JOIN request r 
ON s.id_song = r.id_song
GROUP BY s.genre
ORDER BY nreq DESC

SELECT u.username, COUNT(*) as nreq
FROM usuario u INNER JOIN request r 
ON u.id_user = r.id_user
GROUP BY u.username
ORDER BY nreq DESC

