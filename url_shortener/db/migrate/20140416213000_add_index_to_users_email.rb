class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
      add_index :users_tables, :email, :unique => true
  end
end
