require 'pry'

class Point
  attr_reader :x, :y
  
  def initialize(x,y)
    @x, @y = x, y
    if defined?(@@number_of_points)
      @@number_of_points += 1
    else
      @@number_of_points = 1
    end
  end
  
  #metodos de instancia
  def *(value)
    Point.new(@x * value, @y * value)
  end
  def -@
    Point.new(-@x, -@y)
  end
  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end
  def to_s #invalidando 
    "( #{@x}, #{@y} )"
  end
  
  #metodo de clase
  def self.count
    @@number_of_points
  end
  
  #constante
  ORIGIN = Point.new(0,0)
end

# Herencia - reutilización de código
# Cuando una clase está basada en otra,
# y crea una nueva implementación 
# que mantiene el mismos comportamiento y 
# añade nuevas funcionalidades 
class Point3D < Point
  attr_reader :z
  def initialize(x,y,z)
    super(x,y)              #encadenamiento (chaining)
    @z = z
  end
  #invalidando (overriding)
#  def to_s
#    "(#{@x}, #{@y}, #{@z})"
#  end
  
  def to_s
    s = "( "
    s << super.to_s        #encadenamiento (chaining)
    s << ", #{@z} )"
    s
  end
  
  #constante
  ORIGIN = Point3D.new(0,0,0)
end

p0 = Point::ORIGIN
p1 = Point.new(1,1)
p2 = Point.new(2,2)

p3 = p1 + p2

l = [p0,p1,p2,p3]

p03d = Point3D::ORIGIN
p13d = Point3D.new(1,1,1)
p23d = Point3D.new(2,2,2)

p33d = p13d + p23d

l3d = [p03d,p13d,p23d,p33d]

# La CLASE de un objeto
# Un objeto tiene una CLASE bien definida en Ruby
# Esa CLASE nunca CAMBIARÁ durante el tiempo de vida del objeto

puts "Pruebas de clase"
puts "p1.class                     #{p1.class}"
puts "p1.class == Point            #{p1.class == Point}"
puts "p1.instance_of?Point         #{p1.instance_of?Point}"      # PREDICADO

# equivalentes
puts "Pruebas de clase equivalente"
puts "p1.is_a?Point                #{p1.is_a?Point}"
puts "p1.kind_of?Point             #{p1.kind_of?Point}"                                                                      
puts "Point === p1                 #{Point === p1}"

# superclases 
puts "Pruebas de herencia"
puts "p1.is_a?Object               #{p1.is_a?Object}"
puts "p1.kind_of?Object            #{p1.kind_of?Object}"
puts "Object === p1                #{Object === p1}"

puts "p1.is_a?BasicObject          #{p1.is_a?BasicObject}"
puts "p1.kind_of?BasicObject       #{p1.kind_of?BasicObject}"
puts "BasicObject === p1           #{BasicObject === p1}"


# ¿Es instancia de cualquier superclase?
puts "¿Es instancia de cualquier superclase?"

puts "p13d.class                   #{p13d.class}"
puts "p13d.class == Point3D        #{p13d.class == Point3D}"
puts "p13d.instance_of?Point3D     #{p13d.instance_of?Point3D}"      

puts "p13d.is_a?Point3D            #{p13d.is_a?Point3D}"
puts "p13d.kind_of?Point3D         #{p13d.kind_of?Point3D}"
puts "p13d.is_a?Point              #{p13d.is_a?Point}"
puts "p13d.is_a?Object             #{p13d.is_a?Object}"
puts "p13d.is_a?BasicObject        #{p13d.is_a?BasicObject}"

# La clase de un objeto no incluye herencia
puts "La clase de un objeto no incluye herencia"
puts "p1.instance_of?Object        #{p1.instance_of?Object}"
puts "p1.instance_of?BasicObject   #{p1.instance_of?BasicObject}"
puts "p13d.instance_of?Point       #{p13d.instance_of?Point}"
puts "p13d.instance_of?Object      #{p13d.instance_of?Object}"
puts "p13d.instance_of?BasicObject #{p13d.instance_of?BasicObject}"

binding.pry
