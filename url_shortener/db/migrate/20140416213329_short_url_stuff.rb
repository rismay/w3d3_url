class ShortUrlStuff < ActiveRecord::Migration
  def change
    create_table :shorted_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id

      t.timestamps
    end
  end
end
