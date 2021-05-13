const {Pool} = require('pg');
const parameters = require('../config/postgres.config');

const pool = new Pool(parameters);

const getLogin = async (req, res) => {
    const {username, password} = req.params
    const response = await pool.query("SELECT id_user, username, id_artist, id_manager, id_monitor, enabled FROM Usuario WHERE username=$1 AND contrasena=$2", [username, password]);
    res.json(response.rows[0]);
}

/** USERS ------------------------------------------------------------------------------------------------------------------------------------*/
const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM Usuario');
    res.json({rows: response.rows});
};
 
const getUserByUsername = async(req, res) => {
    const response = await pool.query("SELECT * FROM usuario WHERE username=$1", [req.params.username]);
    res.json(response.rows[0]);
}

const addUser = async (req, res) => {
    const {username, password} = req.query;
    await pool.query("INSERT INTO Usuario(username,contrasena) VALUES ($1, $2)", [username, password]);
    const select_response = await pool.query("SELECT id_user, username FROM Usuario WHERE username=$1 AND contrasena=$2", [username, password]);
    res.json(select_response.rows[0]);
};

/** SONGS ------------------------------------------------------------------------------------------------------------------------------------*/
const getSongs = async (req, res) => {
    const response = await pool.query("SELECT * FROM song");
    res.json({rows: response.rows});
};

const getSongsByName = async(req, res) => {
    const response = await pool.query("SELECT * FROM Song WHERE song_name=$1 AND enabled=true", [req.params.name]);
    res.json(response.rows[0]);
};

const getSearchSongs = async (req, res) => {
    const response = await pool.query("SELECT id_song, song_name, genre, url, art_name FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE LOWER(s.song_name) LIKE LOWER('%"+req.params.input+"%') OR LOWER(a.art_name) LIKE LOWER('%"+req.params.input+"%') AND s.enabled = true");
    res.json({rows: response.rows});
}

const getSearchSongsByGenre = async (req, res) => {
    const response = await pool.query("SELECT id_song, song_name, genre, url, art_name FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE genre LIKE LOWER('%"+req.params.genre+"%') AND s.enabled=true");
    res.json({rows: response.rows});
}

const getSearchSongsByAlbum = async (req, res) => {
    const response = await pool.query("SELECT s.*, a.art_name FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE s.id_album = $1 AND s.enabled=true", [req.params.id_album]);
    res.json({rows: response.rows});
}

const getSearchSongsByPlaylist = async (req, res) => {
    const response = await pool.query("SELECT sa.* FROM (song s INNER JOIN artist a ON s.id_artist = a.id_artist) AS sa INNER JOIN playlist_song p ON p.id_song = sa.id_song WHERE p.id_playlist = $1 AND sa.enabled=true", [req.params.id_playlist]);
    res.json({rows: response.rows});
}

const addSong = async (req, res) => {
    const {song_name, genre, url, id_artist, id_album} = req.query;
    const response = await pool.query("INSERT INTO Song VALUES(default,$1,$2,$3,default,$4,$5)", [song_name, genre, url, id_artist, id_album]);
    res.json({
        message: 'Song added',
        body: {
            album: {song_name, genre, url, id_artist, id_album}
        }
    });
}

const updateSong = async (req, res) => {
    const {id_song, song_name, genre, url, enabled, id_artist, id_album} = req.query;
    var q = "UPDATE Song SET";
    if(song_name) q+=" song_name='"+song_name+"'"
    if(genre) q+=", genre='"+genre+"'"
    if(url) q+=", url='"+url +"'"
    if(enabled) q+=", enabled="+enabled 
    if(id_artist) q+=", id_artist="+id_artist 
    if(id_album) q+=", id_album="+id_album 
    q+= " WHERE id_song="+id_song
    console.log(q)
    const response = await pool.query(q);
    res.json({
        message: 'Song updated',
        body: {
            album: {id_song, song_name, genre, url, enabled, id_artist, id_album}
        }
    });
}

const deleteSong = async(req, res) => {
    const response = await pool.query("DELETE FROM Song WHERE id_song=$1", [req.params.id_song]);
    res.json({
        message: 'Song deleted',
        body: {
            song: {id_song}
        }
    });
}




/** ARTISTA ------------------------------------------------------------------------------------------------------------------------------------*/
const getArtists = async (req, res) => {
    const response = await pool.query("SELECT * FROM artist");
    res.json({rows: response.rows});
}

const getArtistByName = async (req, res) => {
    const response = await pool.query("SELECT * FROM artist WHERE LOWER(art_name) LIKE '%"+req.params.name+"%'");
    res.json({rows: response.rows});
}

