# frozen_string_literal: true

class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :title, :string, null: false
    change_column :reports, :content, :string, null: false
    change_column :comments, :content, :string, null: false
  end
end
