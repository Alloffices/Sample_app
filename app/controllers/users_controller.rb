class UsersController < ApplicationController
	before_filter :authenticate_admin!, :except => [:show]

  # before_action :find_tennis_court

	def show
	  @user = User.find_by_name(params[:id])
	end

	def create
	end


end
