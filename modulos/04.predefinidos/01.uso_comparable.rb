#Comparable
require 'pry'

class SizeMatters

  include Comparable #1) incluir el módulo mixin que se quiere utilizar

  attr :str
  def initialize(str)
    @str = str
  end

  def to_s
    "#{@str}"
  end

  def <=>(anOther)    #2) definir el comportamiento del método <=> 
    str.size <=> anOther.str.size # Está definido en Numeric - FixNum - Integer
    #str <=> anOther.str # Está definido en String
  end

end

s1 = SizeMatters.new("Z")
s2 = SizeMatters.new("YY")
s3 = SizeMatters.new("XXX")
s4 = SizeMatters.new("WWWW")
s5 = SizeMatters.new("VVVVV")

binding.pry

puts s1 < s2                       #=> true
puts s1 <= s2                      #=> true
puts s1 > s2                       #=> false
puts s1 >= s2                      #=> false
puts s4.between?(s1, s3)           #=> false
puts s4.between?(s3, s5)           #=> # Está definido en String true
