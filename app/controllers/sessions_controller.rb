class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = Admin.authenticate(params[:username],params[:password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.name}"
      redirect_to(:controller => 'admins',:action => 'index')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end
end

