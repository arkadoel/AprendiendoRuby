#!/usr/bin/env ruby

#-------------------------------------
# Created:     11-feb-2018
# probar ficheros
#-------------------------------------
'''
    ruby hereda la forma de escritura de C/C++ y es igual de tosco
    con punteros
    MODOS como en C
        r   -> lectura
        r+  -> lectura y escritura
        w   -> escritura (escribe desde el principio)
        a+  -> rw + append

'''
RUTA_ACTUAL = __dir__
FILENAME = __dir__ + "/fichero.txt"

a = 2

if(a == 1)
    fichero  = File.new(FILENAME, "a+")
    for num in 10..20    
        fichero.write("\r\n" + num.to_s)
    end

    fichero.close()

    #otra forma (esto es C puro)
    File.open(FILENAME, "a+") do |fich2|
        fich2.write("--------------------------------")    
    end

    fich3 = File.open(FILENAME, "a+")
    fich3.write("\r\nadios\r\n")
    fich3.close()

    #LEER a array de lineas
    arr = IO.readlines(FILENAME)
    puts arr[0]
    puts arr[1]

    #recorrer con un bucle linea a linea
    IO.foreach(FILENAME) do |linea|
        puts linea
    end

    #renombrar
    filename2 = FILENAME
    filename2["fichero.txt"] = "otro.txt"  #replace rapido en ruby
    File.rename("fichero.txt", "otro.txt")


    # directorio que existe
    puts File::directory?( "/usr/local/bin" ) # => true
    # es fichero
    puts File::directory?( "otro.txt" ) # => false


    if File::exists?( "otro.txt" )
        puts "existe"
        File.delete("otro.txt")
    end
elsif a == 2
    if(Dir.exist?("carpeta") == false)
        Dir.mkdir("carpeta")
    end
    Dir.delete("carpeta")
end

