# frozen_string_literal: true

require "application_system_test_case"

class FollowersTest < ApplicationSystemTestCase
  test "show the users only followed by" do
    login_user("1@example.com", "password")
    visit user_followers_path(users(2))
    assert_text "2@example.comさんのフォロワー一覧"
    assert_text "1@example.com"
    assert_no_text "3@example.com"
  end
end
