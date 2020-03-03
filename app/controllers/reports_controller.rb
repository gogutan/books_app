# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :report_user_should_be_current_user, only: [:edit, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.order(created_at: :desc)
  end

  # GET /reports/1
  def show
    @comments = @report.comments.sorted
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to @report, notice: "Report was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: "Report was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :content, :user_id)
    end

    def report_user_should_be_current_user
      redirect_to reports_path unless @report.user == current_user
    end
end
