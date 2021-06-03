'''
UNIVERSIDAD DEL VALLE DE GUATEMALA
Bases de Datos
@author Walter Saldaña #19897
@author Carlos Ráxtum #19721
@author Abraham Gutierrez #19111
Proyecto 2
'''

import controller
import psycopg2 as pg
import random
import datetime

#conexion con la base de datos
conexion = pg.connect(host="localhost", database="Proyecto1BD", user="postgres", password="contrasena")

# Creamos el cursor con el objeto conexion
cur = conexion.cursor()

print(" |-------------------------------|")
print(" |     * PROYECTO2 postMP3 *     |")
print(" |_______________________________|")
print(" |    Walter Saldaña #19897      |")
print(" |    Carlos Ráxtum #19721       |")
print(" |    Abraham Gutierrez #19111   |")
print(" |_______________________________| \n")


#Modulo para la simulacion
def simulacion (CantidadDeCanciones, Reproducciones, FechaGener, FechaRep):
    
    for i in range(CantidadDeCanciones):    
        genre = ["reggaeton", "r&b/soul", "pop", "latin pop", "banda", "classic rock", "rock"]      
        songs = ["I Love Me", "Pretty Hurts", "Abrázame", "Du hast", "In Your Eyes", "Thriller", "Like a Prayer",
                 "Everybody ", "Rehab", "Get Lucky", "Uptown Funk", "Take on me", "Crazy", "Sorry", "Firework",
                 "Hey ya!", "Despacito", "Mala", "Adan y eva", "Adictiva", "Mia", "Booty", "Lo malo", "PPP",
                 "Taki Taki", "Imposible", "Solo de mi", "Amanece", "Malamente", "Telefono", "Celoso", 
                 "Bubalo", "Esta Rico", "Lo siento", "Ibiza", "Replay", "Asesina", "Mujeres", "Creeme",  
                 "Mala Mia", "Bebe", "Rico", "Sin pijama", "Loca", "Bajito", "Perdon", "culpables", "Caro", 
                 "Te bote", "Desconocidos", "Usted", "Devuelveme", "5 sentidos", "A solas", "One Kiss", 
                 "La cintura", "Bien duro", "Shallow", "Promesis", "Somos", "Say my name", "Me niego", "Ola", 
                 "Solo", "Sin ti", "Dura", "Fuego", "Quiere Beber", "Bagddad", "Happier", "Clandestino", 
                 "In my mind", "200 MPH", "La Romana", "Flames", "Calypso", "Amor", "Shape of You", "Rockstar",
                 "One Dance", "Closer", "Sunflower", "Señorita", "Bad Guy", "Perfect", "Believer", "Lucid Dreams", 
                 "Photograph", "Havana", "Sad!", "Love yourself", "New rules", "Shallow", "Thunder", "All of me", 
                 "Lean on", "7 Rings", "Sorry", "Goosebumps", "Humble", "Psycho", "Lovely", "Better Now", "Circles", 
                 "Faded", "Congratulations", "Let Her go", "Stay with me", "Treat You Better", "Thank U", 
                 "I dont care", "Wake me Up", "Unforgettable", "The box", "The Hills", "7 years", "Moonlight", 
                 "Riptide", "I like it", "Stitches", "I fall Apart", "See you Again", "I like me Better", 
                 "I like me better", "Heathens", "One Kiss", "Cold Water", "Psycho 2.0", "Demons", "Memories"]
        
        #Albums
        BadBunnyAlb = [1,2,11,12] #1
        TheWeekndAlb = [3,4,13] #2
        DuaLipaAlb = [5] #3
        JBalvinAlb = [6,14,15] #4
        ArjonaAlb = [7,16,17] #5
        NodalAlb = [8,18] #6
        QueenAlb = [9,19] #7
        GunsAlb = [10,20] #8
        
        
        id_artistRan= random.randint(1, 8) # Asiganrle artista a la cancion.
        
        if id_artistRan == 1:
            id_albumRan= random.choice(BadBunnyAlb)
        elif id_artistRan == 2:
            id_albumRan= random.choice(TheWeekndAlb)
        elif id_artistRan == 3:
            id_albumRan= random.choice(DuaLipaAlb)
        elif id_artistRan == 4:
            id_albumRan= random.choice(JBalvinAlb)
        elif id_artistRan == 5:
            id_albumRan= random.choice(ArjonaAlb)
        elif id_artistRan == 6:
            id_albumRan= random.choice(NodalAlb)
        elif id_artistRan == 7:
            id_albumRan= random.choice(QueenAlb)
        elif id_artistRan == 8:
            id_albumRan= random.choice(GunsAlb)     
        
        #realizamos la consulta para obtener el id mas alto para tabla song
        cur.execute("select MAX(id_song) from song")
        id_song = cur.fetchone()
        #recorremos los resultados y los mostramos
        id_song1 = int(id_song[0])
        id_songNew = 1 + int(id_song1)
                
        #ingresa los datos de la cancion
        cur.execute("INSERT INTO song VALUES ('%s', '%s', '%s', 'URL', '%s', '%s', '%s', '%s')" % (id_songNew, random.choice(songs),random.choice(genre),True, id_artistRan, id_albumRan ,FechaGener))
        conexion.commit()
                
        #aqui iria un for para las reproducciones
        for a in range(Reproducciones):
            #rando de usuarios que hacen la reproduccion
            id_user= random.randint(1, 7)
            #realizamos la consulta para obtener el id mas alto para tabla request
            cur.execute("select MAX(id_request) from request")
            #recorremos los resultados y los mostramos
            id_request = cur.fetchone()
            id_request1 = int(id_request[0])
            id_requestNew = 1 + int(id_request1)
            
            cur.execute("INSERT INTO request VALUES ('%s', '%s', '%s', '%s')" % (id_requestNew, FechaRep, id_songNew, id_user))
            conexion.commit()
        print("cancion ingreso correctamente")

