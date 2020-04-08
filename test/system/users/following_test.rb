# frozen_string_literal: true

require "application_system_test_case"

class FollowingTest < ApplicationSystemTestCase
  test "show the users only following" do
    login_user("one@example.com", "password")
    visit user_following_path(users(:one))
    assert_text "one@example.comさんのフォロー一覧"
    assert_text "two@example.com"
    assert_no_text "three@example.com"
  end
end
