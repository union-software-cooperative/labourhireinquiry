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

	def ios_video(attachment)
		if %w[video/quicktime video/mov].include?(attachment.content_type)
			"ios_video"
		else
			""
		end 
	end

	def owner?
		current_person.union.id == owner_union.id
	end

	def union_logo
		if @union.logo.url
			image_tag @union.logo.thumb.url
		else
			image_tag owner_union.logo.thumb.url 
		end 	
	end

	def gender_options(person)
    options_for_select(
      ([
        'male', 
        'female',
        'its complicated'
        ]).uniq, 
      person.gender
    )
  end

	def can_edit_union(union)
		false
		if current_person
			if current_person.union.id == owner_union.id || current_person.union.id == union.id
				true
			end 
		end
	end
end
