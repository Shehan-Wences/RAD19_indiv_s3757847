class CourseLocation < ActiveRecord::Migration[5.1]
  create_table "courses_locations", :id => false do |t|
    t.column "course_id", :integer, :null => false
    t.column "location_id",  :integer, :null => false
  end
end
