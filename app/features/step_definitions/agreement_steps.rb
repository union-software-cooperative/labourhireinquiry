Then(/^I can add an agreement titled "(.*?)" between "(.*?)" and "(.*?)" and assigned to "(.*?)" with tag "(.*?)"$/) do |title, company, union, assignee, tag|
	page.should have_link("New Agreement", href: new_rec_path)
	visit new_rec_path

	fill_in "rec[name]", with: title
	select2 company, label: "Company"
	select2 union, label: "Union"
	select2 assignee, label: "Person"
	select2 tag, placeholder: "Please select one or more operations, or add your own."
	
	#select2 "union", "rec[union_id]"
	click_button "Save Agreement"
	page.should have_content(title)
	page.should have_content(tag)
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
