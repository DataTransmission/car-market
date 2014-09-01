class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :manufacturer
      t.string :model
      t.string :year
      t.string :color
      t.belongs_to :user

      t.timestamps
    end
  end
end
