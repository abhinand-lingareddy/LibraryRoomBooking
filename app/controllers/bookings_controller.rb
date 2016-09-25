class BookingsController < ApplicationController
  def new
    @booking=Booking.new
  end



  def create

    if Booking.create(date:params[:date],endtime:(params[:time].to_i+2),user_id:session[:userid],room_id:params[:room_id])
      @room = Room.find(params[:room_id])
      redirect_to room_path(@room)
    else
      #handle error
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
