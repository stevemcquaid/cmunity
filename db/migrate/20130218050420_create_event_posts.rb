class CreateEventPosts < ActiveRecord::Migration
  def change
    create_table :event_posts do |t|
      t.string :location
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :is_all_day

      t.timestamps
    end
  end
end
