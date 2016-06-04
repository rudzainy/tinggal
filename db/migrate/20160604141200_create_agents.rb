class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
    	t.string :agent_id
    end

    add_column :users, :user_type, :string
  end
end
