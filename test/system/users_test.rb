# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "create a User" do
    visit new_user_registration_path
    within "form[class=new_user]" do
      fill_in "Eメール", with: "example@example.com"
      fill_in "郵便番号", with: "1234567"
      fill_in "住所", with: "Example Address"
      fill_in "自己紹介", with: "Example Introduction"
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認用）", with: "password"
      click_on "アカウント登録"
    end
    assert_text "アカウント登録が完了しました。"
  end

  test "show a User" do
    login_user("1@example.com", "password")
    visit user_path(users(1))
    assert_text "Eメール: 1@example.com"
  end

  test "update a User" do
    login_user("1@example.com", "password")
    visit edit_user_registration_path
    within "form[class=edit_user]" do
      fill_in "Eメール", with: "updated@example.com"
      fill_in "郵便番号", with: "2345678"
      fill_in "住所", with: "Updated Address"
      fill_in "自己紹介", with: "Updated Introduction"
      fill_in "現在のパスワード", with: "password"
      click_on "更新"
    end
    assert_text "アカウント情報を変更しました。"
  end

  test "destroy a User" do
    login_user("1@example.com", "password")
    visit edit_user_registration_path
    within "form[class=button_to]" do
      accept_confirm do
        click_on "アカウント削除", match: :first
      end
    end
    assert_text "アカウント登録もしくはログインしてください。"
  end
end
