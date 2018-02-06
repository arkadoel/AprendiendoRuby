#!/usr/bin/env ruby

require_relative './dia2/uno.rb'

if __FILE__ == $0
    puts "Elija un archivo a depurar"
    #poner arbol de directorios
    puts `ls -R .`

    load './dia2/uno.rb'
    main()
end