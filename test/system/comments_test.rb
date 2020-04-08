# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    login_user("one@example.com", "password")
  end

  test "create a Comment" do
    visit book_path(books(:one))
    fill_in "コメント内容", with: "Example Content"
    click_on "登録する"
    assert_text "新しいコメントが追加されました。"
  end

  test "show a Comment" do
    visit book_path(books(:one))
    fill_in "コメント内容", with: "This comment must be shown in the book page."
    click_on "登録する"
    assert_text "This comment must be shown in the book page."
  end

  test "update a Comment" do
    visit edit_comment_path(comments(:one))
    fill_in "コメント内容", with: "Example Content"
    click_on "更新する"
    assert_text "コメントが更新されました。"
  end

  test "destroy a Comment" do
    visit book_path(books(:one))
    accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "コメントが削除されました。"
  end

  test "should not create a comment without a content" do
    visit book_path(books(:one))
    click_on "登録する"
    assert_text "コメント内容を入力してください"
  end

  test "should not update a comment without a content" do
    visit edit_comment_path(comments(:one))
    fill_in "コメント内容", with: ""
    click_on "更新する"
    assert_text "コメント内容を入力してください"
  end

  test "comments should be sorted ascendingly by created_at" do
    visit book_path(books(:one))
    first_date = first(".comment_created_at").text
    assert_equal first_date, "2020/04/01 11:11"
  end
end
