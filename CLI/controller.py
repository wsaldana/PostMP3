import requests
import pymongo as pm
import pandas as pd
from datetime import datetime, timedelta
from bson.json_util import dumps
from bson.json_util import loads

def login(username, password):
    response = requests.get(f"http://localhost:3000/login/{username}/{password}")
    try:
        return response.json()
    except:
        return None
        
def register(username, password):
    parameters = {
        "username": username,
        "password": password
    }
    response = requests.post("http://localhost:3000/users", params=parameters)
    try:
        return response.json()
    except:
        return None

def seachSong(inputSong):
    response = requests.get(f"http://localhost:3000/search/{inputSong}")
    response2 = requests.get(f"http://localhost:3000/searchgenre/{inputSong}")
    try:
        return response.json()['rows'] + response2.json()['rows']
    except:
        return None
    
def searchAlbum(inputAlbum):
    response = requests.get(f"http://localhost:3000/albums/{inputAlbum}")
    try:
        return response.json()
    except:
        return None

def searchAlbumSongs(id_album):
    response = requests.get(f"http://localhost:3000/searchalbum/{id_album}")
    try:
        return response.json()
    except:
        return None

def searchPlaylist(inputPlaylist):
    response = requests.get(f"http://localhost:3000/playlists/{inputPlaylist}")
    try:
        return response.json()
    except:
        return None

def searchPlaylistSongs(id_playlist):
    response = requests.get(f"http://localhost:3000/searchplaylist/{id_playlist}")
    try:
        return response.json()
    except:
        return None

def addPlaylist(name, id_user):
    response = requests.post("http://localhost:3000/playlists", data={"playlist_name":name, "id_user":id_user})
    try:
        return response.json()
    except:
        return None

def addSongToPlaylist(id_playlist, id_song):
    response = requests.post("http://localhost:3000/addsongtoplaylist", data={"id_playlist":id_playlist, "id_song":id_song})
    try:
        return response.json()
    except:
        return None

def addArtist(name, date_sub, manager, user):
    response = requests.post("http://localhost:3000/artists", data={"art_name":name, "date_sub":date_sub, "id_manager":manager, "id_user":user}) 
    try:
        return response.json()
    except:
        return None

def desactivarArtista(nombre):
    response = requests.put(f"http://localhost:3000/desactivarartista/{nombre}") 
    try:
        return response.json()
    except:
        return None

def desactivarAlbum(album):
    response = requests.put(f"http://localhost:3000/desactivaralbum/{album}") 
    try:
        return response.json()
    except:
        return None

def desactivarCancion(cancion):
    response = requests.put(f"http://localhost:3000/desactivarcancion/{cancion}") 
    try:
        return response.json()
    except:
        return None

def desactivarUsuarioSS(id_usuario_insertado):
    response = requests.put(f"http://localhost:3000/desactivarUsuarioSS/{id_usuario_insertado}") 
    try:
        return response.json()
    except:
        return None

def eliminarSuscripcion(id_usuario_insertado):
    response = requests.put(f"http://localhost:3000/eliminarSuscripcion/{id_usuario_insertado}") 
    try:
        return response.json()
    except:
        return None

def desactivarUsuarioA(nombre):
    response = requests.put(f"http://localhost:3000/desactivarUsuarioA/{nombre}") 
    try:
        return response.json()
    except:
        return None

def mongoSaveUsers(fecha):
    try:
        # conectar a la instancia mongo
        client = pm.MongoClient('localhost', 27017)
        mongo_db = client.postmp3
        # verificar si la fecha ya fue ingresada
        if(mongo_db.fechas.find_one({"fecha":fecha}) == None):
            # fetch data del api
            response = requests.get(f"http://localhost:3000/mongo/{fecha}") 
            usuarios = response.json()['rows']
            mapUsuarios = {}
            for usuario in usuarios:
                reproduccion = {
                    "fecha": usuario['date_req'],
                    "song_name": usuario['song_name'],
                    "genre": usuario['genre'],
                    "url": usuario['url'],
                    "art_name": usuario['art_name']
                }
                if(mapUsuarios.get(usuario['id_user']) == None):
                    mapUsuarios[usuario['id_user']] = {
                        "id_user": usuario['id_user'],
                        "username": usuario['username'],
                        "reproducciones": [reproduccion]
                    }
                else:
                    mapUsuarios[usuario['id_user']]['reproducciones'].append(reproduccion)
            for usuario in mapUsuarios.values():
                res = mongo_db.usuarios.find_one_and_update({"id_user": usuario['id_user']}, {'$push': {'reproducciones': {'$each':usuario['reproducciones']}}}, upsert=False)
                if(res == None):
                    res = mongo_db.usuarios.insert_one(usuario)
            mongo_db.fechas.insert_one({"fecha":fecha})
        return True
    except:
        return False

def formatDate(track):
    fecha = track['fecha']
    date = fecha.split('-')
    date[2] = date[2].split('T')[0]
    date = list(map(lambda x: int(x), date))
    d = datetime(date[0],date[1],date[2])
    track['fecha'] = d
    return track

def recommendation_alg(user, mongo_db):
    reproducciones = user['reproducciones']
    df = pd.DataFrame(reproducciones)
    genre = df.mode()['genre'][0]
    pipeline2 = [
       { "$unwind": "$reproducciones" },
       { "$match": { "reproducciones.genre" : genre } },
       { "$replaceRoot": { "newRoot": "$reproducciones" } }
    ]
    tracks = list(map(formatDate, list(mongo_db.usuarios.aggregate(pipeline2))))
    tracks = list(filter(lambda t: divmod((datetime.now() - t['fecha']).total_seconds(), 31536000)[0] < 1, tracks))
    df_tracks = pd.DataFrame(tracks).mode().loc[[0],['song_name','url','art_name']]
    return {
        "id_user": user['id_user'],
        "username": user['username'],
        "song_name": df_tracks['song_name'][0],
        "url": df_tracks['url'][0],
        "art_name": df_tracks['art_name'][0]
    }
        
    
def recommendSongs():
    # conectar a la instancia mongo
    client = pm.MongoClient('localhost', 27017)
    mongo_db = client.postmp3
    pipeline = [
        { "$project": {
            "id_user": 1,
            "username": 1,
            "reproducciones": 1,
            "n": { "$size": "$reproducciones" }
        }},
        { "$project": {
            "id_user": 1,
            "username": 1,
            "reproducciones": 1,
            "n": 1,
            "filter": { "$gt": ["$n", 2] }
        }},
        { "$match": { "filter" : True} },
        { "$sort": { "n": 1 } },
        { "$limit": 10 }
    ]
    selected_users = list(mongo_db.usuarios.aggregate(pipeline))
    recomendations = []
    for user in selected_users:
        recomendations.append(recommendation_alg(user, mongo_db))
    return pd.DataFrame(recomendations)

def sendRecommendations(df):
    try:
        client = pm.MongoClient('localhost', 27017)
        mongo_db = client.postmp3
        mongo_db.recomendaciones.delete_many({})
        for i in range(len(df.index)):
            d = dict(df.loc[i])
            d['id_user'] = int(d['id_user'])
            mongo_db.recomendaciones.insert_one(d)
        return True
    except:
        return False

def getNotified(id_user):
    try:
        client = pm.MongoClient('localhost', 27017)
        mongo_db = client.postmp3
        notificacion = mongo_db.recomendaciones.find_one({"id_user":id_user})
        return notificacion
    except:
        return None
    
#print(getNotified(4))
#print(recommendSongs())
#print(mongoSaveUsers('2020-01-28'))