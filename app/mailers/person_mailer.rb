class PersonMailer < ApplicationMailer
	add_template_helper(ApplicationHelper)

	def rec_notice(person, rec, request, can_edit)
		@person = person
		@rec = rec
		@request = request
		@can_edit = can_edit
		mail(from: from(request), to: person.email, subject: "#{rec.person.display_name} has made a submission.")
	end

	def post_notice(person, post, request)
		@person = person
		@post = post
		@request = request
		mail(from: from(request), to: person.email, subject: "#{post.person.display_name} has posted a message.")
	end

	def comment_notice(person, comment, request)
		@person = person
		@comment = comment
		@request = request
		mail(from: from(request), to: person.email, subject: "#{comment.person.display_name} has left a comment.")
	end

	def thanks(person, rec, request)
		@person = person
		@rec = rec
		@request = request
		mail(from: from(request), to: person.email, subject: "Thanks for your submission")
	end

private
	def from(request)
		"noreply@#{request.host}".gsub("www.", "")
	end
end
