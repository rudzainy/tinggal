class Api::V1::SessionsController < Api::V1::ApplicationController

  def create
    if params[:reg_key].to_i == 0 # user registered using email
    	if verify_user(params[:email], params[:password])
    		render json: { success: 'true' , message: 'User verified', status: 200 }
	    else
	      render json: { success: 'false' , message: 'User varification failed', status: 401 }
   		end
    else
    	if User.find_by_email(params[:email])
    		render json: { success: 'false' , message: 'User not registered with email', status: 401 }
    	else
    		render json: { success: 'false' , message: 'User not found', status: 401 }
    	end
    end
  end

  private

  def verify_user(email, password)
    user = User.find_by(email: email)
    if user && user.authenticate(params[:password])
      return true
    else
      return false
    end
  end
end