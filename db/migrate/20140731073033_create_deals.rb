class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
  end
end