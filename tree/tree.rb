#!/usr/bin/ruby -w
class Node
    attr_accessor :content
    attr_accessor :value
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


class BinaryTree < Node
    
    def add node
        if node.value >= @value
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
    
    
    
    
    def search key
        #return node with value equals the given key
        if key == @value 
            return self
        elsif key < @value
            if not @children[0].nil?
                @children[0].search key
            else
                return nil
            end
        else 
            if not @children[1].nil?
                @children[1].search key
            else
                return nil
            end
        end
    end
    
    
    def as_s
        
        aux = ''
        #aux << "menores\n"
        if not @children[0].nil?
            aux << @children[0].as_s 
        end
        #aux << "eu\n"
        aux << "#{@content}" << "\n"
        
        #aux << "maiores\n"
        if not @children[1].nil?
             aux << @children[1].as_s
        end
        return aux
    end
    
    
    
end
            
            
        
root = BinaryTree.new 'root', 0
numbers = [1,3,4,-1,  2]
numbers.each do |i|
    node = BinaryTree.new "node#{i}", i
    root.add node
end

# puts root.as_s
# 
#  root.search(2).content
# puts root.search(0).content
# puts root.search(-1).content
# puts root.search(10)



