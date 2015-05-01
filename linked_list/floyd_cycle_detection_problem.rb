class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value, next_node = nil)
    @value     = value
    @next_node = next_node
  end
end

class FlyodDetector
  attr_reader :list, :tortoise, :hase
  private :tortoise, :hase, :list

  def initialize(list)
    @list = @tortoise = list
    @hase = list.next_node if list
  end

  def cyclic?(_tortoise = tortoise, _hase = hase)
    return false if _tortoise.nil? || _hase.nil? || _hase.next_node.nil?

    _tortoise, _hase = _tortoise.next_node, _hase.next_node.next_node

    _tortoise == _hase ? true : cyclic?(_tortoise, _hase)
  end
end

if __FILE__ == $0
  node1 = Node.new(37)
  node2 = Node.new(99, node1)
  node3 = Node.new(12, node2)
  node1.next_node = node3
  p FlyodDetector.new(node3).cyclic?
end
