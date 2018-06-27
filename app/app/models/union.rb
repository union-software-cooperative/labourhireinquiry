
class Union < Supergroup
	
	has_many :people
	has_many :recs
	acts_as_followable


	def post_title
		"Post your union pictures and status updates here"
	end

	def questions
		custom = 
			if self.short_name == 'ANMF' 
				{
					pay_and_conditions: [
						:professional_development
					],
					health_and_safety: [
						:induction
					]
				}
			else
				{}
			end

		Rec.questions.merge(custom) do |key, oldval, newval|
			(newval.is_a?(Array) ? (oldval + newval) : (oldval << newval)).uniq
		end
	end
end
