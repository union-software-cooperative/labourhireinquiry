class Company < Supergroup
	acts_as_followable

	def post_title
		"Post your questions or research here"
	end
end
