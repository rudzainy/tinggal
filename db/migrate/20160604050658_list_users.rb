class ListUsers < ActiveRecord::Migration
  def change
  	create_table :list_users do |t|
      t.timestamps null: false
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
    end
  end
end
