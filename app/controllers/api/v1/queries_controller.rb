class Api::V1::QueriesController < Api::V1::ApplicationController

  # http://tinggal.herokuapp.com/api/v1/query_listings?min_price=500&max_price=1500&StateCode=SE&min_size=1000&max_size=2000

  def query_listings
    listings = []
    Listing.all.each do |listing|
      if listing.RentalPrice.to_i >= params[:min_price].to_i && listing.RentalPrice.to_i <= params[:max_price].to_i
        listings << listing
      end
    end
    Listing.all.each do |listing|
      if listing.BuildUp.to_i >= params[:min_size].to_i && listing.BuildUp.to_i <= params[:max_size].to_i
        listings << listing
      end
    end
    render json: { success: 'true' , listings: listings.uniq, status: 200 }
  end

  private

  def query_params
    params.permit(:ListingID, :BuildUp, :IsSale , :IsRent , :Postalcode , :AskingPrice, :RentalPrice, :NoOfBedRooms , :NoOfBathRooms, :City , :Township , :StateCode, :ProType, :TenureCode , :AdvertiseDate, :PostedDate , :LastModified , :CreatedDate, :BuildingName)
  end
end