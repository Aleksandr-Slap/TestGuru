class DeleteColumnInUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :surname
    remove_column :users, :name
    remove_column :users, :answer_id, :bigint
  end

  def down
    add_column :users, :name, :string, default: "User"
    add_column :users, :surname, :string
    add_column :users, :answer_id, :bigint
  end  
end
