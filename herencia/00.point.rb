require 'pry'

class Point
  #métodos de acceso 
  attr_reader :x, :y     #getters
  # attr_writer :x, :y   #setters
  # attr_accessor :x, :y
  
  def initialize(x,y) #x,y son variable locales
    @x, @y = x, y     #@x, @y son variables de instacia
  end
  
  #método de instancia invalidado 
  def to_s 
    "( #{x}, #{y} )"
  end
  
  #métodos de instancia
  def +(other)
    Point.new(x + other.x, y + other.y)
  end
  def *(value)
    Point.new(x * value, y * value)
  end
  def -@
    Point.new(-x, -y)
  end

end

class Rectangle
  #métodos de acceso 
  attr_reader :x, :y     #getters
  
  def initialize(x,y) #x,y son variable locales
    @x, @y = x, y     #@x, @y son variables de instacia
  end
  
  #método de instancia invalidado 
  def to_s 
    "[ #{x}, #{y} ]"
  end
  
end

binding.pry
