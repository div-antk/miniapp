class CommentsController < ApplicationController
  
  # before_action :move_to_index, except: :index

  def index
    # @comments = Comment.select("text")
    @comment = Comment.new
    @comments = Comment.order("created_at DESC").page(params[:page]).per(1)
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to action: 'index'
  end

  def create
    # @comment = Comment.new(comment_params)
    # Comment.create(create_params)
    Comment.create(text: create_params[:text], user_id: current_user.id)
    # binding.pry
    redirect_to action: 'index'
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.update(create_params)
    end
    redirect_to action: 'index'
  end


  private
    # def move_to_index
    #   redirect_to action: :index
    # end

  def create_params
    params.require(:comment).permit(:text) 
    # validates_presence_of
  end

end
