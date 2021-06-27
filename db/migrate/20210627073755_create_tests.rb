class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id

      t.timestamps
    end
    change_column_null(:tests, :title, false )
    change_column_null(:tests, :level, false )
    change_column_default :tests, :level, 0
    add_foreign_key :tests, :categories
  end
end
