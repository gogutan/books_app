# frozen_string_literal: true

class AddContributorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :user_id, :integer
  end
end
