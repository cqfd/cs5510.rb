require 'treetop'

Treetop.load 'arithmetic'

# This is where the difference AST type cases go.
#
# (define-type ArithC
#   [numC (n : number)]
#   [plusC (l : ArithC) (r : ArithC)]
#   [multC (l : ArithC) (r : ArithC)])

class NumC
  attr_reader :n
  def initialize(n)
    @n = n
  end
end

class PlusC
  attr_reader :l, :r
  def initialize(l, r)
    @l = l
    @r = r
  end
end

class MultC
  attr_reader :l, :r
  def initialize(l, r)
    @l = l
    @r = r
  end
end

# This is where the ArithS type cases go.

class NumS < Treetop::Runtime::SyntaxNode
  def n
    text_value.to_i
  end
end

class PlusS < Treetop::Runtime::SyntaxNode
  # def l
  #   < see the treetop file >
  # end
  # def r
  #   < see the treetop file >
  # end
end

class BminusS < Treetop::Runtime::SyntaxNode
  # def l
  #   < see the treetop file >
  # end
  # def r
  #   < see the treetop file >
  # end
end

class MultS < Treetop::Runtime::SyntaxNode
  # def l
  #   < see the treetop file >
  # end
  # def r
  #   < see the treetop file >
  # end
end

# This is a small wrapper around what TreeTop provides automatically.
module Parser
  class NotSureWhatThisIs < Exception
  end
  # string -> ExprS | nil
  def self.parse(s)
    desugar(ArithmeticParser.new.parse(s))
  end
  # ArithS -> ArithC
  def self.desugar(e)
    case e
    when NumS
      NumC.new(e.n)
    when PlusS
      PlusC.new(desugar(e.l), desugar(e.r))
    when BminusS
      PlusC.new(desugar(e.l),
                MultC.new(NumC.new(-1),
                          desugar(e.r)))
    when MultS
      MultC.new(desugar(e.l), desugar(e.r))
    else
      raise NotSureWhatThisIs
    end
  end
end
