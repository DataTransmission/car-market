class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :vehicle_id
      t.string :price
      t.string :status
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
