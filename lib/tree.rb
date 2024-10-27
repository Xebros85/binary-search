# Tree Class

class Tree
  attr_accessor :root

  def initialize
    @root = root
  end

  def build_tree(array)
    # This method builds the binary search tree
    # Takes an array of data and turns it into a balanced binary tree full of Node objects appropriately placed
    # Sort and remove duplicates
    # Should return the level-0 root node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
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

  def level_order
    # Accepts a block. This method should travers the tree in breadth-first level order and yield each node to the provided block.
    # Can be implemented using interation or recursion
    # Should return an array of values if no block given
    # 
  end

  def inorder
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def preorder
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def postorder
    # Accepts a block
    # Depth first order and yield each not to the provided block
    # Should return an array if no block is given
  end

  def height
    # Accepts a node and returns its height
    # Height is defined as the number of edges in the longest path from a given node to a leaf node
  end

  def depth
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