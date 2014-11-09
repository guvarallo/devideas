class UsersController < ApplicationController

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Devideas #{@user.username}!"
      redirect_to root_path  
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end