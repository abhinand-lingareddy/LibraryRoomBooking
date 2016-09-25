class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username],params[:password])
    if authorized_user
      session[:user_id]= authorized_user.id
      session[:admin] = authorized_user.admin
      redirect_to(:action => 'home')

    else
      flash[:notice] = "Invalid Username or Password"
      render "login"
    end
  end

  def home
  end

  def logout
    session[:user_id] = nil
    session[:admin] = nil
    redirect_to :action => 'login'
  end
end
