class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :destroy_session
  before_action :authenticate_request
  attr_reader :current_user

  def destroy_session
    request.session_options[:skip] = true
  end

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end