# frozen_string_literal: true

class AddColumnEmailToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false
  end
end
