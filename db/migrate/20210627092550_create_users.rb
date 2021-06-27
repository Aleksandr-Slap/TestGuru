class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :answer_id

      t.timestamps
    end
    change_column_null(:users, :name, false )
    add_foreign_key :users, :answers
  end
end
