class Car
    attr_accessor :name
    def print_name 
        puts "My name is: #{@name}"
    end
end


car = Car.new
car.name = 'Treste'
car.print_name
