# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "#follow" do
    user = users(1)
    other_user = users(3)
    user.follow(other_user)
    assert_includes user.following, other_user
  end

  test "#unfollow" do
    user = users(1)
    other_user = users(2)
    user.unfollow(other_user)
    assert_not_includes user.following, other_user
  end

  test "#following?" do
    user = users(1)
    following_user = users(2)
    not_following_user = users(3)
    assert user.following?(following_user)
    assert_not user.following?(not_following_user)
  end
end
