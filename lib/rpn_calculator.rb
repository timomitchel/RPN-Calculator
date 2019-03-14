class RpnCalculator

  attr_reader :polish_expression, :stack
  def initialize
    @polish_expression = []
    @stack = []
  end
end