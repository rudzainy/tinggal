class CreatePropertyCategoryTypeTable < ActiveRecord::Migration
  def change
    create_table :property_category_types do |t|
			t.string :ProCatType
			t.string :Description
    end
  end
end
