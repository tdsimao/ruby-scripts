require_relative "../tree/tree"

module TestTree 
    def setup
        #Define objects that will be used in tests
        @root = @object_class.new 'node0', 0
        @values= [1,3,5,-1,  2]
        @values.each do |i|
            node = @object_class.new "node#{i}", i
            @root.add node
        end
        @values= [1,3,5,-1,  2, 0]
    end
    
    def test_search
        puts "\nTesting search nodes"
        assert_equal(-1, @root.search(-1).value )
        assert_equal(1, @root.search(1).value )
        assert_equal(2, @root.search(2).value )
        assert_equal(nil, @root.search(-100) )
        assert_equal(nil, @root.search(100) )
        assert_equal(nil, @root.search(4) )
    end
    
    
    def test_add
        puts "\nTesting add some nodes"
        
        #self.setup()
        node = @object_class.new "New node", 4
        @root.add node 
        assert_equal("New node", @root.search(4).content )
        
        node = @object_class.new "New node2", 10
        @root.add node 
        assert_equal("New node2", @root.search(10).content )
    end

    
    def test_remove
        test_size = 10
        debug = false
        
        puts "\nTesting add and remove #{test_size} nodes, with distinct keys"
        
        root = BinaryTree.new( 'root', 0)
        
        (1..test_size).to_a.shuffle.each do |i|
            node = BinaryTree.new( "node#{i}", i)
            root.add node
        end

        (0..test_size).to_a.shuffle.each do |i|
            if debug
                puts root.as_s
            end
            aux = root.search(i)
            root = root.remove(aux)
            if not root.nil?
                assert_equal(nil, root.search(i))
            end
        end
        
    end
    
    
    def test_convert
        
        puts "\nTesting convertion to Array"
        
        array = Array.new()
        @values.sort.each do |i|
            node = @object_class.new "node#{i}", i
            array.push(node)
        end
        convertedTree = @root.to_array
        i = 0
        while i < array.size do
            assert_equal(true, convertedTree[i] == array[i])
            i = i+1
        end
        
    end

end


