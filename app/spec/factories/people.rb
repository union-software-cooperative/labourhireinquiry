FactoryGirl.define do
  factory :person do
    first_name "Test"
		last_name "Tester"
		title "MyString"
		address "MyText"
		mobile "+61 439 541 888"
		fax "MyString"
		email "user@iufdb.org"
		password "asdfasdf"
		password_confirmation "asdfasdf"
  end

end
