class RequestMailer < ActionMailer::Base
	default from: "no-reply@nobbble.com"
	default to: "nobbble1@gmail.com"

	def request_created(user)
		@user = user
		mail(subject: "Request",
			body: "A request has been made by #{user.name}."
			)
	end

end
