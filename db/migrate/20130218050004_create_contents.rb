class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :creator_id
      t.integer :parent_group_id
      t.boolean :is_private
      t.datetime :date_created
      t.datetime :date_modified

      t.timestamps
    end
  end
end
