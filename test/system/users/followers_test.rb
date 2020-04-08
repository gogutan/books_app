# frozen_string_literal: true

require "application_system_test_case"

class FollowersTest < ApplicationSystemTestCase
  test "show the users only followed by" do
    login_user("one@example.com", "password")
    visit user_followers_path(users(:two))
    assert_text "two@example.comさんのフォロワー一覧"
    assert_text "one@example.com"
    assert_no_text "three@example.com"
  end
end
