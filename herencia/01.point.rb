require 'pry'

class Point
  #métodos de acceso 
  attr_reader :x, :y     #getters
  # attr_writer :x, :y   #setters
  # attr_accessor :x, :y
  
  def initialize(x,y) #x,y son variable locales
    @x, @y = x, y     #@x, @y son variables de instacia
    if defined?(@@number_of_points) #variable de clase
      @@number_of_points += 1
    else
      @@number_of_points = 1
    end
  end
  
  #método de instancia invalida 
  def to_s 
    "( #{@x}, #{@y} )"
  end
  
  #métodos de instancia
  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end
  def *(value)
    Point.new(@x * value, @y * value)
  end
  def -@
    Point.new(-@x, -@y)
  end

  
  #método de clase
  def self.count         #def Point.count
    @@number_of_points
  end
  
  #constante
  ORIGIN = Point.new(0,0)
end

binding.pry
