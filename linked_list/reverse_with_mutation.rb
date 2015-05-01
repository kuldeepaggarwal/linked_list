class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value, next_node = nil)
    @value     = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{ list_node.value } --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
  end
end

def reverse_list(list, previous = nil)
  if list
    next_node, list.next_node = list.next_node, previous
    reverse_list(next_node, list)
  else
    previous
  end
end

if __FILE__ == $0
  node1 = Node.new(37)
  node2 = Node.new(99, node1)
  node3 = Node.new(12, node2)
  node4 = Node.new(11, node3)

  print_values(node4)
  puts "-------"
  print_values(reverse_list(node4))
end
