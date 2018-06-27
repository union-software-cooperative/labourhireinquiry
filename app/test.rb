require 'securerandom'

def set_token
		v = %w[a e i o u]
		c = ('a'..'z').to_a
		c = c - v
		s = ""

		(1..7).each do |i|
			s << c[SecureRandom.random_number(21)] if i % 2 == 1
			s << v[SecureRandom.random_number(5)] if i % 2 == 0 
		end
		
		s
	end

(1..100).each do |i|
 p set_token
end
