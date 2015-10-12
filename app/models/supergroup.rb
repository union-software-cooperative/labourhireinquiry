class Supergroup < ActiveRecord::Base
	# Used for index searching
  include Filterable
  scope :name_like, -> (name) {where("name ilike ?", "%#{name}%")}
end
