class BookingsController < ApplicationController
  def new
    @booking=Booking.new
  end



  def create

    begin
      id=Booking.create(date:params[:date],endtime:(params[:time].to_i+2),user_id:session[:user_id],room_id:params[:room_id])
      @room = Room.find(params[:room_id])
      @user= User.find(session[:user_id])
      @booking=Booking.find(id)
      BookingMailer.booking_email(@booking,@user,@room).deliver_now!
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
end
