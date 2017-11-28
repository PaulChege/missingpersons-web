class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :name
      t.integer :age
      t.float :height
      t.float :weight
      t.string :body_type
      t.string :location_last_seen
      t.float :location_last_seen_lat
      t.float :location_last_seen_lon
      t.date :date_last_seen
      t.text :description
      t.string :status
      t.string :reporter_rel
      t.integer :public_user_id
      t.string :image
      t.timestamps
    end
  end
end
