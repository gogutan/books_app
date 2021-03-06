# frozen_string_literal: true

class Books::TimelineController < ApplicationController
  def index
    @books = Book.where(user_id: current_user.following + [current_user]).order(created_at: :asc).page(params[:page])
  end
end
