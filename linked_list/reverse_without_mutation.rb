class Node
  attr_reader :value, :next_node

  def initialize(value, next_node = nil)
    @value     = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :top
  private :top=

  def push(element)
    self.top = Node.new(element, top)
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

def reverse_list(list)
  stack = Stack.new
  while list
    stack.push(list.value)
    list = list.next_node
  end
  stack.top
end

if __FILE__ == $0
  node1 = Node.new(37)
  node2 = Node.new(99, node1)
  node3 = Node.new(12, node2)

  print_values(node3)
  puts "-------"

  print_values(reverse_list(node3))
end
