# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, :correct_user, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to commentable, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: commentable }
      else
        format.html { redirect_to commentable }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to commentable, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: commentable }
      else
        format.html { redirect_to commentable }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to commentable, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

    def commentable
      @comment.commentable
    end

    def correct_user
      redirect_to root_path unless set_comment.user == current_user
    end
end
