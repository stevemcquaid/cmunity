class CreateEventPosts < ActiveRecord::Migration
  def change
    create_table :event_posts do |t|
      t.string :location
      t.string :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.boolean :is_all_day

      t.timestamps
    end
  end
end
