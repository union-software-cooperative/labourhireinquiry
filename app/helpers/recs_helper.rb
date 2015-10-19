module RecsHelper
	def selected_option(entity)
		entity ? 
        options_for_select([[render(entity).html_safe, entity.id]], entity.id) :
        []
	end

	def nature_of_employment_options
		options_for_select(
				([
					'informally employed', 
					'employed through labour hire agency',
					'contracting with an ABN but to one employer only',
					'directly employed casual'
					]).uniq, 
				@rec.nature_of_employment
			)
	end

	def default_switch_options
		{ :size => 'small', 'on-text'=>'Yes', 'off-text'=>'No', 'on-color'=>'success', 'off-color' => 'danger'}
	end

end
