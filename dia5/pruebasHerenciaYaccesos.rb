#!/usr/bin/env ruby

#-------------------------------------
# Created:     11-feb-2018
# probar herencia multiple en clases y niveles de acceso
#-------------------------------------

class Coche

    def initialize()
        @color = "rojo"
    end

    def GetColor()
        @color
    end
    def SetColor(valor)
        @color = valor
    end

    #private :GetColor, :SetColor   #hace que sea privado
    #protected :GetColor
    #...
end

'''
    RUBY NO ADMITE HERENCIA MULTIPLE, PERO PODEMOS SIMULARLA
    HACIENDO UNA CLASE INTERMEDIA QUE LAS INCLUYA, PERO COMO MODULOS
'''
module Coche2

    def initialize()
        @color = "cobre" 
    end

    def GetColor()
        @color
    end
    def SetColor(valor)
        @color = valor
    end

    #private :GetColor, :SetColor   #hace que sea privado
    #protected :GetColor
    #...
end

module Motor
    CABALLOS = 75
end

class Motor_y_Coche
    include Motor
    include Coche2
end

class Twingo < Motor_y_Coche
    def initialize()
        super() #para lanzar el initialize de coche2
    end
end

if __FILE__ == $0
    coche = Coche.new

    print "color " + coche.GetColor

    twingo = Twingo.new
    print twingo.GetColor
end
