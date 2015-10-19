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
					'directly employed casual',
					'on a rolling contract'
					]).uniq, 
				@rec.nature_of_employment
			)
	end

	def when_options
		options_for_select(
				([
					'current job', 
					'less than 3 months ago',
					'less than a year ago',
					'more than a year ago'
					]).uniq, 
				@rec.when
			)
	end

	def default_switch_options
		{ :size => 'small', 'on-text'=>'Yes', 'off-text'=>'No', 'on-color'=>'success', 'off-color' => 'danger'}
	end

	def comment(q)
		"#{q.to_s}_comment"
	end
end
