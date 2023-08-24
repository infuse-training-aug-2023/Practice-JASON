def skip_sports(array, integer)
  begin
    raise "invalid input" unless array.is_a?(Array) && integer.is_a?(Integer) && integer >= 0

    string_array = []
    array.each_with_index do |sport, index|
      if index >= integer
        string_array.push("#{index}:#{sport}")
      end
    end
    return string_array
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end