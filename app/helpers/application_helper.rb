module ApplicationHelper
	def profile_thumb(person)		
		unless person.attachment.blank?
			image_tag person.attachment.thumb.url, class: "profile_thumb"
		else
			"<span class=\"glyphicon glyphicon-user\"></span>".html_safe
		end
	end

	def profile_logo(person)		
		unless person.attachment.blank?
			image_tag person.attachment.quote.url, class: "profile_logo"
		else
			"<span class=\"glyphicon glyphicon-user\"></span>".html_safe
		end
	end

	def pencil_button
		"<span class=\"small glyphicon glyphicon-pencil\"/>".html_safe 
	end

	def profile_picture(person)		
		unless person.attachment.blank?
			image_tag person.attachment.quote.url, class: "profile_quote"
		end
	end

	def owner_union
		Rails.application.config.owner_union
	end

	def selected_option(entity)
		entity ? 
        options_for_select([[entity.name, entity.id]], entity.id) :
        []
	end
end
