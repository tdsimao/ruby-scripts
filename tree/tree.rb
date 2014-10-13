class Node
    def initialize content, value
        @content = content
        @value = value
        @children = []
    end
    
    def add node
        @children << node
    end
    
    def puts
        puts @content
        @children.each do |c|
            c.puts
        end
    end
end


class Heap < Node
        
    def add node
        if node.value < @value
            add_greater node
        else
            add_lesser node
        end
    end
    
    def add_lesser node
        if @children[0].nil?
            @children[0] = node
        else
            @children[0].add node
        end
    end
    
    def add_greater node
        if @children[1].nil?
            @children[1] = node
        else
            @children[1].add node
        end
    end
    
    def puts
        if @children[0].nil?
            self.puts @children[0]
        end
        puts @value
        if @children[1].nil?
            self.puts @children[1]
        end
        
    end
end
            
            
        
root = Node.new 'root', 0

10.times do |i|
    puts i
end


