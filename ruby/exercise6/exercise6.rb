require 'base64'

class Base64Encoder
  def encode_and_save(file_path)
    begin
      @file_path = file_path
      @string_to_encode = "the string that will be base encoded"
      @output_file_name = "jason"
      txt_file = File.read(@file_path)
      encoded_string = Base64.encode64(@string_to_encode).chomp
      new_content = txt_file.gsub(@string_to_encode, encoded_string)
      File.open("#{@output_file_name}.txt", "w") do |f|
        f.print(new_content)
      end
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
end