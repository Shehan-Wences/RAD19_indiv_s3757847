class Forkeycourse < ActiveRecord::Migration[5.1]
  def change
     add_reference :courses, :categories, index: true, foreign_key: true
  end
end
