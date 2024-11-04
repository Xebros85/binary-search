# Binary Search Tree Driver Script

require_relative "lib/tree"

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)

# Insert Values
tree.insert(42)
tree.insert(12)

# Delete Values
tree.delete(67)

# Find Values
puts
puts tree.find(3)

puts
puts

tree.pretty_print

