class ChargesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        
    end

    def create
        @amount = session[:booking_charge].to_i

        @customer = Stripe::Customer.create(
            email: params[:stripeEmail],
            source: params[:stripeToken]
        )

        @charge = Stripe::Charge.create(
            customer: @customer.id,
            amount: @amount,
            description: "#{session[:booking_days]}Days with #{session[:booking_driver]} @ #{session[:booking_location]}",
            currency: 'aud'
        )

        if @charge[:status] == "succeeded"
            redirect_to booking_confirm_path(Booking.find(session[:booking_id]))
        end

        rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path


    end
end
