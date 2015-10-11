Given /^I am not authenticated$/ do
  visit('/people/sign_out') # ensure that at least
end

Given /^I am a new, authenticated person$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  Person.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/people/sign_in'
  fill_in "person_email", :with => email
  fill_in "person_password", :with => password
  click_button "Log in"

end