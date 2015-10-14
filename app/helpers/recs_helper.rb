module RecsHelper
	def selected_option(entity)
		entity ? 
        options_for_select([[render(entity).html_safe, entity.id]], entity.id) :
        []
	end

	def nature_of_operation_options
		options_for_select(
				(%w[fresh-milk powdered-milk butter cheese yogurt ice-cream cream industrial-dairy food-service other-specific] + @rec.nature_of_operation).uniq, 
				@rec.nature_of_operation
			)
	end

end
