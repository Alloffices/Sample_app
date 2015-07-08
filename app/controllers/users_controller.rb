class UsersController < ApplicationController
	before_filter :authenticate_admin!, :except => [:show]

	def show
	  @user = User.find_by_name(params[:id])
	end
end
