module RecsHelper
	def selected_option(entity)
		entity ? 
        options_for_select([[render(entity).html_safe, entity.id]], entity.id) :
        []
	end

	def nature_of_operation(f)
		options = options_for_select(
				(%w[fresh-milk powdered-milk butter cheese yogurt ice-cream cream industrial-dairy food-service other-specific] + @rec.nature_of_operation).uniq, 
				@rec.nature_of_operation
			)
		control = f.select :nature_of_operation,
			options, 
      {
          include_blank: true,
      },
      data: { 
        placeholder: "Please select one or more operations, or add your own.",
      }, 
      multiple: true, 
      class: "ac-select2-tags form-control", 
      style: "width: 100%;"
      #control = control.gsub('value=""', "")
      #	.gsub('"selected"', '"true"').html_safe
				#.gsub('nature_of_operation]', 'nature_of_operation][]').html_safe
				#control.gsub('value=""', "").html_safe
			control
	end

end
