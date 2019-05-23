array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
    max = 0
    length = 0
    arr.each_with_index do |el,idx|
        el.each_char do |char|
            length += 1
        end
        if length > max
            max = length
            index = idx
        end
        length = 0
    end

    return arr[index]

end

def dominant_octopus(arr)
    mid = arr.length /2
    left = arr[0..mid]
    right = arr[mid+1..-1]
    return arr if arr.length <= 1

    merge(dominant_octopus(left),dominant_octopus(right)).last
end

def merge(left,right)
    sorted = []
    until left.empty? || right.empty?
        if left.first < right.first
            sorted << left.shift    
        else
            sorted <<right.shift
        end
    end
    sorted + left + right
end


def clever_octopus(arr)
    max = 0
    arr.each_with_index do |el,idx|
        if el.length > max
            max = length
            index = idx
        end
    end
    max
    arr[idx]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

titles_different_data = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def slow_dance(dir,titles_array)
    titles_array.each_with_index do |el,idx|
        if el == dir
            return idx
        end
    end
end

def constant_dance(dir,titles_different_data)
    return  titles_different_data[dir]
end