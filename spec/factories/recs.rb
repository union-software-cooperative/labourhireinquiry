FactoryGirl.define do
	factory :agreement, class: Rec do
		name "NUW/Mondelz"
		end_date 3.years.from_now
		start_date Time.now
		association :company, factory: :company, name: "Mondelz"
		association :union, factory: :union, name: "NUW"
		association :person, factory: :person
	end
end