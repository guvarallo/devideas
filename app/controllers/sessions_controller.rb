class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back #{user.username}!"
      redirect_to root_path
    else
      flash[:warning] = "Oops! Invalid username or password, try again."
      redirect_to login_path
    end
  end
  
  def destroy
    flash[:notice] = "See you soon #{user.username}!"
    session[:user_id] = nil
    redirect_to root_path
  end

end  
