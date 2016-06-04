class Api::V1::UsersController < Api::V1::ApplicationController

  # for email registration:
  # http://tinggal.herokuapp.com/api/v1/register?username=Rudzainy&email=rudzainy@rudzainy.com&password=123456&reg_type=0
  #
  # for fb / gl registration
  # http://tinggal.herokuapp.com/api/v1/register?username=Rudzainy&email=tom@cruise.com&reg_type=fb&reg_key=tom@cruise.com

  def create
    if params[:reg_type] == "0"
      user = User.new(username: params[:username], email: params[:email], password: params[:password], user_type: "user")
      if user.save
        render json: { success: 'true' , message: 'Successfully created user', status: 200 }
      else
        render json: { success: 'false' , message: 'Error! ' + user.errors.full_messages.to_s, status: 422 }
      end
    elsif params[:reg_type] == "fb" or params[:reg_type] == "gl"
      user = User.new(username: params[:username], email: params[:email], reg_type: params[:reg_type], reg_key: params[:reg_key], password: "123456", user_type: "user")
      if user.save
        render json: { success: 'true' , message: 'Successfully created user', status: 200 }
      else
        render json: { success: 'false' , message: 'Error! ' + user.errors.full_messages.to_s, status: 422 }
      end
    else
      render json: { success: 'false' , message: 'Error! Wrong registration type', status: 422 }
    end
  end

  # http://tinggal.herokuapp.com/api/v1/update_user?email=email

  def update
    user = User.find_by_email(params[:email])
    if user
      user.update(update_params)
      render json: { success: 'true' , username: user.username, email: user.email, gender: user.gender, age_range: user.age_range, maritial_status: user.maritial_status, salary: user.salary, user_type: user.user_type , status: 200 }
    else
      render json: { success: 'false' , message: 'Update failed', status: 400 }
    end
  end

  private

  def update_params
    params.permit(:email, :password, :username, :gender, :age_range, :maritial_status, :salary, :user_type, :location)
  end
end