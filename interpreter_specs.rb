require 'minitest/autorun'
require_relative 'interpreter'

class InterpreterTests < MiniTest::Unit::TestCase
  def test_it_works
    e1 = Parser.parse('{+ 1 2}')
    assert_equal(3, Interpreter.interpret(e1))
    e2 = Parser.parse('{+ 1 {+ 2 3}}')
    assert_equal(6, Interpreter.interpret(e2))
    e3 = Parser.parse('{+ 1 {* 2 3}}')
    assert_equal(7, Interpreter.interpret(e3))
  end

  def test_binary_minus_desugaring
    e = Parser.parse('{- 2 1}')
    assert_equal(1, Interpreter.interpret(e))
    e = Parser.parse('{- 2 {- 3 4}}')
    assert_equal(3, Interpreter.interpret(e))
  end
end
