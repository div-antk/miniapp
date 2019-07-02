class CommentsController < ApplicationController
  
  # before_action :move_to_index, except: :index

  def index
  end

  def new
  end

  def create
    # comments.create(text: "")
  end

  private
  def move_to_index
    # redirect_to action: :index
  end

  def comment_params
    # params.require(:user).permit(:name, :text)
    # params.require(:user).permit(:name, :text)

  end
end
