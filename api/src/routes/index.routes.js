const {Router} = require('express');
const router = Router();

const {getUsers, getUserByUsername, addUser, 
    getSongs, getSongsByName,
    getSearchSongs} = require('../controllers/index.controller');

router.get('/users', getUsers);
router.get('/users/:username', getUserByUsername)

router.get('/songs', getSongs);
router.get('/songs/:name', getSongsByName);

router.get('/search/:input', getSearchSongs);


router.post('/users', addUser);


module.exports = router;