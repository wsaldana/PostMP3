const {Router} = require('express');
const router = Router();

const {getLogin, getUsers, getUserByUsername, addUser, 
    getSongs, getSongsByName,
    getSearchSongs, getSearchSongsByGenre, addSong, updateSong, deleteSong,
    getArtists, getArtistByName, addArtist, updateArtist, deleteArtist,
    getAlbums,getAlbumByName,addAlbum, updateAlbum, deleteAlbum,
    enableSong, getAlbumsLastWeek, getPopularArtists, getActiveArtists, getPopularGenres, getActiveUsers} = require('../controllers/index.controller');

router.get('/login/:username/:password', getLogin)

router.get('/users', getUsers);
router.get('/users/:username', getUserByUsername)
router.get('/activeusers', getActiveUsers)

router.get('/songs', getSongs);
router.get('/songs/:name', getSongsByName);
router.get('/search/:input', getSearchSongs);
router.get('/searchgenre/:genre', getSearchSongsByGenre)
router.get('/populargenres', getPopularGenres)

router.get('/artists', getArtists)
router.get('/artists/:name', getArtistByName)
router.get('/popularartists', getPopularArtists)
router.get('/activeartists', getActiveArtists)

router.get('/albums', getAlbums)
router.get('/albums/:name', getAlbumByName)
router.get('/albumslastweek', getAlbumsLastWeek)



router.post('/users', addUser);
router.post('/songs', addSong)
router.post('/artists', addArtist)
router.post('/albums', addAlbum)


router.put('/artists', updateArtist)
router.put('/songs', updateSong)
router.put('/albums', updateAlbum)
router.put('/enablesong', enableSong)


router.delete('/songs/:id_song', deleteSong)
router.delete('/artists/:id_artist', deleteArtist)
router.delete('/albums/:id_album', deleteAlbum)

module.exports = router;