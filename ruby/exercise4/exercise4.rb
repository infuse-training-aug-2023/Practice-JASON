def skip_sports(array, integer)
    string_array = []
    array.each_with_index do |sport, index|
        if index > integer-1
            string_array.push("#{index}:#{sport}")
        end
    end
    return string_array
end