class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :rule_name, null: false
      t.string :rule_value

      t.timestamps
    end
  end
end
