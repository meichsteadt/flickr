class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.attachment :profile_image
      t.string :location 
      t.timestamps
    end
  end
end
