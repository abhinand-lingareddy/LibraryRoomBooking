class BookingMailer < ApplicationMailer
  default from: 'nabhi42@gmail.com'

  def booking_email(booking,user,room)
    @booking = booking
    @room=room
    @user=user
    mail(to: @user.email, subject: 'thank you for booking')
  end
end
