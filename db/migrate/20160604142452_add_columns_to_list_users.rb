class AddColumnsToListUsers < ActiveRecord::Migration
  def change
  	add_column :list_users, :like, :integer
  end
end
