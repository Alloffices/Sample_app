class RequestedMailer < ActionMailer::Base
	default from: "no-reply@nobbble.com"

	def requested_created(current_user, booking_user)

		@current_user = current_user
		@booking_user = booking_user

		mail(to: booking_user.email,
			subject: "Request From Another Creative",
			body: "Hi, This is another request for session. #{current_user.name}, #{current_user.email}, #{current_user.social_media}, #{current_user.skill} "
			)
	end

end
