require 'minitest/autorun'
require_relative 'interpreter'

class InterpreterTests < MiniTest::Unit::TestCase
  def test_it_works
    e1= Parser.parse('{+ 1 2}')
    assert_equal(3, Interpreter.interpret(e1))
    e2= Parser.parse('{+ 1 {+ 2 3}}')
    assert_equal(6, Interpreter.interpret(e2))
    e3= Parser.parse('{+ 1 {* 2 3}}')
    assert_equal(7, Interpreter.interpret(e3))
  end
end
