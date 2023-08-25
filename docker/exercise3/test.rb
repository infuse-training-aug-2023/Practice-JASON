require 'test/unit'
require_relative 'main'

class TestArithemetics < Test::Unit::TestCase
  def test_add
    assert_equal(3, Arithemetics.new.add(1, 2))
  end

  def test_subtract
    assert_equal(1, Arithemetics.new.subtract(3, 2))
  end
end