require 'base64'

txt_file = File.read("content.txt")

string = "the string that will be base encoded"

encoded_string = Base64.encode64(string).chomp

new_content = txt_file.gsub(string, encoded_string)

your_name = "jason"

File.open("#{your_name}.txt", "w") do |f|
    f.print(new_content)
end