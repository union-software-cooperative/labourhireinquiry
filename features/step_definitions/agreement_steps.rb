Then(/^I can add an agreement titled "(.*?)" between "(.*?)" and "(.*?)" and assigned to "(.*?)"$/) do |title, company, union, assignee|
	page.should have_link("New Agreement", href: new_rec_path)
	visit new_rec_path

	fill_in "rec[name]", with: title
	select2 company, "Company"
	select2 union, "Union"
	select2 assignee, "Person"
	#select2 "union", "rec[union_id]"
	click_button "Save Agreement"

	page.should have_content(title)
end

Then(/^I can add an agreement with no data$/) do 
	page.should have_link("New Agreement", href: new_rec_path)
	visit new_rec_path

	click_button "Save Agreement"

	page.should have_content("Name can't be blank")
	page.should have_content("Union can't be blank")
	page.should have_content("Person can't be blank")
	page.should have_content("Company can't be blank")
end