FactoryGirl.define do
  factory :company do
    name "Test Company"
		type "Company"
		www "www.company.com"
  end

  factory :union do
    name "Test Union"
		type "Union"
		www "www.union.com"
  end
end
