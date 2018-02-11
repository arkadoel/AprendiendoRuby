#!/usr/bin/env ruby

#-------------------------------------
# Created:     11-feb-2018
# probar bases de datos
# Instalar gema dbi
#-------------------------------------
require "dbi"

begin
    # connect to the MySQL server
    dbh = DBI.connect("DBI:Mysql:CAJON_FACTURAS:localhost", "root", "toor")
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