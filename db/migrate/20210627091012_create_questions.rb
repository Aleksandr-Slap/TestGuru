# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, foreing_key: true

      t.timestamps
    end
  end
end
