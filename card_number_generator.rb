10000.times do 
	fake = 1_000_000_000_000_000 + Random.rand(10_000_000_000_000_000 - 1_000_000_000_000_000)
	fake = fake.to_s
	
	#Below is where you'd send the generated number through your algorithm
	#check_fake = Credit.new(fake).luhn_algorithm
end