class AddTwoColumnToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_name, :string
    add_column :badges, :rule_value, :string
  end
end
