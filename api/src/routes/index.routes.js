const {Router} = require('express');
const router = Router();

const {getLogin, getUsers, getUserByUsername, addUser, 
    getSongs, getSongsByName,
    getSearchSongs} = require('../controllers/index.controller');

router.get('/login/:username/:password', getLogin)

router.get('/users', getUsers);
router.get('/users/:username', getUserByUsername)

router.get('/songs', getSongs);
router.get('/songs/:name', getSongsByName);

router.get('/search/:input', getSearchSongs);


router.post('/users', addUser);


module.exports = router;