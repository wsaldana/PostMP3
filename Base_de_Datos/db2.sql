--------------------------------------------PASAR DIGRAMA A CODIGO--------------------------------------------------
DROP TABLE IF EXISTS Usuario CASCADE;

--CREAR TABLA
create table Monitor(
    id_monitor SERIAL PRIMARY KEY,
    tipo varchar(2) NOT NULL,
    r1 boolean DEFAULT false,
    r2 boolean DEFAULT false,
    r3 boolean DEFAULT false,
    r4 boolean DEFAULT false,
    r5 boolean DEFAULT false,
    r6 boolean DEFAULT false,
    r7 boolean DEFAULT false,
    r8 boolean DEFAULT false
);
--LLENAR TABLA MONITOR
insert into Monitor values(1,'A',true,true,true,false,false,false,false,false);
insert into Monitor values(2,'B',false,false,false,true,true,true,false,false);

--CREAR TABLA MANAGER
create table Manager (
	id_manager SERIAL NOT NULL PRIMARY KEY,
	date_sub date,
	enabled boolean default true
);

--LLENAR TABLA MANAGER 
insert into Manager values(default,'2015-11-28',true);
insert into Manager values(default,'2010-05-25',true);
insert into Manager values(default,'2015-04-20',true);
insert into Manager values(default,'1980-03-26',true);
insert into Manager values(default,'2000-01-28',true);

DROP TABLE IF EXISTS Artist CASCADE;
--CREAR TABLA ARTIST
create table Artist (
	id_artist SERIAL NOT NULL PRIMARY KEY,
	art_name varchar(25) NOT NULL UNIQUE,
	date_sub date NOT NULL,
	id_manager int,
	enabled boolean DEFAULT true,
	comision NUMERIC(10,2) DEFAULT 0.0
);

ALTER TABLE Artist ADD FOREIGN KEY (id_manager) REFERENCES Manager(id_manager);
--LLENAR TABLA ARTIST 
insert into Artist values(default,'Bad Bunny','2016-11-28',1,true);
insert into Artist values(default,'The Weeknd','2017-07-25',2,true);
insert into Artist values(default,'Dua Lipa','2016-04-20',3,true);
insert into Artist values(default,'J Balvin','2014-01-01',1,true);
insert into Artist values(default,'Ricardo Arjona','2010-06-18',4,true);
insert into Artist values(default,'Christian Nodal','2015-09-25',5,true);
insert into Artist values(default,'Queen','1980-04-20',2,true);
insert into Artist values(default,'Guns and Roses','2000-05-10', 1,true);

--CREAR TABLA USER
create table Usuario(
	id_user SERIAL NOT NULL PRIMARY KEY,
	username varchar(25) NOT NULL,
	contrasena varchar(25) NOT NULL,
	enabled boolean DEFAULT true,
	id_monitor int null references monitor(id_monitor),
	id_artist int null references artist(id_artist),
	id_manager int null references manager(id_manager)
);

--LLENAR TABLA USER
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user1', '123456', true,1);--artistas
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user2', 'jamonconqueso', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user3', 'jaela123', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user4', 'requezon21', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user5', 'latracalosa66', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user6', 'agentecul', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user7', 'pinocho23', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user8', 'riquelme', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user9', 'donramon64', true,NULL);--managers
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user10', 'pepeypique', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user11', 'mcabstract', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user12', 'bocariver', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user13', 'drewmac65', true,2);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user14', 'burgerking90', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user15', 'rockets4', true,NULL);--usuarios
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user16', 'huevosyfrijoles', true,NULL);
insert into Usuario(username,contrasena,enabled,id_monitor) values ('user18', '27827', true,NULL);

DROP TABLE IF EXISTS Album CASCADE;
--CREAR TABLA ALBUM
create table Album (
	id_album SERIAL NOT NULL PRIMARY KEY,
	album_name varchar(30) NOT NULL,
	date_pub date NOT NULL,
	id_artist int NOT NULL,
	enabled boolean DEFAULT true 
);
ALTER TABLE Album ADD FOREIGN KEY (id_artist) REFERENCES Artist(id_artist);
--LLENAR TABLA ALBUM 
insert into Album values(default,'YHLQMDLG','2020-06-25',1,true);
insert into Album values(default,'X 100PRE','2018-07-25',1,true);
insert into Album values(default,'After Hours','2020-07-20',2,true);
insert into Album values(default,'Starboy','2016-05-26',2,true);
insert into Album values(default,'Future Nostalgia','2020-08-28',3,true);
insert into Album values(default,'Colores','2020-08-25',4,true);
insert into Album values(default,'Circo Soledad','2017-04-20',5,true);
insert into Album values(default,'Me deje llevar','2020-09-26',6,true);
insert into Album values(default,'Bohemian Rhapsody','1986-11-28',7,true);
insert into Album values(default,'Chinese Democracy','2008-07-25',8,true);

