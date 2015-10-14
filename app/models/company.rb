class Company < Supergroup
	has_many :posts, as: :parent
end
