class Api::V1::ApiController < Api::V1::BaseController
  def create_case
      c = PublicUser.find(params[:public_user_id]).cases.new(
          name: params[:name],
          age: params[:age],
          height: params[:height],
          weight: params[:weight],
          body_type: params[:body_type],
          date_last_seen: params[:date_last_seen],
          location_last_seen: params[:location_last_seen],
          description: params[:description],
          status: "Active",
          date_reported: Time.now,
          reporter_rel: params[:reporter_rel],
          town: params[:town]
      )
      if c.save!
        render json: {status: "success",message: "Case created"}
    else
      render json: {status: "error",code: "400",message: "Cannot create case"}
    end
  end


end