class AddCellToUser < ActiveRecord::Migration
  def change
    add_column :users, :cell, :string
  end
end
