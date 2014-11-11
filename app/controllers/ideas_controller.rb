class IdeasController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_idea, only: [:edit, :update, :destroy, :like]
  before_action :require_idea_user, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.all.order('created_at DESC')
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    
    if @idea.save
      flash[:notice] = "Idea successfully created!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @idea.update(idea_params)
      flash[:notice] = "Idea successfully updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @idea.destroy
      flash[:notice] = "Idea successfully deleted!"
      redirect_to root_path
    else
      render :back
    end
  end

  def like
    @like = Like.create(idea: @idea, user: current_user, like: params[:like])
    
    respond_to do |format|
      format.html do
        if @like.valid?
          flash[:notice] = "Liked!"
        else
          flash[:error] = "Already liked this idea."
        end
        redirect_to :back
      end
      format.js
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :user_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def require_idea_user
    access_denied unless logged_in? and (current_user == @idea.user)
  end

  def access_denied
    flash[:warning] = "Not allowed."
    redirect_to root_path
  end

end