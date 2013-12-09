require_relative 'parser'

module Interpreter
  class NotSureWhatThisIs < Exception
  end
  # expression -> int
  def self.interpret(e)
    case e
    when NumC
      e.n
    when PlusC
      interpret(e.l) + interpret(e.r)
    when MultC
      interpret(e.l) * interpret(e.r)
    else
      raise NotSureWhatThisIs
    end
  end
end
