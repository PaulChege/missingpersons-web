class Api::V1::AuthenticationController < Api::V1::BaseController

  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      render json: { auth_token: command.result['token'], id: command.result['id'] }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def signup
    if !PublicUser.find_by_email(params[:email])
      if user = PublicUser.create(name: params[:name],email: params[:email],password: params[:password],town: params[:town],status: "Active")
        render json: {status: "success",message: "User account created", user: user, auth_token: AuthenticateUser.call(params[:email], params[:password]).result['token']}
      else
        render json: {status: "error",code: "400",message: "Cannot create user"}
      end
    else
      render json: {status: "error",code: "400",message: "Email already in use"}
    end

  end
end