class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.integer :public_user_id
      t.string :name
      t.string :age
      t.string :body_type
      t.float :height
      t.float :weight
      t.text :description
      t.string :location
      t.timestamps
    end
  end
end
