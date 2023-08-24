def element_at(array, index)
  begin
    raise "invalid index" if index < 0 || index >= array.length

    array[index]
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

def inclusive_range(array, start_pos, end_pos)
  begin
    raise "invalid range" if start_pos > end_pos || start_pos < 0 || end_pos >= array.length

    array[start_pos..end_pos]
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

def non_inclusive_range(array, start_pos, end_pos)
  begin
    raise "invalid range" if start_pos >= end_pos || start_pos < 0 || end_pos > array.length

    array[start_pos...end_pos]
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

def start_and_length(array, start_pos, length)
  begin
    raise "invalid range" if start_pos < 0 || start_pos >= array.length || length < 0 || start_pos + length > array.length

    array[start_pos, length]
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end