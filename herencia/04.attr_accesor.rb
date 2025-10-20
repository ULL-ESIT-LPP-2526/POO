class Person
    attr_accessor :name
    # attr_reader :name    # obtine el valor de @name
    # attr_writer :name    # se estable el valor de @name

    def initialize(name) # name es una variable local
        @name = name     # @name es una variable de instancia
    end
end

p = Person.new("Nombre Apellido")
puts p.name

p.name = "Nombre Primer-Apellido"
puts p.name
