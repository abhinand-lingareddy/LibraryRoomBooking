require 'date'
class RoomsController < ApplicationController
  def index
    if params[:field]
      @rooms = Room.search(params[:field],params[:search])
    else
      @rooms =Room.all
    end
    @field = ["Room Number","Building Name", "Capacity"]
  end

  def new
    @room = Room.new


  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_url
  end

  def show
    #date
    start_date = Date.today
    end_date = 7.days.from_now
    @date = (start_date..end_date);

    #time
    @time=(0..22).select {|x| x.even? }
    @room = Room.find(params[:id])

  end



  private
  def room_params
    params.require(:room).permit(:roomnumber, :buildingname,:capacity )
  end
end
