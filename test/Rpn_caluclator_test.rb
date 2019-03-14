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
end