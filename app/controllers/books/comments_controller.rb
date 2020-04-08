# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @book, notice: t(:created_comment)
    else
      @comments = @book.comments.sorted
      render "books/show"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
