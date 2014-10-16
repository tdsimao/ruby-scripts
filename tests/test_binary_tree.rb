#!/usr/bin/ruby -w
require_relative "abstract_tree_test"
require "test/unit"
 

class TestBinaryTree < Test::Unit::TestCase
    include TestTree 
    def setup
        @object_class = BinaryTree
        super
    end
end

