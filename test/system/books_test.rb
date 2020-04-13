# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    login_user("one@example.com", "password")
  end

  test "visit the books index" do
    visit books_url
    assert_selector "h1", text: "本"
  end

  test "create a Book" do
    visit books_url
    click_on "新しい本の追加"
    within "form[name=book]" do
      fill_in "タイトル", with: "Example Book"
      fill_in "メモ", with: "Example Memo"
      fill_in "著者", with: "Example Author"
      click_on "登録する"
    end
    assert_text "新しい本が追加されました。"
  end

  test "show a Book" do
    visit books_url
    click_on "詳細", match: :first
    assert_text "タイトル: Example Book 1"
  end

  test "update a Book" do
    visit books_url
    click_on "編集", match: :first
    within "form[name=book]" do
      fill_in "タイトル", with: "Updated Book"
      fill_in "メモ", with: "Updated Memo"
      fill_in "著者", with: "Updated Author"
      click_on "更新する"
    end
    assert_text "本が更新されました"
  end

  test "destroy a Book" do
    visit books_url
    accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "本が削除されました。"
  end

  test "should not create a Book without title" do
    visit books_url
    click_on "新しい本の追加"
    within "form[name=book]" do
      fill_in "メモ", with: "Example Memo"
      fill_in "著者", with: "Example Author"
      click_on "登録する"
    end
    assert_text "タイトルを入力してください"
  end

  test "should not update a Book without title" do
    visit books_url
    click_on "編集", match: :first
    within "form[name=book]" do
      fill_in "タイトル", with: ""
      fill_in "メモ", with: "Updated Memo"
      fill_in "著者", with: "Updated Author"
      click_on "更新する"
    end
    assert_text "タイトルを入力してください"
  end
end
