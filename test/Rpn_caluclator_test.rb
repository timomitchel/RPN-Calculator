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
end