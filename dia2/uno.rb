
'''
tambien comentario de varias lineas
'''

def imprimeMenu()
	print ("Menu")
	print ("\r\n\t1.- meter numeros")
	print ("\r\n\t2.- sumar")
    print ("\r\n\t9.- Salir")
    print("\r\nOpcion> ")
	opcion = gets

    return opcion.to_i
end

def sumarNumeros()
	resultado = $n1 + $n2
    return resultado
end

def pedirNumeros()
	$n1 = 0 
    print("Pon el primer numero: ")
    $n1 = gets.to_i
	$n2 = 0 
    print("Pon el segundo numero: ")
    $n2 = gets.to_i
    #como son variables globales ya esta
end

if __FILE__ == $0
    seguir = true

    while(seguir)
        opcion = imprimeMenu()

        if(opcion == 1)
            pedirNumeros()
        elsif (opcion==2)
			print (sumarNumeros())
		elsif (opcion==9)
			seguir = false
		else
            print ("Elige una opcion correcta")
        end
    end
end