class AddUseridToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :userid, :integer
  end
end
