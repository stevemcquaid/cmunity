class CreateImagePosts < ActiveRecord::Migration
  def change
    create_table :image_posts do |t|
      t.string :image_url
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
