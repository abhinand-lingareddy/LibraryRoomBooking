class BookingsController < ApplicationController
  def new
    @booking=Booking.new
  end



  def create

    begin
      if params[:user_id]
        userid=params[:user_id]
      else
        userid=session[:user_id]
      end
      id=Booking.create(date:params[:date],endtime:(params[:time].to_i+2),user_id:userid,room_id:params[:room_id])
      @room = Room.find(params[:room_id])
      sending_email(id, userid)
      flash["notice"]="booking sucessfully created, check email for more details"
      redirect_to room_path(@room)
    rescue Exception
      flash["notice"]="your requested time slot has been already booked, please check the bellow table"
      redirect_to room_path(params[:room_id])
    end

  end



  def destroy
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.find(params[:id])
    @booking.destroy
    redirect_to room_path(@room)
  end

  def booking_params
    params.require(:booking).permit( :time)
  end

  private
  def sending_email(id, userid)
    @user= User.find(userid)
    @booking=Booking.find(id)
    BookingMailer.booking_email(@booking, @user.email, @room).deliver_now!
    emails=params[:emails]
    values=emails.split(",")
    values.each do |value|
      BookingMailer.booking_email(@booking, value, @room).deliver_now!
    end
  end
end
