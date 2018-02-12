#!/usr/bin/env ruby

#-------------------------------------
# Created:     11-feb-2018
# probar bases de datos
# Instalar gema dbi
# instalar ruby-mysql por apt-get
#-------------------------------------
'''
require "dbi"

begin
    dsn = "DBI:mysql:database=:CAJON_FACTURAS;host=localhost;port=3306"
    dbh = DBI.connect(dsn, "root", "toor")
    # connect to the MySQL server
    #dbh = DBI.connect("DBI:Mysql:CAJON_FACTURAS:localhost", "root", "toor")
    # get server version string and display it
    row = dbh.select_one("SELECT VERSION()")
    puts "Server version: " + row[0]
 rescue DBI::DatabaseError => e
    puts "An error occurred"
    puts "Error code:    #{e.err}"
    puts "Error message: #{e.errstr}"
 ensure
    # disconnect from server
    dbh.disconnect if dbh
 end
 '''

 require 'mysql'

cadena = """esto es un string
 multilinea"""

puts cadena
begin
    con = Mysql.new('localhost', 'root', 'toor', 'CAJON_FACTURAS')
    puts con.get_server_info
    rs = con.query('SELECT * FROM TBL_CONFIG')
    puts rs.fetch_row  

    #con.autocommit false
    
    create = %W[
            CREATE TABLE PERSONA (
                ID_PERSONA      INT NOT NULL AUTO_INCREMENT,
                NOMBRE          VARCHAR(45) NULL,
                EDAD            INT NULL,
                NUM_REAL        FLOAT NULL,
                BOOLEANO        TINYINT(1) NULL,
                FECHA           DATETIME NULL,
                CONSTRAINT PK_PERSONA PRIMARY KEY (ID_PERSONA)
            );
            ].join(' ')
    puts create.to_s
    con.query("USE CAJON_FACTURAS;")
    con.query("DROP TABLE IF EXISTS PERSONA;")
    con.query(create.to_s)

    insert = %W[
        INSERT INTO CAJON_FACTURAS.PERSONA
        (NOMBRE, EDAD, NUM_REAL, BOOLEANO, FECHA)
        VALUES
        ("@NOMBRE", @EDAD, @NUM_REAL,@BOOLEANO, "@FECHA");
        ].join(' ')
    
    insert["@NOMBRE"] = "PACO"
    insert["@EDAD"] = 32.to_s
    insert["@NUM_REAL"] = 52.5.to_s
    insert["@BOOLEANO"] = TRUE.to_s
    insert["@FECHA"] = Time.new.strftime("%Y-%m-%d %H:%M:%S")

    puts insert
    con.query(insert)

    #LISTAR UNA FILA
    querySelectTop1 = "SELECT * FROM CAJON_FACTURAS.PERSONA limit 1"
    rs = con.query(querySelectTop1)

    field = rs.fetch_field_direct 1
    
    puts "Table name: #{field.table}"
    puts "Field name: #{field.name}"
    puts "Field length: #{field.length}"
    puts "Field type: #{field.type}"
    puts
    puts

    #listar varios e iterar
    querySelect = "SELECT * FROM CAJON_FACTURAS.PERSONA "
    rs = con.query(querySelect)
    fields = rs.fetch_fields 
    for field in fields
        print "%s\t" % field.name
    end
    puts

    rs.each_hash do |row|
        puts "%s\t\t%s\t%s\t%s\t\t%s\t\t%s" % [row['ID_PERSONA'], row['NOMBRE'], row['EDAD'], row['NUM_REAL'], row['BOOLEANO'],row['FECHA'] ]
    end

    #con.commit

    #---------------------------------------------------------------------------------------------------------------------------------------
    #procedimiento almacenado que devuelve una tabla
    procedure = "CALL MY_STORE_PROCEDURE" 

    rs = con.query(procedure)
    fields = rs.fetch_fields 
    for field in fields
        print "%s\t" % field.name
    end
    puts

    rs.each_hash do |row|
        puts "%s\t\t%s\t%s\t%s\t\t%s\t\t%s" % [row['ID_PERSONA'], row['NOMBRE'], row['EDAD'], row['NUM_REAL'], row['BOOLEANO'],row['FECHA'] ]
    end

rescue Mysql::Error => e
    puts e.errno
    puts e.error
    #con.rollback
ensure
    con.close if con
end