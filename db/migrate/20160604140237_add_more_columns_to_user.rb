class AddMoreColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :maritial_status, :string
  	add_column :users, :salary, :integer
  end
end
