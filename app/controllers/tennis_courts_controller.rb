class TennisCourtsController < ApplicationController

  def index
    @tennis_courts = TennisCourt.all
    @lead = Lead.new
  end

  def new
    @tennis_court = TennisCourt.new
  end

  def create
    @tennis_court = TennisCourt.create(tennis_court_params)
    if @tennis_court.save
      name = @tennis_court.name
      #redirects you to the index tennis court path
      redirect_to tennis_courts_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create tennis court. Please try again"
    end
  end

  def destroy
    @tennis_court = TennisCourt.find(params[:id])
    @tennis_court.destroy
    redirect_to tennis_courts_path
  end

  def edit
    #finds in database using id example: TennisCourt.find(params[:id])
    @tennis_court = TennisCourt.find(params[:id])
  end

  def update
    @tennis_court = TennisCourt.find(params[:id])
    @tennis_court.update tennis_court_params
    if @tennis_court.save
      flash[:notice] = "Your tennis court was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  #set save method so that it only accepts these methods
  private

    def tennis_court_params
      params.require(:tennis_court).permit(:name, :delete)
    end

end
