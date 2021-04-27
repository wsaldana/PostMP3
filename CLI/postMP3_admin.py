'''
UNIVERSIDAD DEL VALLE DE GUATEMALA
Bases de Datos
@author Walter Saldaña #19897
@author Carlos Ráxtum #19721
@author Abraham Gutierrez #19111
Proyecto 2
'''
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
        print("\t5) Cerrar")  
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
        elif op == 5:
            print("Esperemos vuelva pronto")
            exit()
        else:
            print('opcion no valida')
    except ValueError: 
        print('Por favor, ingresar numeros enteros')
        print("")
