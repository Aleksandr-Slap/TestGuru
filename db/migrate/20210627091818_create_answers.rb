class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
    change_column_null(:answers, :body, false )
    change_column_null(:answers, :correct, false )
    change_column_default :answers, :correct, false
    add_foreign_key :answers, :questions
  end
end