const addArtist = async (req, res) => {
    const {art_name, date_sub, id_manager, id_user} = req.body;
    const response = await pool.query("INSERT INTO Artist VALUES(default,$1,$2,$3) RETURNING id_artist", [art_name, date_sub, id_manager]);
    id = response.rows[0].id_artist;
    await pool.query("UPDATE Usuario SET id_artist=$1 WHERE id_user=$2", [id,id_user]);
    res.json({
        message: 'Artist added',
        body: {
            artist: {id_artist:id, art_name:art_name, date_sub:date_sub, id_manager:id_manager}
        }
    });
}

const updateArtist = async (req, res) => {
    const {id_artist, art_name, date_sub, id_manager} = req.query;
    var q = "UPDATE Artist SET";
    if(art_name) q+=" art_name='"+art_name+"'"
    if(date_sub) q+=", date_sub='"+date_sub+"'"
    if(id_manager) q+=", id_manager="+id_manager 
    q+= " WHERE id_artist="+id_artist

    const response = await pool.query(q);
    res.json({
        message: 'Song updated',
        body: {
            artist: {id_artist, art_name, date_sub, id_manager}
        }
    });
}

const deleteArtist = async (req, res) => {
    const response = await pool.query("DELETE FROM Artist WHERE id_artist=$1", [req.params.id_artist]);
    res.json({
        message: 'Artist deleted',
        body: {
            artist: {id_artist}
        }
    });
}

/** ALBUMES ------------------------------------------------------------------------------------------------------------------------------------*/
const getAlbums = async (req, res) => {
    const response = await pool.query("SELECT * FROM Album");
    res.json({rows: response.rows});
}

const getAlbumByName = async (req, res) => {
    const response = await pool.query("SELECT a.*, t.art_name FROM Album a INNER JOIN artist t ON a.id_artist = t.id_artist WHERE LOWER(a.album_name) LIKE '%"+req.params.name+"%'");
    res.json(response.rows);
}

const addAlbum = async (req, res) => {
    const {album_name, date_pub, id_artist} = req.query;
    const response = await pool.query("INSERT INTO Album VALUES(default,$1,$2,$3)", [album_name, date_pub, id_artist]);
    res.json({
        message: 'Album added',
        body: {
            album: {album_name, date_pub, id_artist}
        }
    });
}

const updateAlbum = async (req, res) => {
    const {id_album, album_name, date_pub, id_artist} = req.query;
    var q = "UPDATE Album SET";
    if(album_name) q+=" album_name='"+album_name+"'"
    if(date_pub) q+=", date_pub='"+date_pub+"'"
    if(id_artist) q+=", id_artist="+id_artist 
    q+= " WHERE id_album="+id_album

    const response = await pool.query(q);
    res.json({
        message: 'Album updated',
        body: {
            album: {id_album, album_name, date_pub, id_artist}
        }
    });
}

const deleteAlbum = async (req, res) => {
    const response = await pool.query("DELETE FROM Album WHERE id_album=$1", [req.params.id_album]);
    res.json({
        message: 'Album deleted',
        body: {
            album: {id_album}
        }
    });
}

/** PLAYLIST ------------------------------------------------------------------------------------------------------------------------------------*/
const getPlaylists = async (req, res) => {
    const response = await pool.query("SELECT * FROM Playlist");
    res.json({rows: response.rows});
}

const getPlaylistByName = async (req, res) => {
    const response = await pool.query("SELECT p.*, u.username FROM Playlist p INNER JOIN Usuario u ON p.id_user = u.id_user WHERE LOWER(playlist_name) LIKE '%"+req.params.name+"%'");
    res.json(response.rows);
}

const addPlaylist = async (req, res) => {
    const {playlist_name, id_user} = req.body;
    const response = await pool.query("INSERT INTO Playlist VALUES(default,$1,$2) RETURNING id_playlist", [playlist_name, id_user]);
    id = response.rows[0].id_playlist;
    console.log(id)
    res.json({
        message: 'Playlist created',
        body: {
            playlist: {id_playlist:id, playlist_name:playlist_name, id_user:id_user}
        }
    });
}

const savesSongToPlaylist = async (req, res) => {
    const {id_playlist, id_song} = req.body;
    const response = await pool.query("INSERT INTO Playlist_song VALUES(default,$1,$2)", [id_playlist, id_song]);
    res.json({
        message: 'Song added to playlist',
        body: {
            playlist_song: {id_playlist, id_song}
        }
    });
}


/** Inactivar canciones del catalogo--------------------------------------------------------------------------------------------------------------*/
const enableSong = async (req, res) => {
    const {id_song, isEnabled} = req.query;
    const response = await pool.query("UPDATE Song SET enabled=$1 WHERE id_song=$2", [isEnabled, id_song]);
    res.json({
        message: 'Song modified',
        body: {
            song: {id_song, isEnabled}
        }
    });
}

/** Albumes de la utlima semana--------------------------------------------------------------------------------------------------------------*/
const getAlbumsLastWeek = async (req, res) => {
    const response = await pool.query("SELECT * FROM album WHERE (current_date - date_pub)<7 ORDER BY (current_date - date_pub)<7 ASC");
    res.json({rows: response.rows});
}

