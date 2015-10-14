class CompaniesController < SupergroupsController
	def show
		@post = Post.new(parent: @supergroup)
	end
end