class LeadsController < ApplicationController

	def create
		@lead = Lead.new lead_params
		if @lead.save
			# cookies[:saved_lead] = true
			redirect_to root_path, notice: "Saved Successfully!"
		else
			redirect_to root_path, alert: "Failed to save"
		end

	end

	private
	
	def lead_params
		params.require(:lead).permit(:name, :email, :devise, :social_media)
	end

end

