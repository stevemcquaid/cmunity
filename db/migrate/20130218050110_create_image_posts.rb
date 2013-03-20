class CreateImagePosts < ActiveRecord::Migration
  def change
    create_table :image_posts do |t|
      t.string :image_url
      t.integer :x_pixels
      t.integer :y_pixels

      t.timestamps
    end
  end
end