insert into Album values(default,'Album','2021-03-22',8);


DROP TABLE IF EXISTS Song CASCADE;
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


DROP TABLE IF EXISTS Playlist CASCADE;
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
insert into Playlist values(default,'Espa�ol',15);
insert into Playlist values(default,'BadBunnyMix',1);
insert into Playlist values(default,'ArjonaMix',16);
insert into Playlist values(default,'JBalvinMix',2);
insert into Playlist values(default,'TheWeekndmix',13);


DROP TABLE IF EXISTS Request CASCADE;
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

DROP TABLE IF EXISTS Playlist_song CASCADE;
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

-------------------------------Equipo de monitoreo de usuarios, artistas, tracksy reproducciones--------------------
---1.Modificar la información de cualquier track y álbum del catálogo
CREATE OR REPLACE FUNCTION cambiar_info_cancion(insert_id_song int, nombre_cancion varchar, genero varchar, insert_url varchar)
RETURNS void
AS $$
BEGIN
	update song 
	set song_name = nombre_cancion, genero = genre, url = insert_url
	where id_song = insert_id_song;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cambiar_info_album(insert_id_album int, nombre_album varchar, new_date date)
RETURNS void
AS $$
BEGIN
	update album 
	set album_name = nombre_album, date_pub = new_date
	where id_album = insert_id_album;
END;
$$
LANGUAGE plpgsql;


---2.Desactivar tracks y álbumes
CREATE OR REPLACE FUNCTION desactivar_cancion(nombre_insertado varchar)
RETURNS void
AS $$
BEGIN
	update song 
	set enabled = false
	where song_name = nombre_insertado;
END;
$$
LANGUAGE plpgsql;
select * from desactivar_cancion('safaera'); ---Prueba

CREATE OR REPLACE FUNCTION desactivar_album(nombre_insertado varchar)
RETURNS void
AS $$
BEGIN
	update album
	set enabled = false
	where album_name = nombre_insertado;
	
	update song
	set enabled = false
	from album
	where album_name = nombre_insertado and album.id_album = song.id_album;
END;
$$
LANGUAGE plpgsql;
select * from desactivar_album('After Hours'); ---Prueba

---3.Desactivar usuarios sin suscripción para que ya no puedan acceder a la plataforma
--drop function desactivar_usuario
CREATE OR REPLACE FUNCTION desactivar_usuario(id_insertado int)
RETURNS VOID
AS $$
BEGIN
	IF ((SELECT COUNT(*) FROM artist WHERE id_artist = id_insertado)>0 OR (SELECT COUNT(*) FROM manager WHERE id_manager = id_insertado)>0) THEN
		RAISE EXCEPTION 'Este usuario tiene suscripcion, por lo tanto no se puede desactivar.';
	ELSE
		update usuario
		set enabled = false
		where usuario.id_user = id_insertado;
	END IF;
END;
$$
LANGUAGE plpgsql;
--select * from desactivar_usuario(17); --- Prueba

---4.Eliminar suscripciones de usuarios
CREATE OR REPLACE FUNCTION eliminar_suscripcion(id_insertado int)
RETURNS VOID
AS $$
BEGIN
	IF (SELECT COUNT(*) FROM artist WHERE id_artist = id_insertado)>0 THEN
		update artist
		set enabled = false
		where id_artist = id_insertado;
	ELSIF (SELECT COUNT(*) FROM manager WHERE id_manager = id_insertado)>0 THEN
		update manager
		set enabled = false
		where id_manager = id_insertado;
	ELSE
		RAISE EXCEPTION 'Este usuario no tiene suscripcion, por lo tanto no se puede desactivar.';
	END IF;
END;
$$
LANGUAGE plpgsql;
--select * from eliminar_suscripcion(15); ---Prueba

