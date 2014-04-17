class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :email
      t.timestamps
    end
  end
end
