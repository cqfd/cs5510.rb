require 'treetop'

Treetop.load 'arithmetic'

class PlusC < Treetop::Runtime::SyntaxNode
  def interp
    l.interp + r.interp
  end
end

class MultC < Treetop::Runtime::SyntaxNode
  def interp
    l.interp * r.interp
  end
end

class NumC < Treetop::Runtime::SyntaxNode
  def interp
    text_value.to_i
  end
end

module Parser
  def self.parse(s)
    ArithmeticParser.new.parse(s)
  end
end
