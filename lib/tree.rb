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

  def insert(node, head = @root)
    # Inserts a value
    new_node = Node.new(node) 
    
    return @root = new_node if @root.nil?

    return new_node if head.nil?

    if new_node.data < head.data
      head.left = insert(node, head.left)
    elsif new_node.data > head.data
      head.right = insert(node, head.right)
    end
    head
    
  end

  def delete(value, node = root)

    # Base Case
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else

      # First Case: No child (Leaf Node)
      return node.right if node.left.nil? && node.right.nil?
      return node.left if node.right.nil?

      # Second Case: Node with One Child      
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # Third Case: Node with 2 children
      node.data = get_min(node.right).data
      node.right = delete(node.data, node.right)
    end
    node
  end

  def get_min(node)
    current = node
    current = node.left until current.left.nil?
    current
  end

  def find(value, node = root)
    # finds the node of a value
    return nil if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      node
    end
  end

  def level_order(node = root)
    return nil if node.nil?
    
    level_array = []
    queue = []

    current = node
    queue << current
    until queue.empty?
      current = queue[0]
      level_array << queue.shift.data
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end
    level_array
  end

  def inorder(node = root)
    return nil if node.nil?

    inorder_array = []
    inorder_array << inorder(node.left) unless node.left.nil?
    inorder_array << node.data
    inorder_array << inorder(node.right) unless node.right.nil?
    inorder_array.flatten
  end

  def preorder(node = root)
    return nil if node.nil?

    preorder_array = []
    preorder_array << node.data
    preorder_array << preorder(node.left) unless node.left.nil?
    preorder_array << preorder(node.right) unless node.right.nil?
    preorder_array.flatten
  end

  def postorder(node = root)
    return nil if node.nil?

    postorder_array = []
    postorder_array << postorder(node.left) unless node.left.nil?
    postorder_array << postorder(node.right) unless node.right.nil?
    postorder_array << node.data
    postorder_array.flatten
  end

  def height(node = root)
    return -1 if node.nil?

    height = 0
    left_height = height(node.left)
    right_height = height(node.right)
    height += [left_height, right_height].max
    height + 1
  end

  def depth(node = root, current_node = root, node_depth = 0)
    return 0 if current_node.nil? || node.nil?

    return node_depth if current_node == node

    left_side = depth(node, current_node.left, node_depth + 1)
    right_side = depth(node, current_node.right, node_depth + 1)

    left_side.zero? ? right_side : left_side
  end

  def balanced?(node = root)
    difference = height(node.left) - height(node.right)
    difference >= -1 && difference <= 1
  end

  def rebalance(node = root)
    initialize(inorder(node))
  end
 
end