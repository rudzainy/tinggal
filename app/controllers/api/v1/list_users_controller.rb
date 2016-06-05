class Api::V1::ListUsersController < Api::V1::ApplicationController

  # http://tinggal.herokuapp.com/api/v1/like?email=rudzainy@rudzainy.com&listing_id=1

  def like
    ListUser.create(user_id: User.find_by_email(params[:email]).id, listing_id: params[:listing_id], like: 1)
    render json: { success: 'true', status: 200 }
  end

  # http://tinggal.herokuapp.com/api/v1/dislike?email=rudzainy@rudzainy.com&listing_id=1

  def dislike
    ListUser.create(user_id: User.find_by_email(params[:email]).id, listing_id: params[:listing_id], like: 0)
    render json: { success: 'true', status: 200 }
  end
end