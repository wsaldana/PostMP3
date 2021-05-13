'''
UNIVERSIDAD DEL VALLE DE GUATEMALA
Bases de Datos
@author Walter Saldaña #19897
@author Carlos Ráxtum #19721
@author Abraham Gutierrez #19111
Proyecto 2
'''

import controller
import json
from datetime import date

print("\n |-------------------------------|")
print(" |     * PROYECTO2 postMP3 *     |")
print(" |_______________________________|")
print(" |    Walter Saldaña #19897      |")
print(" |    Carlos Ráxtum #19721       |")
print(" |    Abraham Gutierrez #19111   |")
print(" |_______________________________| \n")


user_data = {}
subscription = {}

while True:
    print("Ingrese una de las siguientes opciones: ")
    o = input("\t1) Login \n\t2) Registrarse\n")

    if(o == "1"):
        print("\nPor favor ingrese sus credenciales.")
        usuario = input("Usuario: ")
        contra = input("Contraseña: ")

        user_data = controller.login(usuario,contra)
        if(user_data):
            if(user_data['enabled'] == True):
                print("\n/ * Bienvenido ", user_data['username'], " * /")
                break
            else:
                print("Usted esta deshabilitado...\n")
        else:
            print("\nCredenciales incorrectos.\n")

    elif(o == "2"):
        print("\nGracias por ser parte de nuestra comunidad.")
        usuario = input("Nombre de usuario: ")
        contra = input("Ingrese su contraseña: ") 
        contra2 = input("Repita su contraseña: ")

        if(contra == contra2):
            user_data = controller.register(usuario,contra) 
            if(user_data):
                print("\n/ * Bienvenido ", user_data['username'], " * /")
                break
            else:
                print("\Ocurrió un problema al registrarse.\n")
        else:
            print("\nSus contraseñas no coinciden. \n")

