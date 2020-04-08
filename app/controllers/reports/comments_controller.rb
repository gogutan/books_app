# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @report, notice: t(:created_comment)
    else
      @comments = @report.comments.sorted
      render "reports/show"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
