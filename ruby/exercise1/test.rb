require 'test/unit'
require_relative 'exercise1'

class TestSerialAverage < Test::Unit::TestCase
    def test_serial_average
      assert_equal("001-45.67", serial_average("001-23.45-67.89"))
      assert_equal("002-10.00", serial_average("002-09.99-10.01"))
      assert_equal("003-99.99", serial_average("003-99.99-99.99"))
      assert_equal("004-00.00", serial_average("004-00.00-00.00"))
    end

    def test_invalid_input
      assert_equal("Error: invalid input", serial_average("001-23.45"))
      assert_equal("Error: invalid input", serial_average("001-23.45-67.89-10.11"))
      assert_equal("Error: invalid input", serial_average("001-23.45-67.89-10.11-12.13"))
      assert_equal("Error: invalid input", serial_average("001-23.45-67.89-10.11-12.13-14.15"))
    end
  end