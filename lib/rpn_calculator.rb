class RpnCalculator

  OPERATORS = %w(+ - * /).freeze

  attr_reader :polish_expression, :stack
  def initialize
    @polish_expression = []
    @stack = []
  end

  def enter_loop
    p 'Start entering the expression to evaluate in Reverse Polish Notation' if @polish_expression.length == 0
    p "Continue entering the expression to evaluate in Reverse Polish Notation with #{@polish_expression.last} as the first number on the stack" if @polish_expression.length == 1
    loop do
      input = $stdin.gets.chomp
      check_input(input)
    end
  end

  def filter_input(input)
    input.scan(/[-=\+\*\/0-9q]/).length == 0 || (input.length > 1 && !input.scan(/\D/).empty?)
  end

  def check_input(input)
    if filter_input(input)
        p 'Invalid character'
        enter_loop
    end
    case input
    when input == 'q'
        p 'goodbye'
        exit!
    when input == '='
      calculate_values(@polish_expression)
    else
      @polish_expression << input
    end
  end
end