def element_at(array, index)
    return array[index]
end

def inclusive_range(array, start_pos, end_pos)
    return array[start_pos..end_pos]
end

def non_inclusive_range(array, start_pos, end_pos)
    return array[start_pos...end_pos]
end

def start_and_length(array, start_pos, length)
    return array[start_pos, length]
end