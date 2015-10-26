class PersonMailer < ApplicationMailer
	def rec_notice(person, rec, request)
		@person = person
		@rec = rec
		@request = request
		mail(from: from(request), to: person.email, subject: "#{person.display_name} has made a submission.")
	end

	def post_notice(person, post, request)
		@person = person
		@post = post
		@request = request
		mail(from: from(request), to: person.email, subject: "#{person.display_name} has posted a message.")
	end

	def comment_notice(person, comment, request)
		@person = person
		@comment = comment
		@request = request
		mail(from: from(request), to: person.email, subject: "#{person.display_name} has left a comment.")
	end

private
	def from(request)
		"noreply@#{request.host}".gsub("www.", "")
	end
end
