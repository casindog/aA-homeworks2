  class LRUCache
    def initialize(size)
        @cache = Array.new(size,nil)
    end

    def count
      # returns number of elements currently in cache
      @cache.select {|el| el != nil}.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      # left is new, right is oldest
      if @cache.include?(el)
      else  
        @cache.unshift(el)
        @cache.pop
      end
        
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

  end