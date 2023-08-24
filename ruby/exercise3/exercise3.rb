def check_hash(hash)
  begin
    raise "invalid input" unless hash.is_a?(Hash)

    hash[543121] = "100"
    hash.each_key do |key|
      if !key.is_a?(Integer) || key.even?
        hash.delete(key)
      end
    end
    return hash
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

hash = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    "name" => "john",
    "age" => "25",
}