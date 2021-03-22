PGDMP                         y            Proyecto1BD    10.15    10.15                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            !           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1259    17005    album    TABLE     �   CREATE TABLE public.album (
    id_album integer NOT NULL,
    album_name character varying(30),
    date_pub date,
    id_artist integer
);
    DROP TABLE public.album;
       public         postgres    false    3            �            1259    16985    artist    TABLE     �   CREATE TABLE public.artist (
    id_artist integer NOT NULL,
    art_name character varying(25),
    date_sub date,
    id_user integer,
    id_manager integer
);
    DROP TABLE public.artist;
       public         postgres    false    3            �            1259    16990    manager    TABLE     r   CREATE TABLE public.manager (
    id_manager integer NOT NULL,
    date_sub date,
    id_user integer NOT NULL
);
    DROP TABLE public.manager;
       public         postgres    false    3            �            1259    17010    playlist    TABLE     �   CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    paylist_name character varying(25),
    id_user integer
);
    DROP TABLE public.playlist;
       public         postgres    false    3            �            1259    17023    playlist_song    TABLE     f   CREATE TABLE public.playlist_song (
    id_playlist integer NOT NULL,
    id_song integer NOT NULL
);
 !   DROP TABLE public.playlist_song;
       public         postgres    false    3            �            1259    17015    request    TABLE     i   CREATE TABLE public.request (
    id_request integer NOT NULL,
    date_sub date,
    id_song integer
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    16995    song    TABLE     �   CREATE TABLE public.song (
    id_song integer NOT NULL,
    song_name character varying(35),
    genre character varying(30),
    url character varying(200),
    enabled boolean NOT NULL,
    id_artist integer,
    id_album integer
);
    DROP TABLE public.song;
       public         postgres    false    3            �            1259    17020    user_request    TABLE     d   CREATE TABLE public.user_request (
    id_user integer NOT NULL,
    id_request integer NOT NULL
);
     DROP TABLE public.user_request;
       public         postgres    false    3            �            1259    16980    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_user integer NOT NULL,
    username character varying(25) NOT NULL,
    "contraseña" character varying(25) NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false    3                      0    17005    album 
   TABLE DATA               J   COPY public.album (id_album, album_name, date_pub, id_artist) FROM stdin;
    public       postgres    false    200                      0    16985    artist 
   TABLE DATA               T   COPY public.artist (id_artist, art_name, date_sub, id_user, id_manager) FROM stdin;
    public       postgres    false    197                      0    16990    manager 
   TABLE DATA               @   COPY public.manager (id_manager, date_sub, id_user) FROM stdin;
    public       postgres    false    198                      0    17010    playlist 
   TABLE DATA               F   COPY public.playlist (id_playlist, paylist_name, id_user) FROM stdin;
    public       postgres    false    201                      0    17023    playlist_song 
   TABLE DATA               =   COPY public.playlist_song (id_playlist, id_song) FROM stdin;
    public       postgres    false    204                      0    17015    request 
   TABLE DATA               @   COPY public.request (id_request, date_sub, id_song) FROM stdin;
    public       postgres    false    202                      0    16995    song 
   TABLE DATA               \   COPY public.song (id_song, song_name, genre, url, enabled, id_artist, id_album) FROM stdin;
    public       postgres    false    199                      0    17020    user_request 
   TABLE DATA               ;   COPY public.user_request (id_user, id_request) FROM stdin;
    public       postgres    false    203                      0    16980    usuario 
   TABLE DATA               C   COPY public.usuario (id_user, username, "contraseña") FROM stdin;
    public       postgres    false    196            �
           2606    17009    album album_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);
 :   ALTER TABLE ONLY public.album DROP CONSTRAINT album_pkey;
       public         postgres    false    200            �
           2606    16989    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id_artist);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public         postgres    false    197            �
           2606    16994    manager manager_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id_manager);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public         postgres    false    198            �
           2606    17014    playlist playlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);
 @   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_pkey;
       public         postgres    false    201            �
           2606    17019    request request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id_request);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    202            �
           2606    16999    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);
 8   ALTER TABLE ONLY public.song DROP CONSTRAINT song_pkey;
       public         postgres    false    199            �
           2606    16984    usuario usuario_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    196               �   x�E��N�0@��W����I�#t�6�$.�5kQ���E��ӈ"��z~�����y��=�&M���jx��鰙�r��_��ۏ��؆)�E�G8�>��k6�$#�����i�"�ǐF?�z�hNj+�P�!DN��@�%�}l�8��[�来�"�:سh���0𷏋Z��
