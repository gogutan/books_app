# frozen_string_literal: true

require "application_system_test_case"

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    login_user("one@example.com", "password")
  end

  test "follow a user" do
    visit user_path(users(:three))
    click_on "フォロー"
    assert_text "ユーザーをフォローしました。"
  end

  test "unfollow a user" do
    visit user_path(users(:two))
    click_on "フォロー解除"
    assert_text "ユーザーをフォロー解除しました。"
  end
end
