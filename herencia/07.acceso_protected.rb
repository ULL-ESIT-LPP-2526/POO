class Person
    def initialize(name, age)         #name varible local, age variable local
        set_name(name)                  
        @age = age                    #@age variable de instancia
    end
    
    def name
        @first_name + ' ' + @last_name  # variables de instancia: @first_name, @last_name
    end
    
    def age                     # método de instancia 
        @age
    end

    def set_name(name)          # método de instancia
        first_name, last_name = name.split(/\s+/)
        set_first_name(first_name)
        set_last_name(last_name)
    end
    
    def set_first_name(name)
        @first_name = name
    end
    
    def set_last_name(name)
        @last_name = name
    end
    
    def age_difference_with(other)  # método de instancia 
        (self.age - other.age).abs
    end

    def == (other) # método de instancia 
      age == other.age
    end
    
    public :name, :set_name, :age_difference_with
    protected :age
    private :set_first_name, :set_last_name
end

juan = Person.new("Juan Bello", 20)
puts juan.name

pepe = Person.new("Jose Feo", 20)
puts pepe.name

puts pepe.age_difference_with(juan)

# puts juan.age No se puede porque age es protected
# puts pepe.age


puts pepe == juan
