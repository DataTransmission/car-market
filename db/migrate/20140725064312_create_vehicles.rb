class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :manufacturer
      t.string :model
      t.string :year
      t.string :color
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
