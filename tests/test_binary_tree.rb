#!/usr/bin/ruby -w

require "test/unit"
require_relative "abstract_tree_test"

class TestBinaryTree < Test::Unit::TestCase
    include TestTree 
    def setup
        @object_class = BinaryTree
        super
    end
end

