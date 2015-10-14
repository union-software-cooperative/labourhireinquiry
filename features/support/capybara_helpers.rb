module CapybaraHelpers
	def select2(value, label)
	  #s2c = first("#s2id_#{attrs[:from]}")
	  #(s2c.first(".select2-choice") || s2c.find(".select2-choices")).click

	  #find(:xpath, "//body").all("input.select2-input")[-1].set(value)
	  #binding.pry
	  #fill_in placeholder, with: value # was working??

	  #page.execute_script(%|$("input.select2-input:visible").keyup();|)
	  field_labeled(label).click
	  all('input').last.set(value)
	  all('.select2-results li', text: value)[-1].click

	  #drop_container = ".select2-results"
	  #find(:xpath, "//body").all("#{drop_container} li", text: value)[-1].click
	end
end
World(CapybaraHelpers)