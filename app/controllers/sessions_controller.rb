class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = Admin.authenticate(params[:username],params[:password])
    if authorized_user
      session[:userid]= authorized_user.id
      redirect_to(:controller => 'admins',:action => 'index')

    else
      flash[:notice] = "Invalid Username or Password"
      render "login"
    end
  end
end

