class CreatePropertyTypeTable < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
			t.string :ProType
			t.string :ProCatType
			t.string :ProGrpType
			t.string :Description
    end
  end
end
