class CreateUrlPosts < ActiveRecord::Migration
  def change
    create_table :url_posts do |t|
      t.string :url
      t.string :domain_url
      t.string :image_url

      t.timestamps
    end
  end
end
