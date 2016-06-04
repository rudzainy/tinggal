class Api::V1::QueriesController < Api::V1::ApplicationController

  # http://tinggal.herokuapp.com/api/v1/query_listings?min_price=500&max_price=1500&StateCode=SE&min_size=1000&max_size=2000

  def query_listings
    listings_prices = []
    Listing.all.each do |listing|
      if listing.RentalPrice.to_i >= params[:min_price].to_i && listing.RentalPrice.to_i <= params[:max_price].to_i
        listings_prices << listing
      end
    end
    listing_sizes = []
    listings_prices.each do |listing|
      if listing.BuildUp.to_i >= params[:min_size].to_i && listing.BuildUp.to_i <= params[:max_size].to_i
        listing_sizes << listing
      end
    end
    render json: { success: 'true' , listings: listing_sizes, status: 200 }
  end

  # http://tinggal.herokuapp.com/api/v1/listing?id=5

  def listing
    listing = Listing.find(params[:id])
    if listing
      render json: { success: 'true' , listings: listing, status: 200 }
    else
      render json: { success: 'false' , message: "Listing not found", status: 400 }
    end
  end

  # http://tinggal.herokuapp.com/api/v1/verify_agent?email=tinggalapp@gmail.com&agent_id=12345

  def verify_agent
    agent = Agent.find_by(email: params[:email], agent_id: params[:agent_id])
    if agent
      render json: { success: 'true' , message: "Agent code verified", status: 200 }
    else
      render json: { success: 'false' , message: "Verification failed", status: 400 }
    end

  private

  def query_params
    params.permit(:ListingID, :BuildUp, :IsSale , :IsRent , :Postalcode , :AskingPrice, :RentalPrice, :NoOfBedRooms , :NoOfBathRooms, :City , :Township , :StateCode, :ProType, :TenureCode , :AdvertiseDate, :PostedDate , :LastModified , :CreatedDate, :BuildingName)
  end
end