require 'minitest/autorun'
require './lib/rpn_calculator'

class RpnCalculatorTest < Minitest::Test

  def setup
    @calculator = RpnCalculator.new
  end

  def test_class_instance
    assert_instance_of RpnCalculator, @calculator
  end

  def test_initial_instance_variables
    assert_instance_of Array, @calculator.polish_expression
    assert_instance_of Array, @calculator.stack
    assert @calculator.polish_expression.empty?
    assert @calculator.stack.empty?
  end

  def test_operators_constant
    assert_equal @calculator.singleton_class.constants[0], :OPERATORS
  end

  def test_check_input_with_valid_numbers
    input = '13'
    @calculator.check_input(input)
    assert_equal @calculator.polish_expression.first, input
    input = '5293094'
    @calculator.check_input(input)
    assert_equal @calculator.polish_expression.last, input
    input = '5'
    @calculator.check_input(input)
    assert_equal @calculator.polish_expression.last, input
  end

  def test_filter_input
    refute @calculator.filter_input(RpnCalculator::OPERATORS[0])
    refute @calculator.filter_input(RpnCalculator::OPERATORS[1])
    refute @calculator.filter_input(RpnCalculator::OPERATORS[2])
    refute @calculator.filter_input(RpnCalculator::OPERATORS[3])
    refute @calculator.filter_input('=')
    assert @calculator.filter_input('')
    assert @calculator.filter_input('w')
    assert @calculator.filter_input('Z')
    assert @calculator.filter_input('@')
    assert @calculator.filter_input('5-')
    assert @calculator.filter_input('+1')
  end
end