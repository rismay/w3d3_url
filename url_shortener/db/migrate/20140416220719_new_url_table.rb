class NewUrlTable < ActiveRecord::Migration
  def change
    drop_table :shorted_urls

    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id

      t.timestamps
    end
  end
end
