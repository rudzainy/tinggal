class Tags < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
      t.timestamps null: false
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
      t.string :name, null: false
    end
  end
end
