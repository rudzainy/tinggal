class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.integer :user_id
    	t.string :agent_id, default: "12345"
    	t.integer :listing_id
    	t.date :date
    end
  end
end
