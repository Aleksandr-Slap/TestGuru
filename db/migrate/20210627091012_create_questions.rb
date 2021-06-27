class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :test_id

      t.timestamps
    end
    change_column_null(:questions, :body, false )
    add_foreign_key :questions, :tests
  end
end
