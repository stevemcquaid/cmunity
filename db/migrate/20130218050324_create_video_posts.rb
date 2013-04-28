class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.string :video_url
      t.integer :length
      t.integer :width
      t.integer :height
      t.text :embed_code

      t.timestamps
    end
  end
end
