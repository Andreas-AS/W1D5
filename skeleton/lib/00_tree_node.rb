require 'byebug'

class PolyTreeNode

    attr_accessor :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children =[]
    end

    def parent=(parent)
        unless self.parent.nil?
            self.parent.children.delete(self)
        end
        @parent = parent
        if !self.parent.nil?
            self.parent.children << self
        end
    end

    # def inspect
    #     {'value' => @value, 'parent' => @parent.value}.inspect
    # end

    def add_child(child_node)
        child_node.parent = self
        self.children << child_node if !self.children.include?(child_node)
    end

    def remove_child(child_node)
        child_node.parent= nil
        if !self.children.include?(child_node)
            raise "This child isn't yours!"
        end
    end

    def dfs(target)
        return self if self.value == target
        @children.each do |child|
            correct_node = child.dfs(target)
            return correct_node if !correct_node.nil?
        end
        nil
    end

    def bfs(target)
        queue = []
        queue.push(self)
        while !queue.empty?
            node = queue.shift
            return node if node.value == target
            
                node.children.each do |child|
                if !child.nil?
                        queue << child 
                    end
                end
        end
        nil
    end

    
        
end

