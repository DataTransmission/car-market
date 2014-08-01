class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :vehicle_id
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
