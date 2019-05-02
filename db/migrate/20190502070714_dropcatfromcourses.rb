class Dropcatfromcourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :category
  end
end
