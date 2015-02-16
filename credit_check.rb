class Credit

	#Getter method
	attr_reader :card_number, :valid, :card, :calculation

	def initialize(card=0)
		#This instantiates values
		@card_number = card
		@calculation = 0
		@valid = false
		@card = []
	end

	def to_s
		
		"Analyzing card number #{card_number}\n\n"
	end

	def create_card_array

		@card_number.each_char do |x|
			digit = x.to_i
			@card << digit
		end
	end

	def compute_sequence
		
		@card.reverse!

		@card.each_with_index do |x, i|

			if i%2 != 0 
				x = x * 2

				if x > 9
					x = x.to_s
					x = x[0].to_i + x[1].to_i
				end
			
			end

		@calculation += x
		
		end
	end

	def check_validity

		if @calculation%10 == 0
			@valid = true	
		end

		if @valid == true

			puts "Card number #{@card_number} is VALID"
		
		elsif @valid == false
			
			puts "Card number #{@card_number} is INVALID!!!"
		
		end
	end	
end


puts "The below cards are VALID:\n\n"

check1 = Credit.new("4929735477250543")

check1.create_card_array
check1.compute_sequence
check1.check_validity


#VALID CARD #s
#"5541808923795240"

#"4024007136512380"

#"6011797668867828"

#INVALID CARD #s

#"5541801923795240"

#"4024007106512380"

#"6011797668868728"

#AMEX valid: "342804633855673"

#AMEX invalid "342801633855673"

#puts "My SSN\n\n"

#check_SSN = Credit.new("006864852")
		
	
