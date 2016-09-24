class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
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
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:roomnumber, :buildingname,:capacity )
  end
end
