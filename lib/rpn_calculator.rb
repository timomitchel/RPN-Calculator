class RpnCalculator

  OPERATORS = %w(+ - * /).freeze

  attr_reader :polish_expression, :stack
  def initialize
    @polish_expression = []
    @stack = []
  end

  def run
    p 'Start entering the expression to evaluate in Reverse Polish Notation' if @polish_expression.length == 0
    p "Continue entering the expression to evaluate in Reverse Polish Notation with #{@polish_expression.last} as the first number on the stack" if @polish_expression.length == 1
    loop do
      input = $stdin.gets.chomp
      check_input(input)
    end
  end

  def check_divide_by_zero(numbers, operator)
    numbers.last == 0 && operator == '/'
  end

  def check_multiply_zero_by_another_number(numbers, operator)
    numbers.first == 0 && operator == '*'
  end

  def calculate_operator_input(operator)
    numbers = @stack.pop(2)
    if check_divide_by_zero(numbers, operator) || check_multiply_zero_by_another_number(numbers, operator)
      @stack << 0
    else
      result = numbers.reduce(operator)
      @stack << result
    end
  end

  def calculate_values(expression)
    expression.each do |element|
      if OPERATORS.include? element
        calculate_operator_input(element)
      else
        @stack << element.to_i
      end
    end
    restart_program
  end

  def restart_program
    p @stack.last
    @polish_expression.clear
    @polish_expression << @stack.last.to_s
    @stack.clear
    run
  end

  def filter_input(input)
    input.scan(/[-=\+\*\/0-9q]/).length == 0 || (input.length > 1 && !input.scan(/\D/).empty?)
  end

  def check_filter_input(input)
    if filter_input(input)
        p 'Invalid character'
        run
    end
  end

  def check_input(input)
    check_filter_input(input)
    case input
    when 'q'
        p 'goodbye'
        exit!
    when '='
      calculate_values(@polish_expression)
    else
      @polish_expression << input
    end
  end
end