while(True):
    try:
        print("")#Menu de opciones
        print("MENU DE OPCIONES:")
        print("\t1) Buscar Cancion")
        print("\t2) Buscar Artista")
        print("\t3) Buscar Album")
        print("\t4) Generar Reporte")
        #proyecto parte2
        print("\t5) Ingreso de Monitores")
        print("\t6) Cálculo de comisiones para artistas")
        print("\t7) Bitácora de operaciones en el sistema")
        print("\t8) Reportería (reportes personalisados/nuevos)")
        #PRINCIPALES TAREAS
        print("\t9) Modificar la informacion de cualquier track")
        print("\t10) Modificar la informacion de cualquier album")
        print("\t11) Desactivar track")
        print("\t12) Desactivar album")
        print("\t13) Desactivar usuarios sin suscripcion para que ya no puedan acceder a la plataforma")
        print("\t14) Eliminar suscripciones de usuarios")
        print("\t15) Desactivar usuarios artistas")
        #RECOMENDACIONES
        print('\t16) Migrar usuarios al sistema de recomendación')
        print('\t17) Recomendaciones')
        print('\t18) Simulacion')
        #proyecto parte2
        print("\t19) Cerrar")
        op = int(input("Ingrese una opcion: "))
        if op == 1:
            print("\tBUSCAR.....") #Menu buscar
            print("\t\t1) Inactivar")
            print("\t\t2) Modificar")
            print("\t\t3) Eliminar")
            print("\t\t4) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:
                if opc == 1:
                    print("\t¿DESEA INACTIVAR LA CANCION?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Inactivando cancion...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 2:
                        print("\t¿DESEA MODIFICAR LA CANCION?")
                        print("\t\t1) SI")
                        print("\t\t2) Regresar al menu")
                        opci=int(input("Ingrese una opcion: "))
                        try:
                            if opci == 1:
                                print("Pidiendo")
                            elif opci == 2:
                                print("regresar a menu principal")
                            else:
                                print('opcion no valida')
                        except ValueError:
                            print('Por favor, ingresar numeros enteros')
                            print("")
                elif opc == 3:
                    print("\t¿DESEA ELIMINAR LA CANCION?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Eliminando cancion...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
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
                
        elif op == 2:
            print("\tBUSCAR.....") #Menu buscar
            print("\t\t1) Eliminar")
            print("\t\t2) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:
                if opc == 1:
                    print("\t¿DESEA ELIMINAR EL ARTISTA?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Eliminando artista...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")           
                elif opc == 2:
                    print("regresar a menu principal")
                else:
                    print('opcion no valida')
            except ValueError: 
                print('Por favor, ingresar numeros enteros')
                print("")
            
        elif op == 3:#Menu crear album
            print("\tBUSCAR.....") #Menu buscar
            print("\t\t1) Eliminar")
            print("\t\t2) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:
                if opc == 1:
                    print("\t¿DESEA ELIMINAR EL ALBUM?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Eliminando album...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")           
                elif opc == 2:
                    print("regresar a menu principal")
                else:
                    print('opcion no valida')
            except ValueError: 
                print('Por favor, ingresar numeros enteros')
                print("")
                    
        elif op == 4:
            print("\t\t1) Albumes de la ultima semana")
            print("\t\t2) Artistas con popularidad creciente")
            print("\t\t3) Cantidad de nuevas suscripciones")
            print("\t\t4) Artistas con mayor produccion musical")
            print("\t\t5) Generos populares")
            print("\t\t6) Usuarios mas activos")
            print("\t\t7) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:
                if opc == 1:
                    print("\t¿DESEA GENERAR UN REPORTE DE ALBUMES DE LA ULTIMA SEMANA?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 2:
                    print("\t¿DESEA GENERAR UN REPORTE DE ARTISTAS CON POPULARIDAD CRECIENTE?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 3:
                    print("\t¿DESEA GENERAR UN REPORTE DE CANTIDAD DE NUEVAS SUSCRIPCIONES?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 4:
                    print("\t¿DESEA GENERAR UN REPORTE DE ARTISTAS CON MAYOR PRODUCCION MUSICAL?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 5:
                    print("\t¿DESEA GENERAR UN REPORTE DE GENEROS POPULARES?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 6:
                    print("\t¿DESEA GENERAR UN REPORTE DE USUARIOS MAS ACTIVOS?")
                    print("\t\t1) SI")
                    print("\t\t2) Regresar al menu")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generando reporte...")
                        elif opci == 2:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 7:
                    print("regresar a menu principal")
                else:
                    print('opcion no valida')
            except ValueError: 
                print('Por favor, ingresar numeros enteros')
                print("")
        #pROYECTO PARTE2
        elif op == 5:
            print("\tAQUI SE DARA INGRESO AL TIPO DE MONITOR PARA ELABORAR SUS TAREAS.....")
            print("\t¿Qué monitor eres?.....") #Menu buscar
            print("\t\t1) MonitorA")
            print("\t\t2) MonitorB")
            print("\t\t3) MonitorC")
            print("\t\t4) Regresar a Menu Principal")
            opc = int(input("Ingrese una opcion: "))
            try:
                if opc == 1:#al monitor A se le asignan los incisos 1,2,3
                    print("\tBIENVENIDO MONITOR_A")
                    print("\t¿Qué desea hacer?")
                    print("\t\t1) Modificar la información de cualquier track y álbum del catálogo")
                    print("\t\t2) Desactivar tracks y álbumes")
                    print("\t\t3) Desactivar usuarios sin suscripción para que ya nopuedan acceder a la plataforma")
                    print("\t\t4) regresar a menu principal")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("información de cualquier track y álbum del catálogo Actualizado")
                        elif opci == 2:
                            print("Desactivar tracks y album con exito")
                        elif opci == 3:
                            print("usuarios sin suscripción actualizado")
                        elif opci == 4:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 2: #al monitor B se le asignan los incisos 4,5,6
                    print("\tBIENVENIDO MONITOR_B")
                    print("\t¿Qué desea hacer?")
                    print("\t\t1) Eliminar suscripciones de usuarios")
                    print("\t\t2) Desactivar usuarios registrados como artistas")
                    print("\t\t3) Asociar un usuario existente a un perfiles de monitoreo")
                    print("\t\t4) regresar a menu principal")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Eliminar suscripciones de usuarios, proceso exitoso")
                        elif opci == 2:
                            print("Desactivar usuarios registrados como artistas, proceso exitoso")
                        elif opci == 3:
                            print("Asociar un usuario existente a un perfiles de monitoreo, proceso exitoso")
                        elif opci == 4:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
                    except ValueError:
                        print('Por favor, ingresar numeros enteros')
                        print("")
                elif opc == 3: #al monitor C se le asignan los incisos 7,8
                    print("\tBIENVENIDO MONITOR_C")
                    print("\t¿Qué desea hacer?")
                    print("\t\t1) Eliminar suscripciones de usuarios")
                    print("\t\t2) Desactivar usuarios registrados como artistas")
                    print("\t\t3) regresar a menu principal")
                    opci=int(input("Ingrese una opcion: "))
                    try:
                        if opci == 1:
                            print("Generar los reportes ofrecidos por la plataforma")
                        elif opci == 2:
                            print("Consulta de bitácora de operaciones")
                        elif opci == 3:
                            print("regresar a menu principal")
                        else:
                            print('opcion no valida')
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

        elif op == 6:# Cálculo de comisiones para artistas
            print("\tComisiones") 
            mensaje = controller.desactivarCancion(cancion)
            print(mensaje['message'])
            print("\t\t1) Reporte de comisiones")
        elif op == 7:# Bitácora de operaciones en el sistema
            print("\tBitacora de operaciones") 
            print("\t¿Qué desea hacer?")
            print("\t\t1) Bitacora de creacion")
            print("\t\t2) Bitacora de modificación")
            print("\t\t3) Bitacora de eliminación ")
            print("\t\t4) regresar a menu principal")
            opci=int(input("Ingrese una opcion: "))
            try:
                if opci == 1:
                    print(" Bitacora de creacion")
                elif opci == 2:
                    print("Bitacora de modificación")
                elif opci == 3:
                    print("Bitacora de eliminación")
                elif opci == 4:
                    print("regresar a menu principal")
                else:
                    print('opcion no valida')
            except ValueError:
                print('Por favor, ingresar numeros enteros')
                print("")
        elif op == 8:# Ampliación de reportería
            print("\tBitacora de operaciones") 
            print("\t¿Qué desea hacer?")
            print("\t\t1) Total de reproducciones por semana dado un rango de fechas a ser ingresado por el usuario")
            print("\t\t2) Los N artistas con las mayores reproducciones para un rango de fechas a ser ingresado por el usuario. La cantidad de artistas N a mostrar también debe ser ingresada por el usuario.")
            print("\t\t3) Total de reproducciones por género para un rango de fechas a ser ingresado por el usuario ")
            print("\t\t4) Las N canciones con más reproducciones para un artista a ser ingresado por el usuario")
            print("\t\t5) regresar a menu principal")
            opci=int(input("Ingrese una opcion: "))
            try:
                if opci == 1:
                    print(" Reporte 1")
                elif opci == 2:
                    print("Reporte 2")
                elif opci == 3:
                    print("Reporte 3")
                elif opci == 4:
                    print("Reporte 4")
                else:
                    print('opcion no valida')
            except ValueError:
                print('Por favor, ingresar numeros enteros')
                print("")
        #PoryectoParete2
        elif op == 9:
            id_cancion = int(input("ID de la cancion: "))
            nombre = input("Nuevo nombre de la cancion: ")
            genero = input("Nuevo genero de la cancion: ")
            url = input("Nuevo URL de la cancion: ")
            mensaje = controller.desactivarArtista(id_cancion, nombre, genero, url)
            print(mensaje['message'])
        elif op == 10:
            id_usuario_insertado = int(input("ID del usuario: "))
            mensaje = controller.desactivarArtista(id_usuario_insertado)
            print(mensaje['message'])
        elif op == 11:
            cancion = input("Nombre del cancion: ")
            mensaje = controller.desactivarCancion(cancion)
            print(mensaje['message'])
        elif op == 12:
            album = input("Nombre del album: ")
            mensaje = controller.desactivarAlbum(album)
            print(mensaje['message'])
        elif op == 13:
            id_usuario_insertado = int(input("ID del usuario: "))
            mensaje = controller.desactivarUsuarioSS(id_usuario_insertado)
            print(mensaje['message'])
        elif op == 14:
            id_usuario_insertado = int(input("ID del usuario: "))
            mensaje = controller.eliminarSuscripcion(id_usuario_insertado)
            print(mensaje['message'])
        elif op == 15:
            nombre = input("Nombre del artista: ")
            mensaje = controller.desactivarUsuarioA(nombre)
            print(mensaje['message'])
        elif op == 16:
            print("Ingrese la fecha de reproducciones:")
            dia = input("\tDía: ")
            mes = input("\tMes: ")
            a = input("\tAño: ")
            migracion = controller.mongoSaveUsers(a+'-'+mes+'-'+dia)
            if migracion:
                print("Mirgación finalizada correctamente.")
            else:
                print("Ocurrió un error al migrar los datos.")
        elif op == 17:
            print("Mostrando recomendaciones para usuarios selectos:")
            data = controller.recommendSongs()
            print(data)
            print("Desea enviar las recomendaciones a los usuarios: ")
            enviar = input("\t1) Si \n\t2) No \n ")
            if(enviar == "1"):
                rec = controller.sendRecommendations(data)
                if(rec):
                    print("Los usuarios fueron notificados con sus recomendaciones.")
                else:
                    print("Ocurrió un error al enviar las recomendaciones.")
            else:
                print("Las recomendaciones no se notificaran a los usuarios.")
        elif op == 18:
            CantidadDeCanciones = int(input("Ingrese cantidad de canciones a generar....  ")) #Num a generar
            Reproducciones = int(input("Ingrese cantidad que desea reproducir cada cancion.... ")) #Num a generar
            FechaGener = input("Ingrese la Fecha de Generacion. Ejem: 2020-1-23 o 2020-12-20....  ") #Debe ir en la tabla de song
            FechaGenerA = FechaGener.split("-")
            año=int(FechaGenerA[0])
            mes=int(FechaGenerA[1])
            dia=int(FechaGenerA[2])
            FechaGener = datetime.date(año, mes, dia)
            print(FechaGener)
            FechaRep = input("Ingrese la Fecha de Reproduccion Ejem: 2020-1-23 o 2020-12-20....  ") #Debe ir en la tabla de request
            FechaRepA = FechaRep.split("-")
            año1=int(FechaRepA[0])
            mes1=int(FechaRepA[1])
            dia1=int(FechaRepA[2])
            FechaRep = datetime.date(año1, mes1, dia1)
            simulacion(CantidadDeCanciones, Reproducciones, FechaGener, FechaRep)
        elif op == 19:
            print("Esperemos vuelva pronto")
            exit()
        else:
            print('opcion no valida')
    except ValueError: 
        print('Por favor, ingresar numeros enteros')
        print("")
        

        
conexion.close()