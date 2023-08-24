require 'test/unit'
require_relative 'exercise6'
require 'base64'

class TestBase64Encode < Test::Unit::TestCase
  def test_init
    encoder = Base64Encoder.new()
    assert encoder.is_a?(Base64Encoder)
  end

  def setup
    @file = "content.txt"
    @file_to_read = "jason.txt"
    @string_to_encode = "the string that will be base encoded"
    @file_manipulator = Base64Encoder.new
    @file_manipulator.encode_and_save(@file)
    txt_file = File.read(@file_to_read)
    encoded_string = Base64.encode64(@string_to_encode).chomp
    new_content = txt_file.gsub(@string_to_encode, encoded_string)

    assert_equal(txt_file, new_content)
  end

  def teardown
    begin
      raise "invalid file" unless File.file?(@file_to_read)

    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
end