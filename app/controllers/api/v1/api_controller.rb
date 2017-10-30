class Api::V1::ApiController < Api::V1::BaseController
  def create_case
      c = PublicUser.find(params[:public_user_id]).cases.new(name: params[:name])
      if c.save!
        render json: {status: "success"}
    else
      render json: {status: "error",code: "400",message: "Cannot create case"}
    end
  end
end