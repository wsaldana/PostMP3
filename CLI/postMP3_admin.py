'''
UNIVERSIDAD DEL VALLE DE GUATEMALA
Bases de Datos
@author Walter Saldaña #19897
@author Carlos Ráxtum #19721
@author Abraham Gutierrez #19111
Proyecto 2
'''

import controller

print(" |-------------------------------|")
print(" |     * PROYECTO2 postMP3 *     |")
print(" |_______________________________|")
print(" |    Walter Saldaña #19897      |")
print(" |    Carlos Ráxtum #19721       |")
print(" |    Abraham Gutierrez #19111   |")
print(" |_______________________________| \n")


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
        #proyecto parte2
        print("\t16) Cerrar")
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
            print("Esperemos vuelva pronto")
            exit()
        else:
            print('opcion no valida')
    except ValueError: 
        print('Por favor, ingresar numeros enteros')
        print("")