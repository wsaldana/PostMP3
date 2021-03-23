const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '',
    database: 'postmp3',
    port: '5432'
});

/** USERS ------------------------------------------------------------------------------------------------------------------------------------*/
const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM usuario').rows;
    res.json(response);
};

const getUserByUsername = async(req, res) => {
    const response = await pool.query("SELECT * FROM usuario WHERE username='$1'", [req.params.username]).rows;
    res.json(response);
}

const addUser = async (req, res) => {
    const {username, password} = req.body;
    const response = await pool.query('INSER INTO user VALUES ($1, $2)', [username, password]);
    res.json({
        message: 'User added',
        body: {
            user: {username,password}
        }
    })
};

/** SONGS ------------------------------------------------------------------------------------------------------------------------------------*/
const getSongs = async (req, res) => {
    const response = await pool.query("SELECT * FROM song").rows;
    res.json(response);
};

const getSongsByName = async(req, res) => {
    const response = await pool.query("SELECT * FROM song WHERE nombre='$1' AND enabled=true", [req.params.name]).rows;
    res.json(response);
};

const getSearchSongs = async (req, res) => {
    const response = await pool.query("SELECT * FROM song s INNER JOIN artist a ON s.id_artist = a.id_artist WHERE LOWER(s.song_name) LIKE '%$1%' OR LOWER(a.artist_name) LIKE '%$1%' AND s.enabled = true", [req.params.name]).rows;
    res.json(response);
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
    getUsers,
    getUserByUsername,
    addUser, 
    getSongs,
    getSongsByName,
    getSearchSongs
};
