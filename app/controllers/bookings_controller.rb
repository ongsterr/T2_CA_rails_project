class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.traveler = current_user

    if @booking.save
        flash[:notice] = 'Booking completed!'
        redirect_to booking_show_path
    else
        flash[:alert] = 'Booking could not be completed!'
        redirect_back
    end
  end

  def show
  end

  def index
    @bookings = Booking.find_by(traveler: current_user)
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
        flash[:notice] = 'Booking updated!'
        redirect_to booking_show_path
    else
        flash[:alert] = 'Booking could not be updated!'
        redirect_back
    end
  end

  def destroy
    @booking.destroy
    flash[:alert] = 'Booking has been cancelled!'
    redirect_to booking_index_path # Check this
  end

  private
    def set_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:booking_date_from, :booking_date_to, :number_of_traveler)
    end
end
