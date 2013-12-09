require 'minitest/autorun'
require_relative 'parser'

class ParserTests < MiniTest::Unit::TestCase
  def test_it_works
    assert_equal(3, Parser.parse('{+ 1 2}').interp)
    assert_equal(6, Parser.parse('{+ 1 {+ 2 3}}').interp)
    assert_equal(7, Parser.parse('{+ 1 {* 2 3}}').interp)
  end
end
