# Tree Class

require_relative "node"

class Tree
  attr_accessor :root, :size

  def initialize(input)
    @sorted_array = input.uniq.sort
    @root = build_tree(@sorted_array)    
    @size = 0
    pretty_print(@root)
  end

  def build_tree(array, start_point=0, end_point=(array.length-1))
    return nil if start_point > end_point  

    mid_point = (start_point + end_point) / 2
    node = Node.new(array[mid_point])

    node.left = build_tree(array, start_point, mid_point - 1)
    node.right = build_tree(array, mid_point + 1, end_point)

    return node    
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    return if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)
    # Inserts a value
  end

  def delete(value)
    # deletes a value
  end

  def find(value)
    # finds the node of a value
  end

  def level_order#(block)
    # Accepts a block. This method should traverse the tree in breadth-first level order and yield each node to the provided block.
    # Can be implemented using interation or recursion
    # Should return an array of values if no block given
    # 
  end

  def inorder#(block)
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def preorder#(block)
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def postorder#(block)
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def height#(node)
    # Accepts a node and returns its height
    # Height is defined as the number of edges in the longest path from a given node to a leaf node
  end

  def depth#(node)
    # Accepts a node and returns its depth
    # Depth is defined as the number of edges in path from a given node to the tree's root node.
  end

  def balanced?
    # Checks if the tree is balanced
    # A balanced tree is on where the different between heights of left subtree and right subtree of every node is not more than 1
  end

  def rebalance
    # Rebalances an unbalanced tree
    # Use a traversal method to provide a new array to the #build_tree method
  end
 
end