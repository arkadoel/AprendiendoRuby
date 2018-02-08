#!/usr/bin/env ruby

#-------------------------------------
# Created:     08-feb-2018
# probar booleanos a ver que sale
#-------------------------------------


if __FILE__ == $0
    
    puts "1 == 1 es #{1 == 1}"

    #entero en como condicion
    for boolean in 0..1
        if(boolean)
            puts "boolean cuando if(#{boolean.to_s}) => true"
        else
            puts "boolean cuando if(#{boolean.to_s}) => false"
        end
    end

    #comparacion de cadenas
    cadena = cadena2 = "hola"
    if(cadena == cadena2)
        puts "if(cadena == cadena2) => true"
    else
        puts "if(cadena == cadena2) => false"
    end
    
    elFalse = false
    elTrue = true
    if(elTrue == TRUE)
        puts "if(elTrue == TRUE) => true"
    else
        puts "if(elTrue == TRUE) => false"
    end
    if(elFalse != FALSE)
        puts "if(elFalse != FALSE) => true"
    else
        puts "if(elFalse != FALSE) => false"
    end

    #ruby no dispone de conversion a booleanos (no hay un .to_b)
    mybool = "true" != "true"? TRUE : FALSE;
    puts "mybool #{mybool}"
    
    #otra opcion es usar !!
    mybool2 = !!("true" != "true");
    puts "mybool2 #{mybool2}"

end
