class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :case_id
      t.integer :sighting_id
      t.float :image_match
      t.float :description_match
      t.timestamps
    end
  end
end
