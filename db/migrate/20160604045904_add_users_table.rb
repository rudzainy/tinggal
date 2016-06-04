class AddUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.timestamps null: false
      t.string :username
      t.string :email, null: false
    	t.string :password_digest, null: false
    	t.string :reg_type, default: 0
    	t.string :reg_key
      t.index :email
    end
  end
end
