require "../tree/tree"

module TestTree 
    def setup
        #@object_class = BinaryTree
        @root = @object_class.new 'root', 0
        @values= [1,3,5,-1,  2]
        @values.each do |i|
            node = @object_class.new "node#{i}", i
            @root.add node
        end
    end
    #def test of search
    def test_search
        #self.setup()
        assert_equal(-1, @root.search(-1).value )
        assert_equal(1, @root.search(1).value )
        assert_equal(2, @root.search(2).value )
        assert_equal(nil, @root.search(-100) )
        assert_equal(nil, @root.search(100) )
        assert_equal(nil, @root.search(4) )
    end
    
    
    #def test of search
    def test_add
        #self.setup()
        node = @object_class.new "New node", 4
        @root.add node 
        assert_equal("New node", @root.search(4).content )
        
        node = @object_class.new "New node2", 10
        @root.add node 
        assert_equal("New node2", @root.search(10).content )
    end

    
    #def test of search
    def test_remove
        test_size = 5000
        debug = false
        puts "Testing add and remove #{test_size} nodes, with distinct keys"
        
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
        end
        
    end
    #def test of search
#     def test_remove
#         #self.setup()
#         @values.each do |i|
#             @root.remove i
#             assert_equal(nil, @root.search(i) )
#         end
#     end
 
end


