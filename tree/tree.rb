#!/usr/bin/ruby -w
class Tree
    attr_accessor :content, :value, :parent, :children
    def initialize content, value
        @content = content
        @value = value
        @children = []
        @parent = nil
    end
    
    
    def == node
        return @content == node.content
    end
    
    def add node
        raise NotImplementedError
    end
    
    def <<(child)
      self.add(child)
    end
    
    def remove node
        raise NotImplementedError
    end
    
    def to_s
        return "#{self.class}  " +
                    "Parent: "+(is_root?()  ? "<None>" : @parent.content)+
                    "\tContent: " + (@content.to_s || "<Empty>") +
                    "\tCost: " +(@value.to_s || "<Empty>") 
    end
    
    def to_array
        raise NotImplementedError
    end
    
    def search value
        raise NotImplementedError
    end
    
    def max
        raise NotImplementedError
    end
    
    def min
        raise NotImplementedError
    end
    
    def is_root?
        return @parent.nil?
    end
    
    
    def print_tree(h = 0, block = lambda { |node|  return "#{node.content}" })
        
        s = ""
        s << "\|\t" * h
        s << block.call(self) << "\n"
        puts s
        @children.each do |c|
            if c
                c.print_tree(h+1, block)
            end
        end
    end
    
end


class BinaryTree < Tree
    
    def add node
        if node.value >= @value
            self.addOn(1,node)
        else
            self.addOn(0,node)
        end
    end
    
    def addOn(i,node)
        if @children[i].nil?
            @children[i] = node
            node.parent = self
        else
            @children[i].add node
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
    
    
    
    
    def remove node
        if self == node
            if @children[0].nil? and @children[1].nil?
                return nil
            elsif (not @children[0].nil?) and (not @children[1].nil?)
                substitute = @children[0].max
                self.remove substitute
                substitute.children= @children
                return substitute
                
            elsif not @children[0].nil?
                return @children[0]
            elsif not @children[1].nil?
                return @children[1]
            end
            
        else
            if (node.value >= @value) and not @children[1].nil?
                @children[1] = @children[1].remove node
                return self
            elsif not @children[0].nil?
                @children[0] = @children[0].remove node
                return self
            else
                raise "Node Not Found"
            end
        end
    end
    
    def max
        if not @children[1].nil?
            return @children[1].max
        else 
            return self
        end
    end

    def min
        if not @children[0].nil?
            return @children[0].min
        else 
            return self
        end
    end

    def to_array
        array = Array.new()
        if @children[0]
            array.concat(@children[0].to_array)
        end
        array.push(self)
        if @children[1]
            array.concat(@children[1].to_array)
        end
        return array
    end
    
    
# test_size = 5
# debug = false
# puts "Testing add and remove #{test_size} nodes, with distinct keys"
# 
# root = BinaryTree.new( 'root', 0)
# puts root
# 
# (1..test_size).to_a.shuffle.each do |i|
#     node = BinaryTree.new( "node#{i}", i)
#     root.add node
#     puts node
# end
# 
# root.print_tree()
# 
# 
# aux = root.to_array
# 
# aux.each do |node|
#    puts  node
# end

    
end






