#!/usr/bin/ruby -w
 
require_relative "../tree/tree"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  
    
    def setup
        @root = BinaryTree.new 'root', 0
        numbers = [1,3,5,-1,  2]
        numbers.each do |i|
            node = BinaryTree.new "node#{i}", i
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
 
end
