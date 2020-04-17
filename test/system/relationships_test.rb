# frozen_string_literal: true

require "application_system_test_case"

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    login_user("1@example.com", "password")
  end

  test "follow a user" do
    visit user_path(users(3))
    within "form[class=new_relationship]" do
      click_on "フォロー"
    end
    assert_text "ユーザーをフォローしました。"
  end

  test "unfollow a user" do
    visit user_path(users(2))
    within "form[class=edit_relationship]" do
      click_on "フォロー解除"
    end
    assert_text "ユーザーをフォロー解除しました。"
  end
end
