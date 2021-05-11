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

print("\n |-------------------------------|")
print(" |     * PROYECTO2 postMP3 *     |")
print(" |_______________________________|")
print(" |    Walter Saldaña #19897      |")
print(" |    Carlos Ráxtum #19721       |")
print(" |    Abraham Gutierrez #19111   |")
print(" |_______________________________| \n")


user_data = {}

while True:
    print("Ingrese una de las siguientes opciones: ")
    o = input("\t1) Login \n\t2) Registrarse\n")

    if(o == "1"):
        print("\nPor favor ingrese sus credenciales.")
        usuario = input("Usuario: ")
        contra = input("Contraseña: ")

        user_data = controller.login(usuario,contra)
        if(user_data):
            print("\n/ * Bienvenido ", user_data['username'], " * /")
            break
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
            if True: # ¿Es premium?
                print("\tCREAR PLAYLIST")
                print("\t\t1) Pedir datos")
                print("\t\t2) Buscar")
                print("\t\t3) Agregar")
                print("\t\t4) Regresar a Menu Principal")
                opc = int(input("Ingrese una opcion: "))
                try:
                    if opc == 1:
                        print("crear playlis -> pedir datos")
                    elif opc == 2:
                        print("crear playlis -> buscar")
                    elif opc == 3:
                        print("crear playlis -> agregar")
                    elif opc == 4:
                        print("regresar a menu principal")
                    else:
                        print('opcion no valida')
                except ValueError: 
                    print('Por favor, ingresar numeros enteros')
                    print("")
            else:
                print("mi loco dele pa fuera")
                print("Manager")
                print("Artista")
                if True: #pedir datos de artista y manager
                    print("pedir datos de artista ")
                    print("pedir datos de manager ")
                else:
                    print("siga compa")
        elif op == 3:#Menu crear album
            if True: # ¿Es premium?
                print("\tCREAR ALBUM")
                print("\t\t1) Pedir datos")
                print("\t\t2) Mis canciones")
                print("\t\t3) Agregar")
                print("\t\t4) Regresar a Menu Principal")
                opc = int(input("Ingrese una opcion: "))
                try:
                    if opc == 1:
                        print("crear album -> pedir datos")
                    elif opc == 2:
                        print("crear album -> mis canciones")
                    elif opc == 3:
                        print("crear album -> agregar")
                    elif opc == 4:
                        print("regresar a menu principal")
                    else:
                        print('opcion no valida')
                except ValueError: 
                    print('Por favor, ingresar numeros enteros')
                    print("")
            else:
                print("mi loco dele pa fuera")
                print("Manager")
                print("Artista")
                if True: #pedir datos de artista y manager
                    print("pedir datos de artista ")
                    print("pedir datos de manager ")
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