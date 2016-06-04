class CreatePropertyGroupTypeTable < ActiveRecord::Migration
  def change
    create_table :property_group_types do |t|
    	t.string :ProGrpType
    	t.string :ProCatType
    	t.string :Description
    end
  end
end
