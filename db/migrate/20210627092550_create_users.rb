class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.references :answer, foreing_key: true

      t.timestamps
    end
  end
end
