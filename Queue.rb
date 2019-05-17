class Queue
    def initialize
        @ivar = Array.new
    end

    def enqueue(el)
        #enter first from left
        @ivar.unshift(el)    
    end

    def dequeue
        #leave last from right
        @ivar.pop
        @ivar
    end

    def peek
        @ivar.last
    end

end 