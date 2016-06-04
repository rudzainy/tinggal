class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :picture_url, :string
  	add_column :users, :gender, :string
  	add_column :users, :age_range, :string
  end
end
