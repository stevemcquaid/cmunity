class CreateUrlPosts < ActiveRecord::Migration
  def change
    create_table :url_posts do |t|
      t.integer :content_id
      t.string :url

      t.timestamps
    end
  end
end
