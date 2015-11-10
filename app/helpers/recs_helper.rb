module RecsHelper

	def nature_of_employment_options
		options_for_select(
				([
					t("noe_informal"), 
					t('noe_agency'),
					t('noe_contractor'),
					t('noe_casual'),
					t('noe_rolling')
					]).uniq, 
				@rec.nature_of_employment
			)
	end

	def when_options
		options_for_select(
				([
					t("when_current"), 
					t("when_lt3"),
					t("when_lt12"),
					t("when_mt12")
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
		{ :size => 'small', 'on-text'=>t("switch_yes"), 'off-text'=>t("switch_no"), 'on-color'=>'success', 'off-color' => 'danger'}
	end

	def neutral_switch_options
		{ :size => 'small', 'on-text'=>t("switch_yes"), 'off-text'=>t("switch_no"), 'on-color'=>'success'}
	end

	def comment(q)
		"#{q.to_s}_comment"
	end
end
