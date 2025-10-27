require 'pry'
require 'm_letras'
require 'm_numeros'

binding.pry

puts Numeros::Aleatorio.new.random
puts Letras::Aleatorio.new.random

