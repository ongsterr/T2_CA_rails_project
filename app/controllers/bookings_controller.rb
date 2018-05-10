class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.traveler = current_user
    session[:booking_charge] = @booking.total_cost
    session[:booking_days] = (@booking.booking_date_to.to_date - @booking.booking_date_from.to_date).to_i
    session[:booking_driver] = @booking.transporter.profile.full_name
    session[:booking_location] = @booking.product.location.location

    if @booking.save
        redirect_to booking_show_path(@booking)
    else
        redirect_back
    end
  end

  def show
    @amount = session[:booking_charge]
    @description = "#{session[:booking_days]} Days with #{session[:booking_driver]} @ #{session[:booking_location]}"
    @email = current_user.email
    session[:booking_id] = Booking.find(params[:id]).id
  end

  def confirm
    @booking = Booking.find(session[:booking_id])
    @booking.update(booking_confirmed?: true)
    BookingMailer.new_booking_notification(@booking).deliver
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
        params.require(:booking).permit(:booking_date_from, :booking_date_to, :number_of_traveler, :itinerary_file)
        results = {
            product_id: session[:product_id],
            transporter_id: session[:transporter_id],
            traveler_id: session[:user_id],
            booking_ref_number: "T2-#{rand.to_s[2..11]}",
            booking_date_from: params[:booking][:booking_date_from],
            booking_date_to: params[:booking][:booking_date_to],
            number_of_traveler: params[:booking][:number_of_traveler],
            transporter_cost: (params[:booking][:booking_date_to].to_date - params[:booking][:booking_date_from].to_date).to_i * session[:price_per_day].to_i,
            platform_cost: ((params[:booking][:booking_date_to].to_date - params[:booking][:booking_date_from].to_date).to_i * session[:price_per_day].to_i) * 0.2,
            total_cost: ((params[:booking][:booking_date_to].to_date - params[:booking][:booking_date_from].to_date).to_i * session[:price_per_day].to_i) * 1.2
        }
        return results
    end
end
