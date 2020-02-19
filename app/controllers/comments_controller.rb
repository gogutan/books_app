# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to commentable, notice: "Comment was successfully created."
    else
      redirect_to commentable
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to commentable, notice: "Comment was successfully updated."
    else
      redirect_to commentable
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to commentable, notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = current_user.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

    def commentable
      @comment.commentable
    end
end
