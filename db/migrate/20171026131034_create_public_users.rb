class CreatePublicUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :public_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :town
      t.string :status
      t.string :notification_token
      t.timestamps
    end
  end
end
