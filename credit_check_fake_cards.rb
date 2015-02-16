class Credit

	#Getter method
	attr_reader :card_number
	attr_reader :valid

	def initialize(card_number)
		#This instantiates values
		@card_number = card_number
		@valid = false
	end

	def luhn_algorithm

		card = []
		valid_test = 0

		@card_number.each_char do |x|
			digit = x.to_i
			card << digit
		end

		card_counter = 0

		card.reverse!

		card.each do |x|

			if card_counter%2 != 0 
				x = x * 2

				if x > 9
					x = x.to_s
					x = x[0].to_i + x[1].to_i
				end
			
			end

			card[card_counter] = x
			valid_test = valid_test + x
			card_counter += 1
			
		end

		if valid_test%10 == 0
			@valid = true	
			puts "Card number #{@card_number} is VALID"
		else
			#puts "Card number #{@card_number} is INVALID!!!"
		end

	end	

end

puts "The below FAKE cards are VALID:\n\n"

10000.times do 
	fake = 1_000_000_000_000_000 + Random.rand(10_000_000_000_000_000 - 1_000_000_000_000_000)
	fake = fake.to_s
	check_fake = Credit.new(fake).luhn_algorithm

end
		
	