while(True):
    try:
        print("")#Menu de opciones
        print("MENU DE OPCIONES:")
        print("\t1) Buscar")
        print("\t2) Crear Playlist")
        print("\t3) Crear Album")
        print("\t4) Subir cancion")
        print("\t5) Cerrar")  
        op = int(input("Ingrese una opcion: "))
        if op == 1:
            print("\tBUSCAR.....") #Menu buscar
            print("\t\t1) Cancion")
            print("\t\t2) Album")
            print("\t\t3) Playlist")
            print("\t\t4) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:

                if opc == 1:
                    cancion = input("INGRESE SUS PARÁMETROS DE BUSQUEDA: ")
                    res_busqueda = controller.seachSong(cancion)
                    for i in range(len(res_busqueda)):
                        print("\t",i+1, ") ", res_busqueda[i]['song_name'], " - ", res_busqueda[i]['art_name'], ". [", res_busqueda[i]['genre'], "]")
                    print("\n\t¿DESEA REPRODUCIR UNA CANCION?")
                    print("\t\t- Ingrese el número de la canción")
                    print("\t\t- Ingrese 'q' para regresar el menú")
                    opci=input("\tIngrese una opcion: ")
                    try:
                        if opci == "q":
                            print("regresar a menu principal")
                        else:
                            print("Reproduciendo '", res_busqueda[int(opci)-1]['song_name'], "': ", res_busqueda[int(opci)-1]['url'])
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")

                elif opc == 2:
                    album = input("INGRESE SUS PARÁMETROS DE BUSQUEDA: ")
                    res_busqueda = controller.searchAlbum(album)
                    for i in range(len(res_busqueda)):
                        print("\t",i+1, ") ", res_busqueda[i]['album_name'], " - ", res_busqueda[i]['art_name'])
                    print("\n\t¿DESEA ABRIR UN ALBUM?")
                    print("\t\t- Ingrese el número del album")
                    print("\t\t- Ingrese 'q' para regresar el menú")
                    opci=input("\tIngrese una opcion: ")
                    try:
                        if opci == "q":
                            print("regresar a menu principal")
                        else:
                            canciones_album = controller.searchAlbumSongs(res_busqueda[int(opci)-1]['id_album'])['rows']
                            for i in range(len(canciones_album)):
                                print("\t",i+1, ") ", canciones_album[i]['song_name'], " - ", canciones_album[i]['art_name'], ". [", canciones_album[i]['genre'], "]")
                            print("\n\t¿DESEA REPRODUCIR UNA CANCION?")
                            print("\t\t- Ingrese el número de la canción")
                            print("\t\t- Ingrese 'q' para regresar el menú")
                            opci=input("\tIngrese una opcion: ")
                            try:
                                if opci == "q":
                                    print("regresar a menu principal")
                                else:
                                    print("Reproduciendo '", canciones_album[int(opci)-1]['song_name'], "': ", canciones_album[int(opci)-1]['url'])
                            except ValueError:
                                print('Por favor, ingresar numeros enteros')
                                print("")
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")

                elif opc == 3:
                    playlist = input("INGRESE SUS PARÁMETROS DE BUSQUEDA: ")
                    res_busqueda = controller.searchPlaylist(playlist)
                    for i in range(len(res_busqueda)):
                        print("\t",i+1, ") ", res_busqueda[i]['playlist_name'], " - ", res_busqueda[i]['username'])
                    print("\n\t¿DESEA ABRIR UNA PLAYLIST?")
                    print("\t\t- Ingrese el número de la playlist")
                    print("\t\t- Ingrese 'q' para regresar el menú")
                    opci=input("\tIngrese una opcion: ")
                    try:
                        if opci == "q":
                            print("regresar a menu principal")
                        else:
                            canciones_playlist = controller.searchPlaylistSongs(res_busqueda[int(opci)-1]['id_playlist'])['rows']
                            for i in range(len(canciones_playlist)):
                                print("\t",i+1, ") ", canciones_playlist[i]['song_name'], " - ", canciones_playlist[i]['art_name'], ". [", canciones_playlist[i]['genre'], "]")
                            print("\n\t¿DESEA REPRODUCIR UNA CANCION?")
                            print("\t\t- Ingrese el número de la canción")
                            print("\t\t- Ingrese 'q' para regresar el menú")
                            opci=input("\tIngrese una opcion: ")
                            try:
                                if opci == "q":
                                    print("regresar a menu principal")
                                else:
                                    print("Reproduciendo '", canciones_playlist[int(opci)-1]['song_name'], "': ", canciones_playlist[int(opci)-1]['url'])
                            except ValueError:
                                print('Por favor, ingresar numeros enteros')
                                print("")
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                    
                elif opc == 4:
                    print("regresar a menu principal")
                else:
                    print('opcion no valida')
            except ValueError: 
                print('Por favor, ingresar numeros enteros')
                print("")
        elif op == 2:#Menu crear playlist
            if ((user_data['id_artist'] != None) or (user_data['id_manager'] != None)): # ¿Es premium?
                print("\nCREAR PLAYLIST")
                nombre_playlist = input("Ingrese nombre de la Playlist: ")
                new_playlist = controller.addPlaylist(nombre_playlist, user_data['id_user'])
                while True:
                    cancion = input("Busque una cancion para agregar: ")
                    res_busqueda = controller.seachSong(cancion)
                    for i in range(len(res_busqueda)):
                        print("\t",i+1, ") ", res_busqueda[i]['song_name'], " - ", res_busqueda[i]['art_name'], ". [", res_busqueda[i]['genre'], "]")
                    print("\n\t¿DESEA AGREGAR UNA CANCION?")
                    print("\t\t- Ingrese el número de la canción")
                    print("\t\t- Ingrese 'q' para finalizar")
                    opci=input("\tIngrese una opcion: ")
                    try:
                        if opci == "q":
                            print("Creacion de playlist concluida.")
                            break
                        else:
                            add = controller.addSongToPlaylist(new_playlist["body"]["playlist"]["id_playlist"], res_busqueda[int(opci)-1]['id_song'])
                            if(add):
                                print("cancion agregada.")
                            else:
                                print("No se pudo agregar la cancion.")
                    except ValueError:
                        print('Por favor, una opcion valida')
                        print("")
            else:
                print("Pague suscripcion para acceder a esta funcion.")
                print("Ingrese el rol de su cuenta: ")
                print("\t1) Manager")
                print("\t2) Artista")
                print("\t3) Regresar")
                rol = input("Ingrese una opcion: ")
                print(rol)
                if rol == "1": #pedir datos de artista y manager
                    print("Ingrese el nombre de su artista: ")
                elif rol == "2":
                    nombre = input("Ingrese su nombre de artista: ")
                    manager = input("Solicite con su manager su id: ")
                    subscription = controller.addArtist(nombre, date.today().strftime("%Y-%m-%d"),int(manager), user_data['id_user'])['body']['artist']
                    print("Se ha suscrito correctamente.")
                    user_data['id_artist'] = subscription['id_artist']
                else:
                    print("siga compa")

        elif op == 3:#Menu crear album
            if True: # ¿Es premium?
                print("\nCREAR ALBUM")
                nombre_playlist = input("Ingrese nombre del album: ")

            else:
                print("Pague suscripcion para acceder a esta funcion.")
                print("Ingrese el rol de su cuenta: ")
                print("\t1) Manager")
                print("\t2) Artista")
                print("\t3) Regresar")
                rol = input("Ingrese una opcion: ")
                print(rol)
                if rol == "1": #pedir datos de artista y manager
                    print("Ingrese el nombre de su artista: ")
                elif rol == "2":
                    nombre = input("Ingrese su nombre de artista: ")
                    manager = input("Solicite con su manager su id: ")
                    subscription = controller.addArtist(nombre, date.today().strftime("%Y-%m-%d"),int(manager), user_data['id_user'])['body']['artist']
                    print("Se ha suscrito correctamente.")
                    user_data['id_artist'] = subscription['id_artist']
                else:
                    print("siga compa")

        elif op == 4:#Subir cancion
            if True: # ¿Es premium?
                print("Usted a entrado a la funcion de subir cancion")
            else:
                print("mi loco dele pa fuera")
                print("Manager")
                print("Artista")
                if True: #pedir datos de artista y manager
                    print("pedir datos de artista ")
                    print("pedir datos de manager ")
                else:
                    print("siga compa")
        elif op == 5:
            print("\nEsperemos vuelva pronto\n")
            exit()
        else:
            print('opcion no valida')
    except ValueError: 
        print('Por favor, ingresar numeros enteros')
        print("")