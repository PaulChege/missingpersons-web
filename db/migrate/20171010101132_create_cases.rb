class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :name
      t.integer :age
      t.float :height
      t.float :weight
      t.string :body_type
      t.string :location_last_seen
      t.date :date_last_seen
      t.text :description
      t.string :status
      t.string :town
      t.string :reporter_rel
      t.integer :public_user_id
      t.timestamps
    end
  end
end
