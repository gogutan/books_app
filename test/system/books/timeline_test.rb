# frozen_string_literal: true

require "application_system_test_case"

class TimelineTest < ApplicationSystemTestCase
  test "show the books only created by following users" do
    login_user("1@example.com", "password")
    visit books_timeline_index_path
    assert_text "Example Book 2"
    assert_no_text "Example Book 3"
  end
end
