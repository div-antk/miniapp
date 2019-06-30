class CommentsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
    comments.create(text: "")
  end

  private
  def comment_params
    params.permit(:text)
  end
end
