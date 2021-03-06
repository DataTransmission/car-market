class CreateUsers < ActiveRecord::Migration
  # def change
  #   create_table :users do |t|
  #     t.string :first_name
  #     t.string :last_name
  #     t.string :nickname
  #     t.string :email
  #     t.string :password_digest
  #     t.string :status

  #     t.timestamps
  #   end
  # end

   def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end

end
