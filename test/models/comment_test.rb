# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "sort comments ascendingly by created_at" do
    sorted_comments = Comment.sorted
    assert sorted_comments.first.created_at == "2020-04-01 11:11:11"
  end
end