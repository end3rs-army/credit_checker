class Credit

	#Getter method
	attr_reader :card_number
	attr_reader :valid

	def initialize(card)
		#This instantiates values
		@card_number = card
		@valid = false
	end

	def luhn_algorithm

		card = []
		card_sum = 0

		@card_number.each_char do |x|
			digit = x.to_i
			card << digit
		end

		card.reverse!

		card.each_with_index do |x, i|

			if i%2 != 0 
				x = x * 2

				if x > 9
					x = x.to_s
					x = x[0].to_i + x[1].to_i
				end
			
			end

			card[i] = x
			card_sum = card_sum + x
			
		end

		card[card.size] = 10 - (card_sum.to_s.split("").last.to_i)

		puts card[card.size]

		final_sum = 0

		card.each do |x|

			final_sum = final_sum + x

		end

		if final_sum%10 == 0
			@valid = true	
			puts "Card number #{@card_number} is VALID"
		else
			puts "Card number #{@card_number} is INVALID!!!"
		end

	end	

end

puts "The below cards are VALID:\n\n"

check1 = Credit.new("49297354772505").luhn_algorithm

check2 = Credit.new("554180892379524").luhn_algorithm

check3 = Credit.new("402400713651238").luhn_algorithm

check4 = Credit.new("601179766886782").luhn_algorithm

#puts "\n The below cards are INVALID:\n\n"

#check5 = Credit.new("5541801923795240").luhn_algorithm

#check6 = Credit.new("4024007106512380").luhn_algorithm

#check7 = Credit.new("6011797668868728").luhn_algorithm

#puts "\n"

#puts "AMEX card check"

#check_AMEX_1 = Credit.new("342804633855673").luhn_algorithm

#check_AMEX_2 = Credit.new("342801633855673").luhn_algorithm
		
	
