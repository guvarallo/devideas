class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show; end

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

  def edit; end

  def update
    if @user.update
      flash[:notice] = "User successfully edited."
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end