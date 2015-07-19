class BokingMailer < ActionMailer::Base
	default from: "no-reply@gmail.com"
	default to: "alloffices.nyc@gmail.com"

	def boking_created(boking)
		@boking = boking
		mail(subject: "New Booking")
	end

end
