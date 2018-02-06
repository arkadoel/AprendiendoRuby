#!/usr/bin/env ruby
#-------------------------------------
# Created:     06-feb-2018
#-------------------------------------

def main()
    puts "ver directorios"
    #exec('ls')

    puts `ls ./` #no son comillas sino tildes francesas
    system "echo", "hola"
    puts `ls -R .`
end

if __FILE__ == $0
    main()
end