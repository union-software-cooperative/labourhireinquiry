module RecsHelper
	def selected_option(entity)
		entity ? 
        options_for_select([[render(entity).html_safe, entity.id]], entity.id) :
        []
	end
end
