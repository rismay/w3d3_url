class ChangingNameToUsersTable < ActiveRecord::Migration
  def change
    drop_table :users_tables

    create_table :users do |t|
      t.string :email
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
