#!/usr/bin/env ruby


def pon_nombre(nombre="No has puesto nombre", valor=13)
    puts nombre
    if(valor != 13)
        puts "El valor es #{valor}" #con comilla simple falla    
    end

end

def main
    puts "hola"
        puts "funciona con tabulaciones distintas"
    pon_nombre()

    pon_nombre(nombre='fer')

    pon_nombre(valor=15, nombre='Dos') #no admite cambio de orden de argumentos como python
end

if __FILE__ == $0
    main()
end