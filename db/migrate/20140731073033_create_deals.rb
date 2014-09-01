class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.belongs_to :user
      t.belongs_to :listing

      t.timestamps
    end
  end
end
