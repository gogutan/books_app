# frozen_string_literal: true

require "application_system_test_case"

class FollowingTest < ApplicationSystemTestCase
  test "show the users only following" do
    login_user("1@example.com", "password")
    visit user_following_path(users(1))
    assert_text "1@example.comさんのフォロー一覧"
    assert_text "2@example.com"
    assert_no_text "3@example.com"
  end
end
