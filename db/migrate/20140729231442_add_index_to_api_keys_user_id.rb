class AddIndexToApiKeysUserId < ActiveRecord::Migration
  def change
  	add_index :api_keys, :user_id, unique: true
  end
end
