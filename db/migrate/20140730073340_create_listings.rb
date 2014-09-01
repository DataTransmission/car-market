class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.belongs_to :vehicle
      t.string :price
      t.string :currency
      t.string :status
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :description

      t.timestamps
    end
  end
end
