require 'minitest/autorun'
require 'minitest/pride'
require './credit_check'

class CreditCheckTest < Minitest::Test 

	def setup
		@check = Credit.new("1111")
	end

	def test_it_initializes_a_card_number
		result = @check.card_number

		assert_equal "1111",result
	end

	def test_it_prints_initial_message
		check_string = Credit.new
		result = check_string.to_s
		assert_equal "Analyzing card number 0\n\n",result
	end

	def test_it_creates_a_card_array
		@check.create_card_array 
		result = @check.card

		assert_equal [1,1,1,1],result
	end

	def test_it_adds_array_correctly
		@check.create_card_array 
		@check.compute_sequence
		result = @check.calculation

		assert_equal 6,result
	end

	def test_it_validates_correctly_true
		check_valid = Credit.new("4929735477250543")
		check_valid.create_card_array
		check_valid.compute_sequence
		check_valid.check_validity
		result = check_valid.valid 

		assert_equal true,result
	end

	def test_it_validates_correctly_false
		check_invalid = Credit.new("6011797668868728")
		check_invalid.create_card_array
		check_invalid.compute_sequence
		check_invalid.check_validity
		result = check_invalid.valid
		
		assert_equal false,result
	end
end 