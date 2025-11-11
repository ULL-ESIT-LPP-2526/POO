# Las variables de instancia se evaluan siempre en referencia a self.
# Las variables de clase     se evaluan en referencia al objeto Class que se crea.

class Point
  attr_reader :x, :y

  #las variables de clase se inicializan en la propia clase
  @@number_of_points = 0
  @@sum_of_x = 0
  @@sum_of_y = 0
  
  def initialize(x,y)
    @x, @y = x, y

    #se pueden usar las variables de clase en un método de instancia
    @@number_of_points += 1
    @@sum_of_x += x
    @@sum_of_y += y
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
  
  def to_s
    "(#{@x}, #{@y})"
  end

  # métodos de clase
  # variables de clase usadas en métodos de clase
  def self.count
    @@number_of_points
  end

  #def self.report
  #def Point.report
  class << self
    def report
      # "nro. puntos #{@@number_of_points}" "suma x #{@@sum_of_x}" "suma y #{@@sum_of_y}"
      [@@number_of_points, @@sum_of_x, @@sum_of_y]
    end
  end

  #constante
  ORIGIN = Point.new(0,0)
  
end

#Herencia
class Point3D < Point
  attr_reader :z
  def initialize(x,y,z)
    super(x,y)
    @z = z
  end

  def to_s
    "(#{@x}, #{@y}, #{@z})"
  end
  
  #constante
  ORIGIN = Point3D.new(0,0,0)
end


    p0 = Point::ORIGIN
    p1 = Point.new(1,1)
    p2 = Point.new(2,2)
    
    puts p0 # "(0, 0)"
    puts p1 # "(1, 1)"
    puts p2 # "(2, 2)"

    puts p1 + p2 # "(3, 3)"
    
    p03d = Point3D::ORIGIN
    p13d = Point3D.new(1,1,1)
    p23d = Point3D.new(2,2,2)
    
    puts p03d # "(0, 0, 0)"
    puts p13d # "(1, 1, 1)"
    puts p23d # "(2, 2, 2)"

    puts p13d + p23d # "(3, 3)"

  # variables de clase
    p Point3D.report
