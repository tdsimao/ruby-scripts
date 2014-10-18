#!/usr/bin/ruby -w
class Tree
    attr_accessor :content
    attr_accessor :value
    attr_accessor :parent
    attr_accessor :children
    def initialize content, value
        @content = content
        @value = value
        @children = []
        @parent = nil
    end
    
    def add node
        @children << node
    end
    
    def remove node
        raise NotImplementedError
    end
    
    def getStr h
        s_aux = "\|"<< "\t"
        s =  s_aux * h
        s << @content << "\n"
        h = h + 1
        @children.each do |c|
            if not c.nil?
                s << c.getStr(h)
            end
        end
        return s
    end
    
    def as_s
        return self.getStr 0
    end
    
    
    def search value
        raise NotImplementedError
    end
    
    def max
        raise NotImplementedError
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

    
    
    
end






