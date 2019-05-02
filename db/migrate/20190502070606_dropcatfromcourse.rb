class Dropcatfromcourse < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :category
  end
end
