# frozen_string_literal: true

class DeleteEmailIndexInUser < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, :email
  end

  def down
    add_index :users, :email, unique: true
  end
end
