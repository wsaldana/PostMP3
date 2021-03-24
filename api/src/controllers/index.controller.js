const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'gMzQQ2M7J2SD',
    database: 'postmp3',
    port: '5432'
});

const getLogin = async (req, res) => {
    const {username, password} = req.params
    const response = await pool.query("SELECT id_user, username FROM Usuario WHERE username=$1 AND contrasena=$2", [username, password]);
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
    const response = await pool.query("INSERT INTO Usuario(username,contrasena) VALUES ($1, $2)", [username, password]);
    res.json({
        message: 'User added',
        body: {
            user: {username,password}
        }
    })
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
    const response = await pool.query("SELECT * FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE LOWER(s.song_name) LIKE LOWER('%"+req.params.input+"%') OR LOWER(a.art_name) LIKE LOWER('%"+req.params.input+"%') AND s.enabled = true");
    res.json({rows: response.rows});
}

const getSearchSongsByGenre = async (req, res) => {
    const response = await pool.query("SELECT * FROM song WHERE genre = $1", [req.params.genre]);
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
    res.json(response.rows[0]);
}

const addArtist = async (req, res) => {
    const {id_artist, art_name, date_sub, id_manager} = req.query;
    const response = await pool.query("INSERT INTO Artist VALUES($1,$2,$3,$4)", [id_artist, art_name, date_sub, id_manager]);
    res.json({
        message: 'Artist added',
        body: {
            artist: {id_artist, art_name, date_sub, id_manager}
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
    const response = await pool.query("SELECT * FROM Album WHERE LOWER(album_name) LIKE '%"+req.params.name+"%'");
    res.json(response.rows[0]);
}

const addAlbum = async (req, res) => {
    const {album_name, date_pub, id_artist} = req.query;
    const response = await pool.query("INSERT INTO Album VALUES(default,$1,$2,$3)", [album_name, date_pub, id_artist]);
    res.json({
        message: 'Artist added',
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

module.exports = {
    getLogin,
    getUsers,
    getUserByUsername,
    addUser, 
    getSongs,
    getSongsByName,
    getSearchSongs, 
    getSearchSongsByGenre,
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
    enableSong,
    getAlbumsLastWeek,
    getPopularArtists,
    getActiveArtists,
    getPopularGenres, 
    getActiveUsers
};
