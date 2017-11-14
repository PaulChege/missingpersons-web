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
          reporter_rel: params[:reporter_rel],
          town: params[:town],
          image: params[:image]

      )
      if c.save!
        render json: {status: "success",message: "Case created"}
    else
      render json: {status: "error",code: "400",message: "Cannot create case"}
    end
  end


  def create_sighting
      s = Sighting.create( public_user_id: params[:public_user_id],
                           name: params[:name],
                           age: params[:age],
                           height: params[:height],
                           weight: params[:weight],
                           body_type: params[:body_type],
                           location: params[:location],
                           description: params[:description],
                           image: params[:image]
      )
      if Sighting.get_matching_cases(s) && s.save!
        render json: {status: "success",message: "Sighting reported"}
      else
        render json: {status: "error",code: "400",message: "Cannot report sighting"}
      end
  end
end