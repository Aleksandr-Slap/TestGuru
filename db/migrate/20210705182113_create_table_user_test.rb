class CreateTableUserTest < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.references :test, foreing_key: true
      t.references :user, foreing_key: true

      t.timestamps
    end
  end
end
