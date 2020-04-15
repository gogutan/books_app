# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test ". sorted" do
    sorted_comments = Comment.sorted
    assert_equal sorted_comments.first.created_at, "2020-04-01 11:11:11"
  end
end
