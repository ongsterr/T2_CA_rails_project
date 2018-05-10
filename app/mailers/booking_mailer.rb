class BookingMailer < ApplicationMailer
    default from: "admin@T2.com"
    def new_booking_notification(booking)
        @booking = booking
        mail to: @booking.traveler.email, subject: "Booking Confirmation with T2"
    end
end