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
    const response = await pool.query("SELECT * FROM song WHERE genre = '$1'", [req.params.genre]).rows;
    res.json(response);
}

/** ARTISTA ------------------------------------------------------------------------------------------------------------------------------------*/
const getArtists = async (req, res) => {
    const response = await pool.query("SELECT * FROM artist").rows;
    res.json(response);
}

const getArtistByName = async (req, res) => {
    const response = await pool.query("SELECT * FROM artist WHERE LOWER(art_name) LIKE '%$1%'", [req.params.name]).rows;
    res.json(response);
}

const addArtist = async (req, res) => {
    const {id, name, } = req.body;
}

/** ALBUMES ------------------------------------------------------------------------------------------------------------------------------------*/



module.exports = {
    getLogin,
    getUsers,
    getUserByUsername,
    addUser, 
    getSongs,
    getSongsByName,
    getSearchSongs
};
