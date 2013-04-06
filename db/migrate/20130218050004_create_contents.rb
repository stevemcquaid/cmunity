class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.integer :parent_group_id
      t.boolean :is_private
      t.integer :mediable_id
      t.string :mediable_type

      t.timestamps
    end
  end
end
