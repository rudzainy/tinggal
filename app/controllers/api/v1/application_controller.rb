class Api::V1::ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def json_request?
    request.format.json?
  end

  def authorize_request!
    unless params[:access_token] == API_ACCESS_TOKEN
      return render json: { success: 'failed', message: 'Wrong API Access Token' }, status: 403
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == API_AUTH_USER && password == API_AUTH_PASSWORD
    end
  end
end
