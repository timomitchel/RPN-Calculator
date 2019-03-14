require 'minitest/autorun'
require './lib/rpn_calculator'

#Extend for tests only
class RpnCalculator
  attr_accessor :stack
end

class RpnCalculatorTest < Minitest::Test

  TEST_INPUT = ['13','5293094','5'].freeze

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
    @calculator.check_input(RpnCalculatorTest::TEST_INPUT.first)
    assert_equal @calculator.polish_expression.first, RpnCalculatorTest::TEST_INPUT.first
    @calculator.check_input(RpnCalculatorTest::TEST_INPUT[1])
    assert_equal @calculator.polish_expression.last, RpnCalculatorTest::TEST_INPUT[1]
    @calculator.check_input(RpnCalculatorTest::TEST_INPUT.last)
    assert_equal @calculator.polish_expression.last, RpnCalculatorTest::TEST_INPUT.last
  end

  def test_filter_input_filters_correct_characters
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

  def test_calculate_operator_input
    @calculator.stack = [5, 6]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS[0])
    assert_equal @calculator.stack[0], 11
    @calculator.stack = [10, 10]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS[3])
    assert_equal @calculator.stack[0], 1
    @calculator.stack = [5, 10]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS[1])
    assert_equal @calculator.stack[0], -5
    @calculator.stack = [100, 134]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS[2])
    assert_equal @calculator.stack[0], 13400
  end

  def test_divide_by_zero
    assert @calculator.check_divide_by_zero([10, 0], RpnCalculator::OPERATORS.last)
    assert @calculator.check_divide_by_zero([0, 0], RpnCalculator::OPERATORS.last)
    refute @calculator.check_divide_by_zero([0, 1], RpnCalculator::OPERATORS.last)
    refute @calculator.check_divide_by_zero([0, 0], RpnCalculator::OPERATORS.first)
    @calculator.stack = [100, 0]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS.last)
    assert_equal @calculator.stack[0], 0
  end

  def check_multiply_zero_by_another_number
    assert @calculator.check_multiply_zero_by_another_number([0, 0], RpnCalculator::OPERATORS[2])
    assert @calculator.check_multiply_zero_by_another_number([0, 100], RpnCalculator::OPERATORS[2])
    refute @calculator.check_multiply_zero_by_another_number([10, 0], RpnCalculator::OPERATORS[2])
    refute @calculator.check_multiply_zero_by_another_number([3, 5], RpnCalculator::OPERATORS[2])
    @calculator.stack = [0, 5]
    @calculator.calculate_operator_input(RpnCalculator::OPERATORS[2])
    assert_equal @calculator.stack[0], 0
  end
end