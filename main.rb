# Binary Search Tree Driver Script

require_relative "lib/tree"

# array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(Array.new(15) { rand(1..100) })

puts "\nThe tree is balanced: (True/False) #{tree.balanced?}"

puts "\nLevel Order: #{tree.level_order}"
puts "\nPre Order: #{tree.preorder}"
puts "\nIn Order: #{tree.inorder}"
puts "\nPost Order: #{tree.postorder}"

tree.insert(65)
tree.insert(15)
tree.insert(49)
tree.insert(36)
tree.insert(88)
tree.insert(52)
tree.insert(53)
tree.insert(75)

tree.pretty_print

puts "\nThe tree is balanced: (True/False) #{tree.balanced?}"

tree.rebalance

puts "\nThe tree is balanced: (True/False) #{tree.balanced?}"


puts "\nLevel Order: #{tree.level_order}"
puts "\nPre Order: #{tree.preorder}"
puts "\nIn Order: #{tree.inorder}"
puts "\nPost Order: #{tree.postorder}"
