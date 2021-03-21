const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '',
    database: 'postmp3',
    port: '5432'
});

const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM users').rows;
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

const getSongs = async (req, res) => {
    const response = await pool.query("SELECT * FROM song").rows;
    res.json(response);
};

const getSongsByName = async(req, res) => {
    const response = await pool.query("SELECT * FROM song WHERE nombre='$1'", [req.params.name]).rows;
    res.json(response);
};

const getSearch = async (req, res) => {
    //var querySong = 'SELECT '
}

module.exports = {
    getUsers,
    getUserByUsername,
    addUser, 
    getSongs,
    getSongsByName,
    getSearch
};