---5.Desactivar usuarios registrados como artistas
--drop function desactivar_artista
CREATE OR REPLACE FUNCTION desactivar_artista(nombre_insertado varchar)
RETURNS VOID
AS $$
BEGIN
	update usuario
	set enabled = false
	from artist
	where artist.id_artist = usuario.id_artist and artist.art_name = nombre_insertado;
END;
$$
LANGUAGE plpgsql;
select * from desactivar_artista('ccc'); ---Prueba 

---------------------------------------BITACORA---------------------------------------------------
create table Bitacora (
	id_bitacora SERIAL NOT NULL PRIMARY KEY,
	accion varchar(20) not null,
	tabla varchar(30) not null,
	fecha_hora TIMESTAMP not null
);
--drop table Bitacora cascade;

--------------------------------------*ARTISTAS*-------------------------------------------------------------------
--drop function bitacora_artista() cascade

create function bitacora_artista() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'ARTISTAS', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'ARTISTAS', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'ARTISTAS', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_artista 
AFTER INSERT OR UPDATE OR DELETE on artist
for each row
execute procedure bitacora_artista();

--------------------------------------*MANAGERS*-------------------------------------------------------------------
--drop function bitacora_manager() cascade

create function bitacora_manager() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'MANAGER', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'MANAGER', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'MANAGER', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_manager 
AFTER INSERT OR UPDATE OR DELETE on manager
for each row
execute procedure bitacora_manager();

--------------------------------------*USUARIOS*-------------------------------------------------------------------
--drop function bitacora_manager() cascade

create function bitacora_usuario() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'USUARIOS', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'USUARIOS', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'USUARIOS', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_usuario
AFTER INSERT OR UPDATE OR DELETE on usuario
for each row
execute procedure bitacora_usuario();

--------------------------------------*ALBUM*------------------------------------------------------------------
create function bitacora_album() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'ALBUM', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'ALBUM', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'ALBUM', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_album
AFTER INSERT OR UPDATE OR DELETE on album
for each row
execute procedure bitacora_album();

--------------------------------------*PLAYLISTS*------------------------------------------------------------------
create function bitacora_playlist() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'PLAYLIST', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'PLAYLIST', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'PLAYLIST', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_playlist
AFTER INSERT OR UPDATE OR DELETE on playlist
for each row
execute procedure bitacora_playlist();

