module SupergroupsHelper
	
	def supergroup
		@klass.name.downcase
	end

	def supergroups
		@klass.name.pluralize.downcase
	end
end
