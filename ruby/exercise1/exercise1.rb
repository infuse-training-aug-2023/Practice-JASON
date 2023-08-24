def serial_average(string)
    array = string.split('-')
    if array.length == 3
        regex = /\d{3}-\d{2}.\d{2}-\d{2}.\d{2}/
        if regex.match(string)
            avg = (array[1].to_f + array[2].to_f) / 2
            return "#{array[0]}-#{sprintf('%.2f', avg).rjust(5, '0')}"
        end
    end
    return "Error: invalid input"
end