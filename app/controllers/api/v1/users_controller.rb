class Api::V1::UsersController < Api::V1::ApplicationController

  def create
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if user.save
      render json: { success: 'true' , message: 'Successfully created user', status: 200 }
    else
      render json: { success: 'false' , message: 'Error! ' + user.errors.full_messages, status: 422 }
    end
  end
end