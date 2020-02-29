# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @reports = @user.reports
  end
end
