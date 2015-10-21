module SupergroupsHelper

	def supergroup
		@klass.name.downcase
	end

	def supergroups
		@klass.name.pluralize.downcase
	end

	def follow_polymorphic_path()
		eval("follow_#{supergroup}_path")
	end

	def banner_image
		unless @supergroup.banner.blank?
			image_tag @supergroup.banner.url, class: "banner-image"
		end
	end

	def logo_image
		unless @supergroup.logo.blank?
			image_tag @supergroup.logo.url, class: "logo-image"
		end
	end

	def logo_thumb(supergroup)
		unless supergroup.logo.blank?
			image_tag supergroup.logo.thumb.url, class: "logo-thumb"
		end
	end

	def banner_title
		  link_to  @supergroup.name, "http://#{@supergroup.www}", data: {short_name: @supergroup.short_name + ' Submissions', name: @supergroup.name + ' Submissions'}, class: "banner-link"
	end
end
