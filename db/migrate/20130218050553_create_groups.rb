class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :creator_id

      t.timestamps
    end
  end
end
