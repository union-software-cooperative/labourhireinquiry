FactoryGirl.define do
	factory :agreement, class: Rec do
		name "NUW/Mondelz"
		end_date 3.years.from_now
	end
end