�B���_ġ�_)�WP��R��,Q�]��b���D����M�o7��Y�E         �   x�-��JAE׷���BUO�#ˌ� 0n�4vCZC��8B�>=*��ԹG1�����
/ڱ*�
%��sv�9Z�X�ҳo�+kp�F�T��%����$�э��Sl#�E�!�S�Sy�s��a������PW���y.�w��S����e�o��x^s6�~��b�@V[\��NӒ��I�-��.�ێ�n4�4�         C   x�%���0C�s�K��4�݅�砅���W���3|��Nw���9�	#���J�!��s����\ ^K��         j   x�3�JM���K��M��44�2��O��44�2�t-.H<�1?�3�tJLq*�˫��*�2�t,���̸�8��s�2�@|#.sΐ�����켔\�c�=... ��e         V   x���� Dѳ����^����,���n�GX��J)�4��������4�V^���Re�T�hm�6Z�S�Sۆ6�t�= ~���         f   x�M���0��.*D�r�]���ɓ:!�B�A�4B�+-�*�+6�'�c��1��udF���W�~��m�X�6�ؙ�l���tPU��v�=����"$"-         b  x�m��n�0E�W_��,;�y�CW��mӉZY2(9��(q�lZ��%"��B�^�S���xG��Q�H>����d�q%�O�B����G�B�IH���X�׃����<��&щIr�_��&��
����g�5Έ��	�V�ȭpZU�Ohp!O@W�c_�%jea��ìoy���E"��o��6G�҆T��6AT8*S�q��5�z;Gyo)G�ӵ�I���ne���فu��k/�Ά�i��|G/z�Y�Ҏ�X;�w�1F	5���
X�7_�NA/a��Q�i	��C_&>ᢊ��X�(�$[7�~�N���3�A5��F��c���M)�(!�E         =   x�˻�0��x����^�|�%��)ŐC�Vkx��;��"�"��YN������&         �   x�%��r�0E��1��K7�B'�p��L�����g� ��Ȭ�v��-c�J
�~΂]��Y�ޒ�у��$��CQD��>J�Ρ+ց�9����b.�-I�]lٵ�+�b���81�M�����6��Ɵ�"Q�k�S>��H��a��uy�"����{��H��a:tf}.i��à��g�]K��$~tyH��_����e�                     0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            !           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1259    17005    album    TABLE     �   CREATE TABLE public.album (
    id_album integer NOT NULL,
    album_name character varying(30),
    date_pub date,
    id_artist integer
);
    DROP TABLE public.album;
       public         postgres    false    3            �            1259    16985    artist    TABLE     �   CREATE TABLE public.artist (
    id_artist integer NOT NULL,
    art_name character varying(25),
    date_sub date,
    id_user integer,
    id_manager integer
);
    DROP TABLE public.artist;
       public         postgres    false    3            �            1259    16990    manager    TABLE     r   CREATE TABLE public.manager (
    id_manager integer NOT NULL,
    date_sub date,
    id_user integer NOT NULL
);
    DROP TABLE public.manager;
       public         postgres    false    3            �            1259    17010    playlist    TABLE     �   CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    paylist_name character varying(25),
    id_user integer
);
    DROP TABLE public.playlist;
       public         postgres    false    3            �            1259    17023    playlist_song    TABLE     f   CREATE TABLE public.playlist_song (
    id_playlist integer NOT NULL,
    id_song integer NOT NULL
);
 !   DROP TABLE public.playlist_song;
       public         postgres    false    3            �            1259    17015    request    TABLE     i   CREATE TABLE public.request (
    id_request integer NOT NULL,
    date_sub date,
    id_song integer
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    16995    song    TABLE     �   CREATE TABLE public.song (
    id_song integer NOT NULL,
    song_name character varying(35),
    genre character varying(30),
    url character varying(200),
    enabled boolean NOT NULL,
    id_artist integer,
    id_album integer
);
    DROP TABLE public.song;
       public         postgres    false    3            �            1259    17020    user_request    TABLE     d   CREATE TABLE public.user_request (
    id_user integer NOT NULL,
    id_request integer NOT NULL
);
     DROP TABLE public.user_request;
       public         postgres    false    3            �            1259    16980    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_user integer NOT NULL,
    username character varying(25) NOT NULL,
    "contraseña" character varying(25) NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false    3                      0    17005    album 
   TABLE DATA               J   COPY public.album (id_album, album_name, date_pub, id_artist) FROM stdin;
    public       postgres    false    200   7                 0    16985    artist 
   TABLE DATA               T   COPY public.artist (id_artist, art_name, date_sub, id_user, id_manager) FROM stdin;
    public       postgres    false    197                    0    16990    manager 
   TABLE DATA               @   COPY public.manager (id_manager, date_sub, id_user) FROM stdin;
    public       postgres    false    198   �                 0    17010    playlist 
   TABLE DATA               F   COPY public.playlist (id_playlist, paylist_name, id_user) FROM stdin;
    public       postgres    false    201   <                 0    17023    playlist_song 
   TABLE DATA               =   COPY public.playlist_song (id_playlist, id_song) FROM stdin;
    public       postgres    false    204   �                 0    17015    request 
   TABLE DATA               @   COPY public.request (id_request, date_sub, id_song) FROM stdin;
    public       postgres    false    202                     0    16995    song 
   TABLE DATA               \   COPY public.song (id_song, song_name, genre, url, enabled, id_artist, id_album) FROM stdin;
    public       postgres    false    199   �                  0    17020    user_request 
   TABLE DATA               ;   COPY public.user_request (id_user, id_request) FROM stdin;
    public       postgres    false    203                    0    16980    usuario 
   TABLE DATA               C   COPY public.usuario (id_user, username, "contraseña") FROM stdin;
    public       postgres    false    196   Q       �
           2606    17009    album album_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);
 :   ALTER TABLE ONLY public.album DROP CONSTRAINT album_pkey;
       public         postgres    false    200            �
           2606    16989    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id_artist);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public         postgres    false    197            �
           2606    16994    manager manager_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id_manager);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public         postgres    false    198            �
           2606    17014    playlist playlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);
 @   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_pkey;
       public         postgres    false    201            �
           2606    17019    request request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id_request);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    202            �
           2606    16999    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);
 8   ALTER TABLE ONLY public.song DROP CONSTRAINT song_pkey;
       public         postgres    false    199            �
           2606    16984    usuario usuario_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    196           