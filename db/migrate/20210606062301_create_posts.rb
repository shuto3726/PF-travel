class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image_id
      t.string :place
      t.text :description
      t.float :evaluation
      t.text :year
      t.text :month
      t.text :date
      t.text :adress
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
