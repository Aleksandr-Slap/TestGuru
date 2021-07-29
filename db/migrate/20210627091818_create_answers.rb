class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, null: false, default: 0
      t.references :question, foreing_key: true

      t.timestamps
    end
  end
end
