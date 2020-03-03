# frozen_string_literal: true

class ChangeBookTitileToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :title, :string, null: false
  end
end