--------------------------------------*TRACKS*------------------------------------------------------------------
create function bitacora_tracks() 
returns Trigger
as
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('CREACION', 'SONG', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'UPDATE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('MODIFICACION', 'SONG', CURRENT_TIMESTAMP);
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		insert into Bitacora(accion, tabla, fecha_hora) values ('ELIMINACION', 'SONG', CURRENT_TIMESTAMP);
		RETURN NEW;
	END IF;
END
$$
Language plpgsql;

CREATE TRIGGER update_bitacora_track
AFTER INSERT OR UPDATE OR DELETE on song
for each row
execute procedure bitacora_tracks();

-------------------------------------------MONITOREO----------------------------------------------

--insert into Monitor values(3,'C',false,false,false,false,false,false,true,true);

--Insertar nuevo monitor
--drop function IF EXISTS insert_monitor CASCADE
/*create function insert_monitor()
returns trigger 
language PLPGSQL as $$
BEGIN
	insert into Monitor values (default, new.tipo, new.r1, new.r2, new.r3, new.r4, new.r5, new.r6, new.r7, new.r8);
	return new;
End
$$;

Create trigger t_insert_monitor
after insert on Monitor
for each row
execute procedure insert_monitor();
insert into Monitor values (default,'C',false,false,false,false,false,false,true,true);

---Ingresar (actualizar el id_monitor del usuario)
--drop function IF EXISTS update_id_monitor CASCADE
create or replace function update_id_monitor()
returns trigger 
language PLPGSQL as $$
BEGIN
	update usuario set id_monitor = new.id_monitor where id_user = OLD.id_user;
	return new;
End
$$;
Create trigger t_update_id_monitor
instead of update on NewMonitor
for each row execute procedure update_id_monitor();

update NewMonitor set id_monitor = 3 where id_user = 16;
*/

-----------------------------AMPLIACION DE REPORTERIA---------------------------------------------
---1.Total de reproducciones por semana dado un rango de fechas a ser ingresado por el usuario
--- la deje por dia porque no hay suficientes datos
--drop FUNCTION Reporteria_1
CREATE INDEX CONCURRENTLY requests_date ON request (id_request,date_req);

CREATE OR REPLACE FUNCTION Reporteria_1(fecha1 date, fecha2 date)
RETURNS table (fecha text, reproducciones bigint)
AS $$
BEGIN	
	return QUERY(
		select to_char(re.date_req, 'dd/mm/yy') as fecha, count(re.id_request) as reproducciones
		from request re
		where re.date_req between fecha1 and fecha2
		group by fecha
	);
END;
$$
LANGUAGE plpgsql;

select fecha, reproducciones from Reporteria_1 ('2020-01-28','2021-09-26');


---Ampliación de reportería
---2. Los N artistas con las mayores reproducciones para un rango de fechas a ser ingresado
--por el usuario. La cantidad de artistas N a mostrar también debe ser ingresada por el
--usuario.
CREATE INDEX artists_index ON artist (art_name);

CREATE OR REPLACE FUNCTION Reporteria_2(fecha1 date, fecha2 date, can_artista int)
RETURNS table (artistas varchar(25), reproducciones bigint)
AS $$
BEGIN	
	return QUERY(
		select ar.art_name, count(re.id_request) as reproducciones
		from song so, request re, artist ar
		where re.date_req between fecha1 and fecha2 and so.id_song = re.id_song  and so.id_artist = ar.id_artist
		group by ar.art_name
		order by reproducciones desc
		limit can_artista
	);
END;
$$
LANGUAGE plpgsql;

select artistas, reproducciones from Reporteria_2 ('2020-01-28','2021-09-26', 4);


---Ampliación de reportería
---3. Total de reproducciones por género para un rango de fechas a ser ingresado por el usuario
CREATE INDEX song_genre ON song (genre);

CREATE OR REPLACE FUNCTION Reporteria_3(fecha1 date, fecha2 date)
RETURNS table (genero varchar(30), reproducciones bigint)
AS $$
BEGIN	
	return QUERY(
		select so.genre, count(so.id_song) as reproducciones
		from song so, request re
		where re.date_req between fecha1 and fecha2 and so.id_song = re.id_song
		group by genre
		order by reproducciones desc
	);
END;
$$
LANGUAGE plpgsql;

select genero, reproducciones from Reporteria_3 ('2020-01-28','2021-09-26');

---Ampliación de reportería
---4. Las N canciones con más reproducciones para un artista a ser ingresado por el usuario.
CREATE OR REPLACE FUNCTION Reporteria_4(artista  varchar(25), num int)
RETURNS table (song varchar(25), reproducciones bigint)
AS $$
BEGIN	
	return QUERY(
		select so.song_name, count(re.id_request) as reproducciones
		from song so, request re, artist ar
		where ar.art_name = artista and so.id_artist = ar.id_artist and so.id_song = re.id_song
		group by so.song_name
		order by reproducciones desc
		limit num
	);
END;
$$
LANGUAGE plpgsql;

select song, reproducciones from Reporteria_4 ('Bad Bunny', 3);

--UPDATE Usuario SET id_artist=NULL WHERE id_user=1;
--UPDATE Usuario SET enabled=true WHERE id_user=1;
SELECT * FROM usuario;
SELECT * FROM artist a ;

CREATE TABLE fondos(
	dinero NUMERIC(10,2) NOT NULL
);
INSERT INTO fondos VALUES(500.75);

CREATE TABLE pagos(
	id_pago SERIAL NOT NULL PRIMARY KEY,
	monto NUMERIC(10,2) NOT NULL,
	date_payment DATE NOT NULL,
	id_artist INT NOT NULL REFERENCES artist(id_artist)
);

-------------------------------------------COMISIONES--------------------------------------------
BEGIN;
	select ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias
	from song so, request re, artist ar, usuario usu
	where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist
	group by  ar.art_name
	order by reproducciones desc;

select ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias from song so, request re, artist ar, usuario usu where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist and ar.id_artist = 1 group by  ar.art_name order by reproducciones desc;

select ar.id_artist, ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias from song so, request re, artist ar, usuario usu where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist group by  ar.id_artist, ar.art_name order by reproducciones desc;

SELECT * FROM fondos ;
SELECT * FROM artist ;
SELECT * FROM song ;
SELECT * FROM album;
SELECT * FROM usuario;
SELECT * FROM bitacora;
