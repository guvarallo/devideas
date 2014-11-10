class UsersController < ApplicationController
  before_action :set_user,             only: [:edit, :update, :destroy]
  before_action :require_user,         only: [:edit, :update, :destroy]
  before_action :require_current_user, only: [:edit, :update, :destroy]
  before_action :destroy_session,      only: [:destroy]

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
    if @user.destroy
      flash[:notice] = "Sorry to see you go... hope you come back soon!"
      redirect_to root_path
    else
      render :back
    end
  end

  private

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def destroy_session
    session[:user_id] = nil
  end

end