class AddColCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :description, :text
  end
end
