# frozen_string_literal: true

class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests do |t|
      t.index %i[user_id test_id]
      t.index %i[test_id user_id]
    end
  end
end
