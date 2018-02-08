#!/usr/bin/env ruby

#-------------------------------------
# Created:     08-feb-2018
# probar clases y variables de clase
#-------------------------------------

class Persona
    CONSTANTE = "YO"
    attr_accessor :variable, :otra

    def initialize()
        @variable = variable
        @variable = 34
        @otra = otra
        @otra = "hecho"
    end
end
'''
class Persona2
    class << self
        attr_accessor :variable, :otra
    end

    def initialize()
        self.otra = "hecho2"
        self.variable = 35
    end
end
'''
class Persona3
    @@variable = "yolo"
    @@otra = 32

    def variable
        @@variable
    end

    #getter and setter
    def getOtra
        @@otra
    end
    def setOtra=(value)
        @@otra = value
    end

    #sobreEscritura de metodo toString
    def to_s
        return "variable #{@@variable} y  otra #{@@otra}"
    end

    #RUBY NO PERMITE LA SOBRECARGA MULTIPLE DE METODOS    
    
    def mio(hora)
        puts "mio hora es #{hora}"
    end
end

class ClaseHija < Persona3
    @@nombre = "paco"

    def initialize
        #admite palabra super para llamar al constructor de la clase padre
        super()
    end

    def Nombre
        @@nombre
    end

    def to_s
        return "variable #{@@variable}, otra #{@@otra} y nombre #{@@nombre}"
    end
end

def main()
    puts "inicio aplicacion"

    persona = Persona.new
    #persona2 = Persona2.new
    puts "La constante es #{Persona::CONSTANTE}"    
    puts "Variable de persona: #{persona.variable}, #{persona.otra}"
    #falla => puts "Variable de persona 2: #{persona2.self.variable}, #{persona2.self.otra}"
    puts "Variable de persona 3: #{Persona3.new.variable}"

    p = Persona3.new
    puts p.getOtra
    p.setOtra = 25
    puts p.getOtra
    puts .to_s
    p.mio(Time.now) #info de horas: https://www.tutorialspoint.com/ruby/ruby_date_time.htm
    puts

    hija = ClaseHija.new
    puts hija.to_s

    
end

if __FILE__ == $0
    main()
end
