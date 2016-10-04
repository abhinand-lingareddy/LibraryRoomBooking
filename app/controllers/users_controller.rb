class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def list_admins
    @users = User.where(["admin = ?", true])
  end

  def list_members
    @users = User.where(["admin = ?", false])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def history
    id=session[:user_id]
    user=User.find(id)
    bookings=user.bookings
    today_date=Date.today
    current_time=Time.now.hour
    @old_booking=Array.new
    @new_booking=Array.new
    for booking in bookings
      if booking.date<today_date or (booking.date==today_date and booking.endtime<current_time)
        @old_booking.append booking
      else
        @new_booking.append booking
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if not session[:admin]
      @user.update_attribute :admin, false
    end

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now!
        format.html { redirect_to @user, notice: 'User was successfully created,please check email for more details ' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.id != 1
      @user.destroy
      notice='User was successfully destroyed.'
    else
      notice='Cannot delete super admin'
    end
    respond_to do |format|
      format.html { redirect_to users_url, notice: notice }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :password, :admin)
    end
end
