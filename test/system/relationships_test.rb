# frozen_string_literal: true

require "application_system_test_case"

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    login_user("one@example.com", "password")
  end

  test "follow a user" do
    visit user_path(users(:three))
    within "form[class=new_relationship]" do
      click_on "フォロー"
    end
    assert_text "ユーザーをフォローしました。"
  end

  test "unfollow a user" do
    visit user_path(users(:two))
    within "form[class=edit_relationship]" do
      click_on "フォロー解除"
    end
    assert_text "ユーザーをフォロー解除しました。"
  end
end
