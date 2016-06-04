class AddListingsTable < ActiveRecord::Migration
  def change
  	create_table :listings do |t|
			t.string :ListingID
			t.string :BuildUp
			t.string :IsSale
			t.string :IsRent
			t.string :Postalcode
			t.string :AskingPrice
			t.string :RentalPrice
			t.string :NoOfBedRooms
			t.string :NoOfBathRooms
			t.string :City
			t.string :Township
			t.string :StateCode
			t.string :ProType
			t.string :TenureCode
			t.string :AdvertiseDate
			t.string :PostedDate
			t.string :LastModified
			t.string :CreatedDate
			t.string :BuildingName
		end
  end
end
