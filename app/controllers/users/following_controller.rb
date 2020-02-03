# frozen_string_literal: true

class Users::FollowingController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @following_users = @user.following
  end
end
