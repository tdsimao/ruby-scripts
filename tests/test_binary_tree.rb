#!/usr/bin/ruby -w
require "test/unit"
puts File.expand_path(File.dirname(__FILE__))
#require_relative "abstract_tree_test"
require "abstract_tree_test"
class TestBinaryTree < Test::Unit::TestCase
    include TestTree 
    def setup
        @object_class = BinaryTree
        super
    end
end

