PGDMP     5                    y            Proyecto1BD    10.15    10.15 \    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1255    17671    bitacora_album()    FUNCTION     "  CREATE FUNCTION public.bitacora_album() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 '   DROP FUNCTION public.bitacora_album();
       public       postgres    false    3            �            1255    17672    bitacora_artista()    FUNCTION     -  CREATE FUNCTION public.bitacora_artista() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_artista();
       public       postgres    false    3            �            1255    17673    bitacora_manager()    FUNCTION     *  CREATE FUNCTION public.bitacora_manager() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_manager();
       public       postgres    false    3            �            1255    17674    bitacora_playlist()    FUNCTION     .  CREATE FUNCTION public.bitacora_playlist() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 *   DROP FUNCTION public.bitacora_playlist();
       public       postgres    false    3            �            1255    17675    bitacora_tracks()    FUNCTION        CREATE FUNCTION public.bitacora_tracks() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 (   DROP FUNCTION public.bitacora_tracks();
       public       postgres    false    3            �            1255    17676    bitacora_usuario()    FUNCTION     -  CREATE FUNCTION public.bitacora_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_usuario();
       public       postgres    false    3            �            1255    17393 4   cambiar_info_album(integer, character varying, date)    FUNCTION       CREATE FUNCTION public.cambiar_info_album(insert_id_album integer, nombre_album character varying, new_date date) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update album 
	set album_name = nombre_album, date_pub = new_date
	where id_album = insert_id_album;
END;
$$;
 q   DROP FUNCTION public.cambiar_info_album(insert_id_album integer, nombre_album character varying, new_date date);
       public       postgres    false    3            �            1255    17392 V   cambiar_info_cancion(integer, character varying, character varying, character varying)    FUNCTION     J  CREATE FUNCTION public.cambiar_info_cancion(insert_id_song integer, nombre_cancion character varying, genero character varying, insert_url character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update song 
	set song_name = nombre_cancion, genero = genre, url = insert_url
	where id_song = insert_id_song;
END;
$$;
 �   DROP FUNCTION public.cambiar_info_cancion(insert_id_song integer, nombre_cancion character varying, genero character varying, insert_url character varying);
       public       postgres    false    3            �            1255    17677 #   desactivar_album(character varying)    FUNCTION     I  CREATE FUNCTION public.desactivar_album(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
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
$$;
 K   DROP FUNCTION public.desactivar_album(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17678 %   desactivar_artista(character varying)    FUNCTION       CREATE FUNCTION public.desactivar_artista(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update usuario
	set enabled = false
	from artist
	where artist.id_artist = usuario.id_user and artist.art_name = nombre_insertado;
END;
$$;
 M   DROP FUNCTION public.desactivar_artista(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17679 %   desactivar_cancion(character varying)    FUNCTION     �   CREATE FUNCTION public.desactivar_cancion(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update song 
	set enabled = false
	where song_name = nombre_insertado;
END;
$$;
 M   DROP FUNCTION public.desactivar_cancion(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17680    desactivar_usuario(integer)    FUNCTION     �  CREATE FUNCTION public.desactivar_usuario(id_insertado integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF ((SELECT COUNT(*) FROM artist WHERE id_artist = id_insertado)>0 OR (SELECT COUNT(*) FROM manager WHERE id_manager = id_insertado)>0) THEN
		RAISE EXCEPTION 'Este Usuario tiene suscripcion, por lo tanto no se puede desactivar.';
	ELSE
		update usuario
		set enabled = false
		where usuario.id_user = id_insertado;
	END IF;
END;
$$;
 ?   DROP FUNCTION public.desactivar_usuario(id_insertado integer);
       public       postgres    false    3            �            1255    17681    eliminar_suscripcion(integer)    FUNCTION       CREATE FUNCTION public.eliminar_suscripcion(id_insertado integer) RETURNS void
    LANGUAGE plpgsql
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
$$;
 A   DROP FUNCTION public.eliminar_suscripcion(id_insertado integer);
       public       postgres    false    3            �            1255    17682 &   eliminar_suscripcion(integer, integer)    FUNCTION     E  CREATE FUNCTION public.eliminar_suscripcion(opcion integer, id_user_insert integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (opcion == 1) THEN
		delete from artist
		where id_artist = id_user_insert;
	END IF;
	
	IF (opcion == 2) THEN
		delete from manager
		where id_manager = id_user_insert;
	END IF;
END;
$$;
 S   DROP FUNCTION public.eliminar_suscripcion(opcion integer, id_user_insert integer);
       public       postgres    false    3            �            1255    17654    eliminate_monitor()    FUNCTION     �   CREATE FUNCTION public.eliminate_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	delete from Monitor where id_monitor = OLD.id_monitor;
	--delete id_monitor from usuario where id_monitor = OLD.id_monitor;
	return new;
End
$$;
 *   DROP FUNCTION public.eliminate_monitor();
       public       postgres    false    3            �            1255    17656    insert_monitor()    FUNCTION     �   CREATE FUNCTION public.insert_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into Monitor values (new.id_monitor, new.tipo, new.r1, new.r2, new.r3, new.r4, new.r5, new.r6, new.r7, new.r8);
	return new;
End
$$;
 '   DROP FUNCTION public.insert_monitor();
       public       postgres    false    3            �            1255    17631 v   monitor_1(integer, integer, character varying, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean)    FUNCTION     �  CREATE FUNCTION public.monitor_1(asigusu integer, monitor_id integer, tipo character varying, r1 boolean, r2 boolean, r3 boolean, r4 boolean, r5 boolean, r6 boolean, r7 boolean, r8 boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN	
	insert into Monitor values (AsigUsu, monitor_id, tipo, R1, R2, R3, R4, R5, R6, R7, R8);
	--insert into usuario(id_monitor) values (new.id_monitor);
	update usuarios set id_monitor = monitor_id where id_user = AsigUsu;
END;
$$;
 �   DROP FUNCTION public.monitor_1(asigusu integer, monitor_id integer, tipo character varying, r1 boolean, r2 boolean, r3 boolean, r4 boolean, r5 boolean, r6 boolean, r7 boolean, r8 boolean);
       public       postgres    false    3            �            1255    17554    reporteria_1(date, date)    FUNCTION     ]  CREATE FUNCTION public.reporteria_1(fecha1 date, fecha2 date) RETURNS TABLE(fecha text, reproducciones bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN	
	return QUERY(
		select to_char(re.date_req, 'dd/mm/yy') as fecha, count(re.id_request) as reproducciones
		from request re
		where re.date_req between fecha1 and fecha2
		group by fecha
	);
END;
$$;
 =   DROP FUNCTION public.reporteria_1(fecha1 date, fecha2 date);
       public       postgres    false    3            �            1255    17433 !   reporteria_2(date, date, integer)    FUNCTION     �  CREATE FUNCTION public.reporteria_2(fecha1 date, fecha2 date, can_artista integer) RETURNS TABLE(artistas character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 R   DROP FUNCTION public.reporteria_2(fecha1 date, fecha2 date, can_artista integer);
       public       postgres    false    3            �            1255    17429    reporteria_3(date, date)    FUNCTION     �  CREATE FUNCTION public.reporteria_3(fecha1 date, fecha2 date) RETURNS TABLE(genero character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 =   DROP FUNCTION public.reporteria_3(fecha1 date, fecha2 date);
       public       postgres    false    3            �            1255    17430 (   reporteria_4(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reporteria_4(artista character varying, num integer) RETURNS TABLE(song character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 K   DROP FUNCTION public.reporteria_4(artista character varying, num integer);
       public       postgres    false    3            �            1255    17644    update_id_monitor()    FUNCTION     �   CREATE FUNCTION public.update_id_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	update usuario set id_monitor = new.id_monitor where id_user = OLD.id_user;
	return new;
End
$$;
 *   DROP FUNCTION public.update_id_monitor();
       public       postgres    false    3            �            1259    17474    album    TABLE     �   CREATE TABLE public.album (
    id_album integer NOT NULL,
    album_name character varying(30) NOT NULL,
    date_pub date NOT NULL,
    id_artist integer NOT NULL,
    enabled boolean DEFAULT true
);
    DROP TABLE public.album;
       public         postgres    false    3            �            1259    17472    album_id_album_seq    SEQUENCE     �   CREATE SEQUENCE public.album_id_album_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.album_id_album_seq;
       public       postgres    false    200    3            v           0    0    album_id_album_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.album_id_album_seq OWNED BY public.album.id_album;
            public       postgres    false    199            �            1259    17454    artist    TABLE     �   CREATE TABLE public.artist (
    id_artist integer NOT NULL,
    art_name character varying(25) NOT NULL,
    date_sub date NOT NULL,
    id_manager integer,
    enabled boolean DEFAULT true
);
    DROP TABLE public.artist;
       public         postgres    false    3            �            1259    17683    bitacora    TABLE     �   CREATE TABLE public.bitacora (
    id_bitacora integer NOT NULL,
    accion character varying(20) NOT NULL,
    tabla character varying(30) NOT NULL,
    fecha_hora timestamp without time zone NOT NULL
);
    DROP TABLE public.bitacora;
       public         postgres    false    3            �            1259    17686    bitacora_id_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_id_bitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_id_bitacora_seq;
       public       postgres    false    210    3            w           0    0    bitacora_id_bitacora_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;
            public       postgres    false    211            �            1259    17443    manager    TABLE     �   CREATE TABLE public.manager (
    id_manager integer NOT NULL,
    date_sub date,
    enabled boolean DEFAULT true,
    name_manager character varying(30)
);
    DROP TABLE public.manager;
       public         postgres    false    3            �            1259    17658    monitor    TABLE     Y  CREATE TABLE public.monitor (
    id_monitor integer NOT NULL,
    tipo character varying(2) NOT NULL,
    r1 boolean DEFAULT false,
    r2 boolean DEFAULT false,
    r3 boolean DEFAULT false,
    r4 boolean DEFAULT false,
    r5 boolean DEFAULT false,
    r6 boolean DEFAULT false,
    r7 boolean DEFAULT false,
    r8 boolean DEFAULT false
);
    DROP TABLE public.monitor;
       public         postgres    false    3            �            1259    17507    playlist    TABLE     �   CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    paylist_name character varying(25),
    id_user integer
);
    DROP TABLE public.playlist;
       public         postgres    false    3            �            1259    17505    playlist_id_playlist_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.playlist_id_playlist_seq;
       public       postgres    false    3    202            x           0    0    playlist_id_playlist_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.playlist_id_playlist_seq OWNED BY public.playlist.id_playlist;
            public       postgres    false    201            �            1259    17538    playlist_song    TABLE     �   CREATE TABLE public.playlist_song (
    id_playlist_song integer NOT NULL,
    id_playlist integer NOT NULL,
    id_song integer NOT NULL
);
 !   DROP TABLE public.playlist_song;
       public         postgres    false    3            �            1259    17536 "   playlist_song_id_playlist_song_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_song_id_playlist_song_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.playlist_song_id_playlist_song_seq;
       public       postgres    false    206    3            y           0    0 "   playlist_song_id_playlist_song_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.playlist_song_id_playlist_song_seq OWNED BY public.playlist_song.id_playlist_song;
            public       postgres    false    205            �            1259    17520    request    TABLE     �   CREATE TABLE public.request (
    id_request integer NOT NULL,
    date_req date NOT NULL,
    id_song integer NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    17518    request_id_request_seq    SEQUENCE     �   CREATE SEQUENCE public.request_id_request_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.request_id_request_seq;
       public       postgres    false    3    204            z           0    0    request_id_request_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.request_id_request_seq OWNED BY public.request.id_request;
            public       postgres    false    203            �            1259    25885    song    TABLE     1  CREATE TABLE public.song (
    id_song integer NOT NULL,
    song_name character varying(35) NOT NULL,
    genre character varying(30) NOT NULL,
    url character varying(200) NOT NULL,
    enabled boolean DEFAULT true,
    id_artist integer NOT NULL,
    id_album integer,
    fecha_pub date NOT NULL
);
    DROP TABLE public.song;
       public         postgres    false    3            �            1259    25883    song_id_song_seq    SEQUENCE     �   CREATE SEQUENCE public.song_id_song_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.song_id_song_seq;
       public       postgres    false    213    3            {           0    0    song_id_song_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.song_id_song_seq OWNED BY public.song.id_song;
            public       postgres    false    212            �            1259    17020    user_request    TABLE     d   CREATE TABLE public.user_request (
    id_user integer NOT NULL,
    id_request integer NOT NULL
);
     DROP TABLE public.user_request;
       public         postgres    false    3            �            1259    17580    usuario    TABLE       CREATE TABLE public.usuario (
    id_user integer NOT NULL,
    username character varying(25) NOT NULL,
    contrasena character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    id_monitor integer,
    id_manager integer,
    id_artist integer
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    17578    usuario_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.usuario_id_user_seq;
       public       postgres    false    208    3            |           0    0    usuario_id_user_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.usuario_id_user_seq OWNED BY public.usuario.id_user;
            public       postgres    false    207            �
           2604    17477    album id_album    DEFAULT     p   ALTER TABLE ONLY public.album ALTER COLUMN id_album SET DEFAULT nextval('public.album_id_album_seq'::regclass);
 =   ALTER TABLE public.album ALTER COLUMN id_album DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    17510    playlist id_playlist    DEFAULT     |   ALTER TABLE ONLY public.playlist ALTER COLUMN id_playlist SET DEFAULT nextval('public.playlist_id_playlist_seq'::regclass);
 C   ALTER TABLE public.playlist ALTER COLUMN id_playlist DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    17541    playlist_song id_playlist_song    DEFAULT     �   ALTER TABLE ONLY public.playlist_song ALTER COLUMN id_playlist_song SET DEFAULT nextval('public.playlist_song_id_playlist_song_seq'::regclass);
 M   ALTER TABLE public.playlist_song ALTER COLUMN id_playlist_song DROP DEFAULT;
       public       postgres    false    206    205    206            �
           2604    17523    request id_request    DEFAULT     x   ALTER TABLE ONLY public.request ALTER COLUMN id_request SET DEFAULT nextval('public.request_id_request_seq'::regclass);
 A   ALTER TABLE public.request ALTER COLUMN id_request DROP DEFAULT;
       public       postgres    false    204    203    204            �
           2604    25888    song id_song    DEFAULT     l   ALTER TABLE ONLY public.song ALTER COLUMN id_song SET DEFAULT nextval('public.song_id_song_seq'::regclass);
 ;   ALTER TABLE public.song ALTER COLUMN id_song DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    17583    usuario id_user    DEFAULT     r   ALTER TABLE ONLY public.usuario ALTER COLUMN id_user SET DEFAULT nextval('public.usuario_id_user_seq'::regclass);
 >   ALTER TABLE public.usuario ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    208    207    208            b          0    17474    album 
   TABLE DATA               S   COPY public.album (id_album, album_name, date_pub, id_artist, enabled) FROM stdin;
    public       postgres    false    200            `          0    17454    artist 
   TABLE DATA               T   COPY public.artist (id_artist, art_name, date_sub, id_manager, enabled) FROM stdin;
    public       postgres    false    198            l          0    17683    bitacora 
   TABLE DATA               J   COPY public.bitacora (id_bitacora, accion, tabla, fecha_hora) FROM stdin;
    public       postgres    false    210            _          0    17443    manager 
   TABLE DATA               N   COPY public.manager (id_manager, date_sub, enabled, name_manager) FROM stdin;
    public       postgres    false    197            k          0    17658    monitor 
   TABLE DATA               S   COPY public.monitor (id_monitor, tipo, r1, r2, r3, r4, r5, r6, r7, r8) FROM stdin;
    public       postgres    false    209            d          0    17507    playlist 
   TABLE DATA               F   COPY public.playlist (id_playlist, paylist_name, id_user) FROM stdin;
    public       postgres    false    202            h          0    17538    playlist_song 
   TABLE DATA               O   COPY public.playlist_song (id_playlist_song, id_playlist, id_song) FROM stdin;
    public       postgres    false    206            f          0    17520    request 
   TABLE DATA               I   COPY public.request (id_request, date_req, id_song, id_user) FROM stdin;
    public       postgres    false    204            o          0    25885    song 
   TABLE DATA               g   COPY public.song (id_song, song_name, genre, url, enabled, id_artist, id_album, fecha_pub) FROM stdin;
    public       postgres    false    213            ^          0    17020    user_request 
   TABLE DATA               ;   COPY public.user_request (id_user, id_request) FROM stdin;
    public       postgres    false    196            j          0    17580    usuario 
   TABLE DATA               l   COPY public.usuario (id_user, username, contrasena, enabled, id_monitor, id_manager, id_artist) FROM stdin;
    public       postgres    false    208            }           0    0    album_id_album_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.album_id_album_seq', 10, true);
            public       postgres    false    199            ~           0    0    bitacora_id_bitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 1, false);
            public       postgres    false    211                       0    0    playlist_id_playlist_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.playlist_id_playlist_seq', 7, true);
            public       postgres    false    201            �           0    0 "   playlist_song_id_playlist_song_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.playlist_song_id_playlist_song_seq', 34, true);
            public       postgres    false    205            �           0    0    request_id_request_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.request_id_request_seq', 14, true);
            public       postgres    false    203            �           0    0    song_id_song_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.song_id_song_seq', 25, true);
            public       postgres    false    212            �           0    0    usuario_id_user_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.usuario_id_user_seq', 21, true);
            public       postgres    false    207            �
           2606    17480    album album_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);
 :   ALTER TABLE ONLY public.album DROP CONSTRAINT album_pkey;
       public         postgres    false    200            �
           2606    17461    artist artist_art_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_art_name_key UNIQUE (art_name);
 D   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_art_name_key;
       public         postgres    false    198            �
           2606    17459    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id_artist);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public         postgres    false    198            �
           2606    17448    manager manager_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id_manager);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public         postgres    false    197            �
           2606    17670    monitor monitor_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.monitor
    ADD CONSTRAINT monitor_pkey PRIMARY KEY (id_monitor);
 >   ALTER TABLE ONLY public.monitor DROP CONSTRAINT monitor_pkey;
       public         postgres    false    209            �
           2606    17512    playlist playlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);
 @   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_pkey;
       public         postgres    false    202            �
           2606    17543     playlist_song playlist_song_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.playlist_song
    ADD CONSTRAINT playlist_song_pkey PRIMARY KEY (id_playlist_song);
 J   ALTER TABLE ONLY public.playlist_song DROP CONSTRAINT playlist_song_pkey;
       public         postgres    false    206            �
           2606    17525    request request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id_request);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    204            �
           2606    25891    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);
 8   ALTER TABLE ONLY public.song DROP CONSTRAINT song_pkey;
       public         postgres    false    213            �
           2606    17586    usuario usuario_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    208            �
           2606    17481    album album_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 D   ALTER TABLE ONLY public.album DROP CONSTRAINT album_id_artist_fkey;
       public       postgres    false    200    198    2768            �
           2606    17467    artist artist_id_manager_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_id_manager_fkey FOREIGN KEY (id_manager) REFERENCES public.manager(id_manager);
 G   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_id_manager_fkey;
       public       postgres    false    2764    197    198            �
           2606    17544 ,   playlist_song playlist_song_id_playlist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist_song
    ADD CONSTRAINT playlist_song_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlist(id_playlist);
 V   ALTER TABLE ONLY public.playlist_song DROP CONSTRAINT playlist_song_id_playlist_fkey;
       public       postgres    false    2772    206    202            �
           2606    25897    song song_id_album_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_id_album_fkey FOREIGN KEY (id_album) REFERENCES public.album(id_album);
 A   ALTER TABLE ONLY public.song DROP CONSTRAINT song_id_album_fkey;
       public       postgres    false    213    200    2770            �
           2606    25892    song song_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 B   ALTER TABLE ONLY public.song DROP CONSTRAINT song_id_artist_fkey;
       public       postgres    false    213    2768    198            �
           2606    26177    usuario usuario_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 H   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_artist_fkey;
       public       postgres    false    208    198    2768            b   n  x�E��N1��O��i��?�*�&ޔ�*5ek�]����E���L�+���z���@0�(˩ȀC3�N8c/�*\RV\�&_��d�Z��)���]9ey'dp�6���ɅF�o���BB�9̜u^���A�B3�KG���JU1��,���6�T�Gk�Y��>��9�c���>U��Q�W]��eN9���p���u�d�O�����u��7�U0��{#.`aIksr�A&�KNm]�x�Rv;M�ф@֪�Vd1�ˎO������E4��<�E�},G��Wr���@�dǃ0��.�P�(fw�����k���öպ&��������_�%�2ֶ����E��`>�F���(�      `   �   x�-�A
�@E��)��d��viAܸ����TZ+x{�*d������E>`��Ȍ��
^��s�%����H�|f)lFg���~-���L2ؙڵ�(ɐX��p�7��ά�{'s��t��	KX7}^щ9t޵��#U�,���*�?�V���Ɖ7�n�I��/�*\I�|%�7�      l      x������ � �      _   U   x�U�1
�0D�z�.+;��$w�I����`���*n%Ջ�r����"h/�Z�����mB]X�(��:!�i6��l���L      k   &   x�3�t�,�4�2�t���2\Ɯ��=... ��      d   k   x�3�JM���K��M��44�2��O��44�2�t-.H|�o~�k�锘�T��W�	T�e��X���q�qz9%�e��F\�!�ᩩ�y)� �\1z\\\ J \      h   �   x���@г�Q����_��^|1!���\(��`�Sئq���Bx�D.Q���d9�������A{�����w-�egFk�լ	�hpĀ;ƕ<���^���t-;��EqP%.�������!�      f   t  x�m�[r#+��f/>�.����u�D�3�Uy�J7p�z�s�t��z��/ȇ�3����4�>�?l���p�(i��̬��������]�������k�C��*d�lD����D��T�Z��_�];�;t��K��ğL��(��7������F#?hŁ�qc:���@��o���
4����؀��|/���ΨQ4�t iB%Q�ݯ�1Bb�&߻�O�V�I
4��e@�7+- m⥼v kJ@Ҕ�f�s���V�ZH�ZM�@�qŨ4��%q������0��@چ�6&P̵����(를Q)o\����f
�ȚY�	s�Zˁ��T�6	H��xN���T ns �6(:��*9���+���e�%�y��� �Z��2�(?k⪉D��o��pis�$@�KH���܀��1������%�:�Ŏ�Fa�a�x���3��e�e�u��`13�ڃ�s�z"�$�8�->�bf�K�	�����]���/w���=�/q}Yk߽�c'��(�c�X��w�.��w�������Z~�a�8��ƿ-f��s�s��k`�w^l��9��b��ZO��S��i�Y�s���.6��޺��E��kܠ�1X~����9�w�c�8���������X�Ͽt�c��Ϥ�0���y�=,{̋-����f��hR�;�br�U�8�<�1r5�4��e^l]r���`1�"��e�%Njߥ���{-�o8�b�b}�_����`���uf?��;����	��,gq����{��N`ƥw�����~�Cv_������9,�t��KT{_r,�Kz�=ϡ;�����{�u1��q����bf�x�X.�,������]l�e��}����'���#w7��<7B�\L/=�sخg`q��>�s�%�k��r�}���%N.qZ���|�g`�v�����}>��޹���W�b\��������������c��	����\�q�>����}>rO���\�ĝ��m��|��s��O��Ɲ���޹��8��ѹ��~�v�����|�O���������w5,fY��[����Xr�U�8�:ϱ�.�����b���p��Η8�����<G�nv�,��X>��ROz�0*��s�+].���9d����	��X��ը�D������R�<�~dK�����%����k�K�,��%�<��wX�N��]`q/쵞�Q�!�k"�\�}�<��8�z,�.�|H�`q^���X�F�`1�J�O���<G�dQ��	��,�z�������_|ɕ:�P���q�#w������}���ZϨ�3��3��^�<G�K1��˾,��,���/F5w��,�ej������QεY      o   �  x���M��6���_�\zK+R��d��.����E�^F2m3K�E9U}IIַ]XǇ�̼�2�
�5���#r�J���P�c�>z�G�H$��;�q,��(��a�&� W�"[����l����HJ��8�%)�Ρ��lNUkb8j����_*U˞g��<u|��h��;0sp�A��f�=�;.��皛�}�	8�z ���(J8�s��FJ!��Iѐ���l�m���+�	��QΧ�9nC]]h�]�f@4�!�X�K�0[%i\J��2v��kC�gXqz�&\k8��^���΍��h
��"X(�{����m���=�Ή���7`�0��Vf��:��j�����E:�s�%VV�U��Nv�Ɛ��[5�u�皜5��Z���g:�� 2n�0a�V�؄�`N�"�q����a|V�q�1бJ�v,�'�`�[չa8���<�x������>9����ar�|^N���` (<)�9��~f�o'<s��/UO/�ESGڶ}�xC���wg���ҝ��������a������es��S�F3(���<H�c.��zÛҺY�r�s&��K:nJǥ���q��Y��6��.� &M���
�������h2�����w�����3� �K��&���_[���^�*�8�̊��3��"k�JI>�]Z/j�+�l��yeoU���::ܘZ?�N�M.
�ws�C~/9�MT���~Pj-�7��F�g(�W��%ܪ�ɡ���fҍh ��P�M�0�ǚ��2w6u������:�6{f�Dg@/u.��ц~1]��]B�Q�1N�kJ�و�Ȼ��0�2�e������?�B�� ��<�\�?\b��,�0�. ќ�����{ai'���`Z���1�$��Z^:����nZ6��	�Q��7#s�:_��#��)|V�4k/��?�v�� ����      ^   =   x�˻�0��x����^�|�%��)ŐC�Vkx��;��"�"��YN������&      j     x�U�]n�0 �g�0	I�K�}	��҆�&Щ;���&!Y�g+�a�H�I�<h�V8}���������%Lwo)�+�5�x+�J�20�%��g�wύ�?9����duj>�EQH@����g
�K�z�h�V�p�uf�Jn%���v�:X&����y�þXaJ�ڙ�q(4�ٻ��Q����S��B���^9���b0=�<��;+^���Ӌ�μp�S
�@_�6J&�Y�R�p���uh�~Q*�ά������;} ��G��      \    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1255    17671    bitacora_album()    FUNCTION     "  CREATE FUNCTION public.bitacora_album() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 '   DROP FUNCTION public.bitacora_album();
       public       postgres    false    3            �            1255    17672    bitacora_artista()    FUNCTION     -  CREATE FUNCTION public.bitacora_artista() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_artista();
       public       postgres    false    3            �            1255    17673    bitacora_manager()    FUNCTION     *  CREATE FUNCTION public.bitacora_manager() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_manager();
       public       postgres    false    3            �            1255    17674    bitacora_playlist()    FUNCTION     .  CREATE FUNCTION public.bitacora_playlist() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 *   DROP FUNCTION public.bitacora_playlist();
       public       postgres    false    3            �            1255    17675    bitacora_tracks()    FUNCTION        CREATE FUNCTION public.bitacora_tracks() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 (   DROP FUNCTION public.bitacora_tracks();
       public       postgres    false    3            �            1255    17676    bitacora_usuario()    FUNCTION     -  CREATE FUNCTION public.bitacora_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.bitacora_usuario();
       public       postgres    false    3            �            1255    17393 4   cambiar_info_album(integer, character varying, date)    FUNCTION       CREATE FUNCTION public.cambiar_info_album(insert_id_album integer, nombre_album character varying, new_date date) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update album 
	set album_name = nombre_album, date_pub = new_date
	where id_album = insert_id_album;
END;
$$;
 q   DROP FUNCTION public.cambiar_info_album(insert_id_album integer, nombre_album character varying, new_date date);
       public       postgres    false    3            �            1255    17392 V   cambiar_info_cancion(integer, character varying, character varying, character varying)    FUNCTION     J  CREATE FUNCTION public.cambiar_info_cancion(insert_id_song integer, nombre_cancion character varying, genero character varying, insert_url character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update song 
	set song_name = nombre_cancion, genero = genre, url = insert_url
	where id_song = insert_id_song;
END;
$$;
 �   DROP FUNCTION public.cambiar_info_cancion(insert_id_song integer, nombre_cancion character varying, genero character varying, insert_url character varying);
       public       postgres    false    3            �            1255    17677 #   desactivar_album(character varying)    FUNCTION     I  CREATE FUNCTION public.desactivar_album(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
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
$$;
 K   DROP FUNCTION public.desactivar_album(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17678 %   desactivar_artista(character varying)    FUNCTION       CREATE FUNCTION public.desactivar_artista(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update usuario
	set enabled = false
	from artist
	where artist.id_artist = usuario.id_user and artist.art_name = nombre_insertado;
END;
$$;
 M   DROP FUNCTION public.desactivar_artista(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17679 %   desactivar_cancion(character varying)    FUNCTION     �   CREATE FUNCTION public.desactivar_cancion(nombre_insertado character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	update song 
	set enabled = false
	where song_name = nombre_insertado;
END;
$$;
 M   DROP FUNCTION public.desactivar_cancion(nombre_insertado character varying);
       public       postgres    false    3            �            1255    17680    desactivar_usuario(integer)    FUNCTION     �  CREATE FUNCTION public.desactivar_usuario(id_insertado integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF ((SELECT COUNT(*) FROM artist WHERE id_artist = id_insertado)>0 OR (SELECT COUNT(*) FROM manager WHERE id_manager = id_insertado)>0) THEN
		RAISE EXCEPTION 'Este Usuario tiene suscripcion, por lo tanto no se puede desactivar.';
	ELSE
		update usuario
		set enabled = false
		where usuario.id_user = id_insertado;
	END IF;
END;
$$;
 ?   DROP FUNCTION public.desactivar_usuario(id_insertado integer);
       public       postgres    false    3            �            1255    17681    eliminar_suscripcion(integer)    FUNCTION       CREATE FUNCTION public.eliminar_suscripcion(id_insertado integer) RETURNS void
    LANGUAGE plpgsql
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
$$;
 A   DROP FUNCTION public.eliminar_suscripcion(id_insertado integer);
       public       postgres    false    3            �            1255    17682 &   eliminar_suscripcion(integer, integer)    FUNCTION     E  CREATE FUNCTION public.eliminar_suscripcion(opcion integer, id_user_insert integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (opcion == 1) THEN
		delete from artist
		where id_artist = id_user_insert;
	END IF;
	
	IF (opcion == 2) THEN
		delete from manager
		where id_manager = id_user_insert;
	END IF;
END;
$$;
 S   DROP FUNCTION public.eliminar_suscripcion(opcion integer, id_user_insert integer);
       public       postgres    false    3            �            1255    17654    eliminate_monitor()    FUNCTION     �   CREATE FUNCTION public.eliminate_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	delete from Monitor where id_monitor = OLD.id_monitor;
	--delete id_monitor from usuario where id_monitor = OLD.id_monitor;
	return new;
End
$$;
 *   DROP FUNCTION public.eliminate_monitor();
       public       postgres    false    3            �            1255    17656    insert_monitor()    FUNCTION     �   CREATE FUNCTION public.insert_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into Monitor values (new.id_monitor, new.tipo, new.r1, new.r2, new.r3, new.r4, new.r5, new.r6, new.r7, new.r8);
	return new;
End
$$;
 '   DROP FUNCTION public.insert_monitor();
       public       postgres    false    3            �            1255    17631 v   monitor_1(integer, integer, character varying, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean)    FUNCTION     �  CREATE FUNCTION public.monitor_1(asigusu integer, monitor_id integer, tipo character varying, r1 boolean, r2 boolean, r3 boolean, r4 boolean, r5 boolean, r6 boolean, r7 boolean, r8 boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN	
	insert into Monitor values (AsigUsu, monitor_id, tipo, R1, R2, R3, R4, R5, R6, R7, R8);
	--insert into usuario(id_monitor) values (new.id_monitor);
	update usuarios set id_monitor = monitor_id where id_user = AsigUsu;
END;
$$;
 �   DROP FUNCTION public.monitor_1(asigusu integer, monitor_id integer, tipo character varying, r1 boolean, r2 boolean, r3 boolean, r4 boolean, r5 boolean, r6 boolean, r7 boolean, r8 boolean);
       public       postgres    false    3            �            1255    17554    reporteria_1(date, date)    FUNCTION     ]  CREATE FUNCTION public.reporteria_1(fecha1 date, fecha2 date) RETURNS TABLE(fecha text, reproducciones bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN	
	return QUERY(
		select to_char(re.date_req, 'dd/mm/yy') as fecha, count(re.id_request) as reproducciones
		from request re
		where re.date_req between fecha1 and fecha2
		group by fecha
	);
END;
$$;
 =   DROP FUNCTION public.reporteria_1(fecha1 date, fecha2 date);
       public       postgres    false    3            �            1255    17433 !   reporteria_2(date, date, integer)    FUNCTION     �  CREATE FUNCTION public.reporteria_2(fecha1 date, fecha2 date, can_artista integer) RETURNS TABLE(artistas character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 R   DROP FUNCTION public.reporteria_2(fecha1 date, fecha2 date, can_artista integer);
       public       postgres    false    3            �            1255    17429    reporteria_3(date, date)    FUNCTION     �  CREATE FUNCTION public.reporteria_3(fecha1 date, fecha2 date) RETURNS TABLE(genero character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 =   DROP FUNCTION public.reporteria_3(fecha1 date, fecha2 date);
       public       postgres    false    3            �            1255    17430 (   reporteria_4(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reporteria_4(artista character varying, num integer) RETURNS TABLE(song character varying, reproducciones bigint)
    LANGUAGE plpgsql
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
$$;
 K   DROP FUNCTION public.reporteria_4(artista character varying, num integer);
       public       postgres    false    3            �            1255    17644    update_id_monitor()    FUNCTION     �   CREATE FUNCTION public.update_id_monitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	update usuario set id_monitor = new.id_monitor where id_user = OLD.id_user;
	return new;
End
$$;
 *   DROP FUNCTION public.update_id_monitor();
       public       postgres    false    3            �            1259    17474    album    TABLE     �   CREATE TABLE public.album (
    id_album integer NOT NULL,
    album_name character varying(30) NOT NULL,
    date_pub date NOT NULL,
    id_artist integer NOT NULL,
    enabled boolean DEFAULT true
);
    DROP TABLE public.album;
       public         postgres    false    3            �            1259    17472    album_id_album_seq    SEQUENCE     �   CREATE SEQUENCE public.album_id_album_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.album_id_album_seq;
       public       postgres    false    200    3            v           0    0    album_id_album_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.album_id_album_seq OWNED BY public.album.id_album;
            public       postgres    false    199            �            1259    17454    artist    TABLE     �   CREATE TABLE public.artist (
    id_artist integer NOT NULL,
    art_name character varying(25) NOT NULL,
    date_sub date NOT NULL,
    id_manager integer,
    enabled boolean DEFAULT true
);
    DROP TABLE public.artist;
       public         postgres    false    3            �            1259    17683    bitacora    TABLE     �   CREATE TABLE public.bitacora (
    id_bitacora integer NOT NULL,
    accion character varying(20) NOT NULL,
    tabla character varying(30) NOT NULL,
    fecha_hora timestamp without time zone NOT NULL
);
    DROP TABLE public.bitacora;
       public         postgres    false    3            �            1259    17686    bitacora_id_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_id_bitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_id_bitacora_seq;
       public       postgres    false    210    3            w           0    0    bitacora_id_bitacora_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;
            public       postgres    false    211            �            1259    17443    manager    TABLE     �   CREATE TABLE public.manager (
    id_manager integer NOT NULL,
    date_sub date,
    enabled boolean DEFAULT true,
    name_manager character varying(30)
);
    DROP TABLE public.manager;
       public         postgres    false    3            �            1259    17658    monitor    TABLE     Y  CREATE TABLE public.monitor (
    id_monitor integer NOT NULL,
    tipo character varying(2) NOT NULL,
    r1 boolean DEFAULT false,
    r2 boolean DEFAULT false,
    r3 boolean DEFAULT false,
    r4 boolean DEFAULT false,
    r5 boolean DEFAULT false,
    r6 boolean DEFAULT false,
    r7 boolean DEFAULT false,
    r8 boolean DEFAULT false
);
    DROP TABLE public.monitor;
       public         postgres    false    3            �            1259    17507    playlist    TABLE     �   CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    paylist_name character varying(25),
    id_user integer
);
    DROP TABLE public.playlist;
       public         postgres    false    3            �            1259    17505    playlist_id_playlist_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.playlist_id_playlist_seq;
       public       postgres    false    3    202            x           0    0    playlist_id_playlist_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.playlist_id_playlist_seq OWNED BY public.playlist.id_playlist;
            public       postgres    false    201            �            1259    17538    playlist_song    TABLE     �   CREATE TABLE public.playlist_song (
    id_playlist_song integer NOT NULL,
    id_playlist integer NOT NULL,
    id_song integer NOT NULL
);
 !   DROP TABLE public.playlist_song;
       public         postgres    false    3            �            1259    17536 "   playlist_song_id_playlist_song_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_song_id_playlist_song_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.playlist_song_id_playlist_song_seq;
       public       postgres    false    206    3            y           0    0 "   playlist_song_id_playlist_song_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.playlist_song_id_playlist_song_seq OWNED BY public.playlist_song.id_playlist_song;
            public       postgres    false    205            �            1259    17520    request    TABLE     �   CREATE TABLE public.request (
    id_request integer NOT NULL,
    date_req date NOT NULL,
    id_song integer NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    17518    request_id_request_seq    SEQUENCE     �   CREATE SEQUENCE public.request_id_request_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.request_id_request_seq;
       public       postgres    false    3    204            z           0    0    request_id_request_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.request_id_request_seq OWNED BY public.request.id_request;
            public       postgres    false    203            �            1259    25885    song    TABLE     1  CREATE TABLE public.song (
    id_song integer NOT NULL,
    song_name character varying(35) NOT NULL,
    genre character varying(30) NOT NULL,
    url character varying(200) NOT NULL,
    enabled boolean DEFAULT true,
    id_artist integer NOT NULL,
    id_album integer,
    fecha_pub date NOT NULL
);
    DROP TABLE public.song;
       public         postgres    false    3            �            1259    25883    song_id_song_seq    SEQUENCE     �   CREATE SEQUENCE public.song_id_song_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.song_id_song_seq;
       public       postgres    false    213    3            {           0    0    song_id_song_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.song_id_song_seq OWNED BY public.song.id_song;
            public       postgres    false    212            �            1259    17020    user_request    TABLE     d   CREATE TABLE public.user_request (
    id_user integer NOT NULL,
    id_request integer NOT NULL
);
     DROP TABLE public.user_request;
       public         postgres    false    3            �            1259    17580    usuario    TABLE       CREATE TABLE public.usuario (
    id_user integer NOT NULL,
    username character varying(25) NOT NULL,
    contrasena character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    id_monitor integer,
    id_manager integer,
    id_artist integer
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    17578    usuario_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.usuario_id_user_seq;
       public       postgres    false    208    3            |           0    0    usuario_id_user_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.usuario_id_user_seq OWNED BY public.usuario.id_user;
            public       postgres    false    207            �
           2604    17477    album id_album    DEFAULT     p   ALTER TABLE ONLY public.album ALTER COLUMN id_album SET DEFAULT nextval('public.album_id_album_seq'::regclass);
 =   ALTER TABLE public.album ALTER COLUMN id_album DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    17510    playlist id_playlist    DEFAULT     |   ALTER TABLE ONLY public.playlist ALTER COLUMN id_playlist SET DEFAULT nextval('public.playlist_id_playlist_seq'::regclass);
 C   ALTER TABLE public.playlist ALTER COLUMN id_playlist DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    17541    playlist_song id_playlist_song    DEFAULT     �   ALTER TABLE ONLY public.playlist_song ALTER COLUMN id_playlist_song SET DEFAULT nextval('public.playlist_song_id_playlist_song_seq'::regclass);
 M   ALTER TABLE public.playlist_song ALTER COLUMN id_playlist_song DROP DEFAULT;
       public       postgres    false    206    205    206            �
           2604    17523    request id_request    DEFAULT     x   ALTER TABLE ONLY public.request ALTER COLUMN id_request SET DEFAULT nextval('public.request_id_request_seq'::regclass);
 A   ALTER TABLE public.request ALTER COLUMN id_request DROP DEFAULT;
       public       postgres    false    204    203    204            �
           2604    25888    song id_song    DEFAULT     l   ALTER TABLE ONLY public.song ALTER COLUMN id_song SET DEFAULT nextval('public.song_id_song_seq'::regclass);
 ;   ALTER TABLE public.song ALTER COLUMN id_song DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    17583    usuario id_user    DEFAULT     r   ALTER TABLE ONLY public.usuario ALTER COLUMN id_user SET DEFAULT nextval('public.usuario_id_user_seq'::regclass);
 >   ALTER TABLE public.usuario ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    208    207    208            b          0    17474    album 
   TABLE DATA               S   COPY public.album (id_album, album_name, date_pub, id_artist, enabled) FROM stdin;
    public       postgres    false    200   A       `          0    17454    artist 
   TABLE DATA               T   COPY public.artist (id_artist, art_name, date_sub, id_manager, enabled) FROM stdin;
    public       postgres    false    198   �       l          0    17683    bitacora 
   TABLE DATA               J   COPY public.bitacora (id_bitacora, accion, tabla, fecha_hora) FROM stdin;
    public       postgres    false    210   �       _          0    17443    manager 
   TABLE DATA               N   COPY public.manager (id_manager, date_sub, enabled, name_manager) FROM stdin;
    public       postgres    false    197   �       k          0    17658    monitor 
   TABLE DATA               S   COPY public.monitor (id_monitor, tipo, r1, r2, r3, r4, r5, r6, r7, r8) FROM stdin;
    public       postgres    false    209          d          0    17507    playlist 
   TABLE DATA               F   COPY public.playlist (id_playlist, paylist_name, id_user) FROM stdin;
    public       postgres    false    202   >       h          0    17538    playlist_song 
   TABLE DATA               O   COPY public.playlist_song (id_playlist_song, id_playlist, id_song) FROM stdin;
    public       postgres    false    206   �       f          0    17520    request 
   TABLE DATA               I   COPY public.request (id_request, date_req, id_song, id_user) FROM stdin;
    public       postgres    false    204   I	       o          0    25885    song 
   TABLE DATA               g   COPY public.song (id_song, song_name, genre, url, enabled, id_artist, id_album, fecha_pub) FROM stdin;
    public       postgres    false    213   �       ^          0    17020    user_request 
   TABLE DATA               ;   COPY public.user_request (id_user, id_request) FROM stdin;
    public       postgres    false    196   �       j          0    17580    usuario 
   TABLE DATA               l   COPY public.usuario (id_user, username, contrasena, enabled, id_monitor, id_manager, id_artist) FROM stdin;
    public       postgres    false    208   �       }           0    0    album_id_album_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.album_id_album_seq', 10, true);
            public       postgres    false    199            ~           0    0    bitacora_id_bitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 1, false);
            public       postgres    false    211                       0    0    playlist_id_playlist_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.playlist_id_playlist_seq', 7, true);
            public       postgres    false    201            �           0    0 "   playlist_song_id_playlist_song_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.playlist_song_id_playlist_song_seq', 34, true);
            public       postgres    false    205            �           0    0    request_id_request_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.request_id_request_seq', 14, true);
            public       postgres    false    203            �           0    0    song_id_song_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.song_id_song_seq', 25, true);
            public       postgres    false    212            �           0    0    usuario_id_user_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.usuario_id_user_seq', 21, true);
            public       postgres    false    207            �
           2606    17480    album album_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);
 :   ALTER TABLE ONLY public.album DROP CONSTRAINT album_pkey;
       public         postgres    false    200            �
           2606    17461    artist artist_art_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_art_name_key UNIQUE (art_name);
 D   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_art_name_key;
       public         postgres    false    198            �
           2606    17459    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id_artist);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public         postgres    false    198            �
           2606    17448    manager manager_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id_manager);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public         postgres    false    197            �
           2606    17670    monitor monitor_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.monitor
    ADD CONSTRAINT monitor_pkey PRIMARY KEY (id_monitor);
 >   ALTER TABLE ONLY public.monitor DROP CONSTRAINT monitor_pkey;
       public         postgres    false    209            �
           2606    17512    playlist playlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);
 @   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_pkey;
       public         postgres    false    202            �
           2606    17543     playlist_song playlist_song_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.playlist_song
    ADD CONSTRAINT playlist_song_pkey PRIMARY KEY (id_playlist_song);
 J   ALTER TABLE ONLY public.playlist_song DROP CONSTRAINT playlist_song_pkey;
       public         postgres    false    206            �
           2606    17525    request request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id_request);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    204            �
           2606    25891    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);
 8   ALTER TABLE ONLY public.song DROP CONSTRAINT song_pkey;
       public         postgres    false    213            �
           2606    17586    usuario usuario_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    208            �
           2606    17481    album album_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 D   ALTER TABLE ONLY public.album DROP CONSTRAINT album_id_artist_fkey;
       public       postgres    false    200    198    2768            �
           2606    17467    artist artist_id_manager_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_id_manager_fkey FOREIGN KEY (id_manager) REFERENCES public.manager(id_manager);
 G   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_id_manager_fkey;
       public       postgres    false    2764    197    198            �
           2606    17544 ,   playlist_song playlist_song_id_playlist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist_song
    ADD CONSTRAINT playlist_song_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlist(id_playlist);
 V   ALTER TABLE ONLY public.playlist_song DROP CONSTRAINT playlist_song_id_playlist_fkey;
       public       postgres    false    2772    206    202            �
           2606    25897    song song_id_album_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_id_album_fkey FOREIGN KEY (id_album) REFERENCES public.album(id_album);
 A   ALTER TABLE ONLY public.song DROP CONSTRAINT song_id_album_fkey;
       public       postgres    false    213    200    2770            �
           2606    25892    song song_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 B   ALTER TABLE ONLY public.song DROP CONSTRAINT song_id_artist_fkey;
       public       postgres    false    213    2768    198            �
           2606    26177    usuario usuario_id_artist_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_artist_fkey FOREIGN KEY (id_artist) REFERENCES public.artist(id_artist);
 H   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_artist_fkey;
       public       postgres    false    208    198    2768           