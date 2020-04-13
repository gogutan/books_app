# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    login_user("one@example.com", "password")
  end

  test "visit the reports index" do
    visit reports_url
    assert_selector "h1", text: "日報"
  end

  test "create a Report" do
    visit reports_url
    click_on "新しい日報の追加"
    within "form[name=report]" do
      fill_in "タイトル", with: "Example Report"
      fill_in "内容", with: "Example Content"
      click_on "登録する"
    end
    assert_text "新しい日報が追加されました。"
  end

  test "show a Report" do
    visit reports_url
    click_on "詳細", match: :first
    assert_text "タイトル: Example Report 2"
  end

  test "update a Report" do
    visit reports_url
    click_on "編集", match: :first
    within "form[name=report]" do
      fill_in "タイトル", with: "Updated Report"
      fill_in "内容", with: "Updated Content"
      click_on "更新する"
    end
    assert_text "日報が更新されました。"
  end

  test "destroy a Report" do
    visit reports_url
    accept_confirm do
      click_on "削除", match: :first
    end
    assert_text "日報が削除されました。"
  end

  test "should not create a Report without title" do
    visit reports_url
    click_on "新しい日報の追加"
    within "form[name=report]" do
      fill_in "内容", with: "Example Content"
      click_on "登録する"
    end
    assert_text "タイトルを入力してください"
  end

  test "should not update a Report without title" do
    visit reports_url
    click_on "編集", match: :first
    within "form[name=report]" do
      fill_in "タイトル", with: ""
      fill_in "内容", with: "Updated Content"
      click_on "更新する"
    end
    assert_text "タイトルを入力してください"
  end

  test "should not create a Report without content" do
    visit reports_url
    click_on "新しい日報の追加"
    within "form[name=report]" do
      fill_in "タイトル", with: "Example Report"
      click_on "登録する"
    end
    assert_text "内容を入力してください"
  end

  test "should not update a Report without content" do
    visit reports_url
    click_on "編集", match: :first
    within "form[name=report]" do
      fill_in "タイトル", with: "Updated Report"
      fill_in "内容", with: ""
      click_on "更新する"
    end
    assert_text "内容を入力してください"
  end

  test "reports should be sorted descendingly by created_at" do
    visit reports_url
    first_date = first(".report_created_at").text
    assert_equal first_date, "2020年04月02日(木)"
  end
end
