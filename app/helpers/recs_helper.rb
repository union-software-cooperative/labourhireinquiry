module RecsHelper

	def nature_of_employment_options
		options_for_select(
				([
					'informally employed', 
					'employed through a labour hire agency',
					'contracting with an ABN but to one employer only',
					'a directly employed casual',
					'on a rolling contract'
					]).uniq, 
				@rec.nature_of_employment
			)
	end

	def when_options
		options_for_select(
				([
					'in my current job', 
					'less than 3 months ago',
					'less than a year ago',
					'more than a year ago'
					]).uniq, 
				@rec.when
			)
	end

	def union_options
		result = []
		Union.all.order(:short_name).each do |u|
			result << ["#{u.short_name}: #{u.name}", u.id]
		end
		result
	end

	def default_switch_options
		{ :size => 'small', 'on-text'=>'Yes', 'off-text'=>'No', 'on-color'=>'success', 'off-color' => 'danger'}
	end

	def comment(q)
		"#{q.to_s}_comment"
	end
end
