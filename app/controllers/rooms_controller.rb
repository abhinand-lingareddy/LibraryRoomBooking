require 'date'
class RoomsController < ApplicationController
  def index
    room_search
    search_options
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
    date_options

    #time
    time_options
    @room = Room.find(params[:id])
    username_from_id

  end




  private
  def room_params
    params.require(:room).permit(:roomnumber, :buildingname,:capacity )
  end

  def search_options
    @field = {"Room Number" => "roomnumber", "Building Name" => "buildingname", "Capacity" => "capacity"}
  end

  def room_search
    if params[:field]
      @rooms = Room.search(params[:field], params[:search])
    else
      @rooms =Room.all
    end
  end

  def time_options
    @time=(0..22).select { |x| x.even? }
  end

  def username_from_id
    users= User.all
    @usersHash = Hash.new
    for user in users do
      @usersHash[user.email]=user.id
    end
  end

  def date_options
    start_date = Date.today
    end_date = 7.days.from_now
    @date = (start_date..end_date)
  end
end
