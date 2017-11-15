
class Sighting < ApplicationRecord
  belongs_to :public_user
  has_many :matches
  mount_uploader :image, ImageUploader


  def self.get_matching_cases(sighting)
    by_name = Case.where name:sighting.name
    by_other = Case.where age:sighting.age,weight:sighting.weight,height:sighting.height,body_type:sighting.body_type


    if(by_name)
      by_name.each do |s|
        response = RestClient.post 'https://api-us.faceplusplus.com/facepp/v3/compare?api_key=rUbph1Cpz9cVBbskoYNKBtl9rz4ZVdaW&api_secret=5sBD-MKfPYCqvJndTqaDeWQM7d26Lm5K',
                                   :image_file1 => File.new(s.image.path),:image_file2 => File.new(sighting.image.path)
        Match.create(case_id: s.id,sighting_id: sighting.id,description_match: distance_percent(sighting.description,s.description) , image_match:JSON.parse(response)["confidence"])
      end
            else if (by_other)
               by_other.each do |s|
                if (desc_match = distance_percent(sighting.description,s.description)) > 50
                  response = RestClient.post 'https://api-us.faceplusplus.com/facepp/v3/compare?api_key=rUbph1Cpz9cVBbskoYNKBtl9rz4ZVdaW&api_secret=5sBD-MKfPYCqvJndTqaDeWQM7d26Lm5K',
                                             :image_file1 => File.new(s.image.path),:image_file2 => File.new(sighting.image.path)
                  Match.create(case_id: s.id,sighting_id: sighting.id,description_match: desc_match, image_match: JSON.parse(response)["confidence"])
                end
               end
                 end
    end
s
  end


  def self.distance_percent(first,second)
    if (first != nil && second != nil) || (first != "" && second!= "")
      max_distance = [first,second].max_by(&:length).length
      distance = Levenshtein.distance(first,second)
      return (100.0 / max_distance * distance)
    end
  else
    return 0
  end

end


