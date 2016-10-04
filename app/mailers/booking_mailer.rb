class BookingMailer < ApplicationMailer
  default from: 'nabhi42@gmail.com'

  def booking_email(booking,email,room)
    @booking = booking
    @room=room
    mail(to: email, subject: 'thank you for booking')
  end
end
