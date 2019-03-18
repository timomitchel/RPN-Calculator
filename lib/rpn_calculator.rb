class RpnCalculator

  OPERATORS = %w(+ - * /).freeze
  SPECIAL_INPUT_CHARACTERS = %w(q =).freeze

  attr_reader :polish_expression, :stack
  def initialize
    @polish_expression = []
    @stack = []
  end

  def run
    p 'Start entering the expression to evaluate in Reverse Polish Notation' if @polish_expression.length == 0
    p "Continue entering the expression to evaluate in Reverse Polish Notation with #{@polish_expression.last} as the only number/decimal on the stack" if @polish_expression.length == 1
    p "Continue entering the expression to evaluate in Reverse Polish Notation with #{@polish_expression} as the numbers still waiting to be evaluated" if @polish_expression.length > 1
    loop do
      input = $stdin.gets.chomp
      check_input(input)
    end
  end

  def check_input(input)
    check_filter_input(input)
    case input
    when RpnCalculator::SPECIAL_INPUT_CHARACTERS.first
        p 'goodbye'
        exit!
    when RpnCalculator::SPECIAL_INPUT_CHARACTERS.last
      calculate_values(@polish_expression)
    else
      @polish_expression << input
    end
  end

  def check_filter_input(input)
    if filter_input(input)
        p 'Invalid character'
        run
    end
  end

  def filter_input(input)
    input.scan(/[-=\+\*\/0-9q]/).length == 0 || (input.length > 1 && !input.scan(/\D/).empty?)
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

  def calculate_operator_input(operator)
    numbers = @stack.pop(2)
    binding.pry
    if check_divide_by_zero(numbers, operator) || check_multiply_zero_by_another_number(numbers, operator)
      @stack << 0
    else
      result = do_math_accordingly(operator, numbers)
      @stack << result
    end
  end

  def do_math_accordingly(operator, numbers)
    return (numbers.last.to_f + numbers.first.to_f) if operator == OPERATORS[0]
    return (numbers.last.to_f - numbers.first.to_f) if operator == OPERATORS[1] && @polish_expression.last != '-'
    return (numbers.last.to_f * numbers.first.to_f) if operator == OPERATORS[2]
    return (numbers.last.to_f / numbers.first.to_f) if operator == OPERATORS[3]
    return (numbers.first.to_f - numbers.last.to_f) if operator == OPERATORS[1]
  end

  def check_divide_by_zero(numbers, operator)
    numbers.last == 0 && operator == RpnCalculator::OPERATORS.last
  end

  def check_multiply_zero_by_another_number(numbers, operator)
    numbers.first == 0 && operator == RpnCalculator::OPERATORS[2]
  end

  def restart_program
    if @stack.last.to_i
      p @stack.last.to_i
    else
      p @stack.last
    end
    @polish_expression.clear
    @stack.each do |element|
      @polish_expression << element.to_s
    end
    @stack.clear
    run
  end
end