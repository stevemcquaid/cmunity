class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.string :video_url
      t.integer :length
      t.integer :x_pixels
      t.integer :y_pixels

      t.timestamps
    end
  end
end
