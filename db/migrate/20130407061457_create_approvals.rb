class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :group_id
      t.string :sender_type
      t.integer :sender_id
      t.string :approvable_type
      t.integer :approvable_id
      t.string :status
      t.datetime :sent_at
      t.datetime :received_at
      t.datetime :replied_at

      t.timestamps
    end
  end
end
