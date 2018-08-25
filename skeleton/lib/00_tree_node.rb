require 'byebug'

class PolyTreeNode
  attr_reader :value, :parent, :children
  
  def initialize(value, children = [])
    @value = value
    @children = children
    @parent = nil 
  end 
  
  def parent=(parent)
    if @parent
      @parent.children.delete(self)
    end 
    @parent = parent
    @parent.children << self unless parent.nil?
  end 
  
  def add_child(child_node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent=(nil)
    else 
      raise "Cant remove child"
    end 
  end 
  
  def dfs(target)
    return self if self.value == target
    
    @children.each do |child| 
      result = child.dfs(target)
      return result if result #remember to return early if not a nil result!!!!
    end 
    nil
  end
  
  def bfs(node, target)
    
  end
  
  def inspect
    "Node: val #{@value} parent #{@parent ? @parent.value : nil} children: #{@children.map {|child| child.value}}"
  end 
  
end



# value = [1, 2, 3]
# 
#  1
# / |
# 2 3