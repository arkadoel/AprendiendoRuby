#!/usr/bin/env ruby

#-------------------------------------
# Created:     06-feb-2018
#-------------------------------------

def pruebaWhile()
    n=0
	while(n<10)
		n +=1
        print "n es",n.to_s,  "\t"
    end
    puts ""
	puts "Terminado while, ahora imprimir misma linea"

	#basta con poner una coma al final
	n=0
	while(n<10)
		n +=1
        puts "\t", n.to_s
    end
    puts    
end

def pruebaFor()
    cadena = "ciclopentanoperhidrofenantreno"

    '''
    bucle for(int i=0; i<10; i++)
    '''
    for i in 0..cadena.length
        pon = i.to_s.rjust(2, "0") #padleft
        print "#{pon}_"
    end

    puts

    '''hagamos una cadena y un foreach
    '''
    
    cadena.each_char do |letra|
        print "#{letra.to_s}_"
    end
    '''
    EN RUBY NO FUNCIONA BIEN LA ITERACION FOR EACH EN STRINGS
    '''    
    puts

    ary = [1,2,3,4,5]
    ary.each do |i|
        puts i
    end

    puts
    pruebaCadenas(cadena)
end

def pruebaCadenas(cadena)
    puts cadena[7]      #numeracion de izq a drecha desde 0
    puts cadena[-10]    #numeracion de derecha a izq, pero es desde 1
    puts cadena[7..10]  #del caracter 7 al 10
    puts cadena[-5..-1]

    cadena[7] = "#"
    puts cadena
end

if __FILE__ == $0
    pruebaWhile()
    puts "----------------------------"
    pruebaFor()
    puts
end