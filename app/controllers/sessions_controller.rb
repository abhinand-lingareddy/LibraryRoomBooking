class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username],params[:password])
    if authorized_user
      session[:user_id]= authorized_user.id
      session[:user_name] = authorized_user.name
      session[:admin] = authorized_user.admin
      redirect_to(:controller => 'users',:action => 'index')

    else
      flash[:notice] = "Invalid Username or Password"
      render "login"
    end
  end
end