/**Artistas mas populares en los ultimos 3 meses */
const getPopularArtists = async (req, res) => {
    const response = await pool.query("SELECT sa.art_name, COUNT(*) as reqs FROM(request r INNER JOIN (SELECT s.id_song, a.art_name FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist) AS sa ON r.id_song = sa.id_song) WHERE (current_date - r.date_req) < 90 GROUP BY sa.art_name ORDER BY reqs DESC");
    res.json({rows: response.rows});
}

/**Artistas mas produccion musical */
const getActiveArtists = async (req, res) => {
    const response = await pool.query("SELECT a.art_name, COUNT(*) as ncanciones FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist GROUP BY a.art_name ORDER BY ncanciones DESC LIMIT 10");
    res.json({rows: response.rows});
}

/**Generos mas populares */
const getPopularGenres = async (req, res) => {
    const response = await pool.query("SELECT s.genre, COUNT(*) as nreq FROM song s INNER JOIN request r ON s.id_song = r.id_song GROUP BY s.genre ORDER BY nreq DESC");
    res.json({rows: response.rows});
}

/**Usuarios mas activos */
const getActiveUsers = async (req, res) => {
    const response = await pool.query("SELECT u.username, COUNT(*) as nreq FROM usuario u INNER JOIN request r ON u.id_user = r.id_user GROUP BY u.username ORDER BY nreq DESC");
    res.json({rows: response.rows});
}

/**Subscripciones en los ultimos 6 meses*/
const getSubscripciones = async (req, res) => {
    const response = await pool.query("SELECT COUNT(*) FROM (SELECT date_sub FROM artist WHERE (current_date - date_sub) <180 UNION SELECT date_sub FROM manager WHERE (current_date - date_sub) <180) AS a");
    res.json(response.rows[0]);
}

/**Reproducciones diarias */
const getDailyUser = async (req, res) => {
    const response = await pool.query("SELECT COUNT(*) as nreq FROM usuario u INNER JOIN request r ON u.id_user = r.id_user WHERE u.id_user = $1 AND (current_date - r.date_req) < 1", [req.params.name]);
    res.json(response.rows[0]);
}

/* ---------------------- Proyecto2 --------------------------- */
const desactivarArtista = async (req, res) => {
    const response = await pool.query("select * from desactivar_artista($1)", [req.params.nombre]);
    res.json({message: "Se desactivo correctamente"});
}

const desactivarCancion = async (req, res) => {
    const response = await pool.query("select * from desactivar_cancion($1)", [req.params.cancion]);
    res.json({message: "Se desactivo correctamente"});
}

const desactivarAlbum = async (req, res) => {
    const response = await pool.query("select * from desactivar_album($1)", [req.params.album]);
    res.json({message: "Se desactivo correctamente"});
}

const ComisionesArtistas = async (req, res) => {
    const response = await pool.query("select ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias from song so, request re, artist ar, usuario usu where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist group by  ar.art_name order by reproducciones desc;");
    res.json({rows: response.rows});
}

const desactivarUsuarioSS = async (req, res) => {
    const response = await pool.query("select * from desactivar_usuario($1)", [req.params.id_usuario_insertado]);
    try{
        res.json({message: "Se desactivo correctamente"});
    }catch (e){
        res.json({message: "No se pudo desactivar"});
    }
    
}

const eliminarSuscripcion = async (req, res) => {
    const response = await pool.query("select * from eliminar_suscripcion($1)", [req.params.id_usuario_insertado]);
    res.json({message: "Se ha eliminado la suscripcion"});
}

const desactivarUsuarioA = async (req, res) => {
    const response = await pool.query("select * from desactivar_artista($1)", [req.params.nombre]);
    res.json({message: "Se ha desactivado el/la artista"});
}

module.exports = {
    getLogin,
    getUsers,
    getUserByUsername,
    addUser, 
    getSongs,
    getSongsByName,
    getSearchSongs, 
    getSearchSongsByGenre,
    getSearchSongsByAlbum,
    getSearchSongsByPlaylist,
    addSong,
    updateSong,
    deleteSong,
    getArtists, 
    getArtistByName,
    addArtist,
    updateArtist,
    deleteArtist,
    getAlbums,
    getAlbumByName,
    addAlbum,
    updateAlbum,
    deleteAlbum,
    getPlaylists,
    getPlaylistByName,
    addPlaylist,
    savesSongToPlaylist, 
    enableSong,
    getAlbumsLastWeek,
    getPopularArtists,
    getActiveArtists,
    getPopularGenres, 
    getActiveUsers,
    getSubscripciones,
    getDailyUser, 
    desactivarArtista,
    desactivarCancion,
    desactivarAlbum,
    ComisionesArtistas,
    desactivarUsuarioSS,
    eliminarSuscripcion,
    desactivarUsuarioA
};
