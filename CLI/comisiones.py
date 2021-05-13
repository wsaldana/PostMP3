import psycopg2 as pg

class Controller:
    def __init__(self, h, db, u, psw):
        self.conexion = pg.connect(
            host = h,
            database = db,
            user = u,
            password = psw
        )
        self.cur = self.conexion.cursor()
        
    def close(self):
        self.conexion.close()
        print(">> Conexion finalizada")

    def ver_comisiones(self):
        self.cur.execute("select ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias from song so, request re, artist ar, usuario usu where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist group by  ar.art_name order by reproducciones desc")
        result = self.cur.fetchall()
        print(result)

    def pagar_comision(self, id):
        self.cur.execute("select ar.id_artist, ar.art_name, count(re.id_request) as reproducciones, count(re.id_request)*0.50 as ganacias from song so, request re, artist ar, usuario usu where so.id_artist = ar.id_artist and so.id_song = re.id_song and re.id_user = usu.id_user and usu.id_user <> ar.id_artist and ar.id_artist = %s group by  ar.id_artist, ar.art_name order by reproducciones desc" % (id))
        comision = self.cur.fetchone()
        self.cur.execute("SELECT comision FROM artist WHERE id_artist=%s" %(comision[0]))
        monto_antes = self.cur.fetchone()[0]
        print(comision[3])
        self.cur.execute("UPDATE artist SET comision = (%s + %s) WHERE id_artist=%s" % (monto_antes, comision[3], id))
        self.cur.execute("SELECT * FROM fondos")
        fondo_antes = self.cur.fetchone()[0]
        self.cur.execute("UPDATE fondos SET dinero = (%s - %s)" % (fondo_antes, comision[3]))
        self.conexion.commit()



#Crear una conexion con los parametros default de postgres
try:
    c = Controller('localhost', 'postmp3', 'postgres', 'hAn3MDWuseJM')
except:
    print("No se ha podido conectar a la base de datos con los parametros default")
    print("PORFAVOR INGRESAR CON LA OPCION 0 SUS PARAMETROS DE CONEXION")

print(" |-------------------------------|")
print(" |         *  POSTMP3  *         |")
print(" |_______________________________|")
print(" |           Pythones!           |")
print(" |_______________________________| \n")

while(True):
    print("MENU DE OPCIONES:")
    print("\t0) Ingresar parámetros de conexión")
    print("\t1) Ver comisiones")
    print("\t2) Pagar comision de un artista")
    print("\t3) Cerrar")
    op = input("Ingrese una opcion: ")
    
    if(op == "0"):
        print('\nIngresar los parámetros para conectar con la DB.')
        try:
            c = Controller(input("Host: "), input("Data Base: "), input("User: "), input("Password: "))
        except:
            print("No se ha podido conectar con la Base de Datos, porfavor vuelva a ingresar los parámetros.\n")
    elif(op == "1"):
        print("\nDesplegando comisiones.")
        c.ver_comisiones()
    elif(op == "2"):
        print("\nPagar comision de un artista.")
        id = input("ID del artista: ")
        c.pagar_comision(id)
    elif(op == "3"):
        c.close()
        break
    else:
        print("\nIngrese una opcion valida.")