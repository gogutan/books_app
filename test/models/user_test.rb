# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "follow user" do
    user = users(:one)
    other_user = users(:three)
    user.follow(other_user)
    assert user.following.include?(other_user)
  end

  test "unfollow user" do
    user = users(:one)
    other_user = users(:two)
    user.unfollow(other_user)
    assert_not user.following.include?(other_user)
  end

  test "check following user" do
    user = users(:one)
    following_user = users(:two)
    not_following_user = users(:three)
    assert user.following?(following_user)
    assert_not user.following?(not_following_user)
  end
end
