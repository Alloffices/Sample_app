class BookingsController < ApplicationController
  respond_to :html, :xml, :json

  before_action :find_tennis_court

  before_action :authenticate, except: [:index, :show]

  def index
    @bookings = Booking.where("tennis_court_id = ? AND end_time >= ?", @tennis_court.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = current_user.bookings.build
    # Booking.new(tennis_court_id: @tennis_court.id)
  end

  def create
    @booking =  current_user.bookings.build(params[:booking].permit(:tennis_court_id, :start_time, :length))
    # Booking.new
    @booking.tennis_court = @tennis_court
    if @booking.save
      redirect_to tennis_court_bookings_path(@tennis_court, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to tennis_court_bookings_path(@tennis_court)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.tennis_court = @tennis_court

    if @booking.update(params[:booking].permit(:tennis_court_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to tennis_court_bookings_path(@tennis_court)
      end
    else
      render 'edit'
    end
  end

  private

  def authenticate
    :authenticate_user! && current_user.try(:admin?)
  end


  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to tennis_court_booking_path(@tennis_court, @booking)
      else
        render 'new'
    end
  end

  def find_tennis_court
    if params[:tennis_court_id]
      @tennis_court = TennisCourt.find_by_id(params[:tennis_court_id])
    end
  end

end
