class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :vehicle
      t.belongs_to :user
      t.string :url

      t.timestamps
    end
  end
end
