class Map
    def initialize
        @ivar = Array.new {Array.new()}
    end

    def set(key,value)
        dupcheck = false
        dup_pos = 0
        @ivar.each_with_index do |subarray,i|
            if subarray[0].include?(key)
                dupcheck = true
                dup_pos = i
            end
        end

        if dupcheck
            @ivar[dup_pos][1] = value 
        else
            @ivar << [key,value]
        end
    end

    def get(key)
        #why would you want to get(key) when you already have the key?
    end

    def delete(key)
        (0...@ivar.length).each do |i|
            if key == @ivar[i][0]
               @ivar.delete_at(i)
               return
            end
        end
    end

    def show
        @ivar
    end

end 