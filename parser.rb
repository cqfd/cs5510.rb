require 'treetop'

Treetop.load 'arithmetic'

# This is where the difference AST type cases go.
#
# (define-type ArithC
#   [numC (n : number)]
#   [plusC (l : ArithC) (r : ArithC)]
#   [multC (l : ArithC) (r : ArithC)])

class NumC < Treetop::Runtime::SyntaxNode
  def n
    text_value.to_i
  end
end

class PlusC < Treetop::Runtime::SyntaxNode
  # def l
  #   < see the treetop file >
  # end
  # def r
  #   < see the treetop file >
  # end
end

class MultC < Treetop::Runtime::SyntaxNode
  # def l
  #   < see the treetop file >
  # end
  # def r
  #   < see the treetop file >
  # end
end


# This is a small wrapper around what TreeTop provides automatically.
module Parser
  # string -> NumC(n) | PlusC(l, r) | MultC(l, r) | nil
  def self.parse(s)
    ArithmeticParser.new.parse(s)
  end
end
