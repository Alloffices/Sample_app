class LeadsController < ApplicationController

	def create
		@lead = Lead.new lead_params
		if @lead.save
			# cookies[:saved_lead] = true
			LeadMailer.signup_confirmation(@lead).deliver
			redirect_to root_path, notice: "Thanks! You're on the waiting list."
		else
			redirect_to root_path, alert: "Failed to request invitation"
		end

	end

	private
	
	def lead_params
		params.require(:lead).permit(:name, :email, :devise, :social_media)
	end

end

