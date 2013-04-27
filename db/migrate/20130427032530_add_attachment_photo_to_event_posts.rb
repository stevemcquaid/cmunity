class AddAttachmentPhotoToEventPosts < ActiveRecord::Migration
  def self.up
    change_table :event_posts do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :event_posts, :photo
  end
end
