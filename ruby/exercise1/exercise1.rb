def serial_average(string)
    array = string.split('-')
    avg = (array[1].to_f + array[2].to_f) / 2
    return "#{array[0]}-#{sprintf('%.2f', avg).rjust(5, '0')}"
end