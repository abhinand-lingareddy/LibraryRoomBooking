class AdminsController < ApplicationController

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def edit

  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    redirect_to admins_url
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :name, :password)
  end

end
