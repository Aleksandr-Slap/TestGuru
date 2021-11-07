# frozen_string_literal: true

class AddUserIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :user_id, :integer, foreing_key: true, index: true
  end
end
