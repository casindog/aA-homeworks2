 class Stack

    def initialize
      # create ivar to store stack here!
        @ivar = Array.new
    end

    def push(el)
      # adds an element to the stack
        @ivar << el
        self
    end

    def pop
      # removes one element from the stack
      @ivar.pop
      self  
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar.first
    end
  end