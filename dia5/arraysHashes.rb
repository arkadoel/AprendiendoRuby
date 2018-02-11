#!/usr/bin/env ruby

#-------------------------------------
# Created:     11-feb-2018
# probar diccionarios
#-------------------------------------
dict = Hash.new

dict.clear()
puts dict

dict["uno"] ="uno"
puts dict

dict.delete("uno")
puts dict

dict = {
    "uno" => 1,
    "dos" => 2
}
for key in dict.keys
    puts dict[key]
end

