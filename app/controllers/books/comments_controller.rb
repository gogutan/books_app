# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to commentable, notice: "Comment was successfully created."
    else
      @book = commentable
      @comments = @book.comments.order(created_at: :asc)
      render "books/show"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

    def commentable
      @comment.commentable
    end
end
