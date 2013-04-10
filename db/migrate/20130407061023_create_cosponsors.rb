class CreateCosponsors < ActiveRecord::Migration
  def change
    create_table :cosponsors do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :creator_id
      t.integer :event_id

      t.timestamps
    end
  end
end
