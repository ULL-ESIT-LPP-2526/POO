require 'pry'

class Point
  include Comparable                      # 1) incluye el módulo comparable
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
  
  # Definición del método del Mixin           # 2) Se implementa el método <=>       
  # El operador <=> define un ORDEN entre objetos
  #
  #                    -1 si left <  right
  # left <=> right  ->  0 si left == right
  #                     1 si left >  right
  #                     nil si no se pueden comparar
  def <=> (other)
    @x**2 + @y**2 <=> other.x**2 + other.y**2
  end
   
  #redefinir el operador == para distinguir los puntos con igual distancia al origen
  def == (other)
    x == other.x && y == other.y
  end

end

# Herencia - reutilización de código
class Point3D < Point
  attr_reader :z
  def initialize(x,y,z)
    super(x,y)              #encadenamiento (chaining)
    @z = z
  end
  
  def to_s
    s = "( "
    s << super.to_s        #encadenamiento (chaining)
    s << ", #{@z} )"
    s
  end
  
  #constante
  ORIGIN = Point3D.new(0,0,0)
end

# Búsqueda de nombres de métodos cuando se incluyen mixin

p0 = Point::ORIGIN
p1 = Point.new(1,1)
p2 = Point.new(2,2)
pn = Point.new(-1,1)

p03d = Point3D::ORIGIN
p13d = Point3D.new(1,1,1)
p23d = Point3D.new(2,2,2)


# "Búsqueda de nombres de métodos cuando se incluyen mixin"
suma        = p1 + p2
menor       = p1 < p2
menor_igual = p1 <= p2
mayor       = p1 > p2
mayor_igual = p1 >= p2
igual       = p1 == p2
entre       = p1.between?(p0,p2)

suma_3d        = p13d + p23d
menor_3d       = p13d < p23d
menor_igual_3d = p13d <= p23d
mayor_3d       = p13d > p23d
mayor_igual_3d = p13d >= p23d
igual_3d       = p13d == p23d
entre_3d       = p13d.between?(p03d,p23d)

binding.pry
