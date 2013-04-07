class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.integer :creator_id
      t.string :action
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
  end
end
