class Foreignkeycourse < ActiveRecord::Migration[5.1]
  def change
   add_foreign_key :courses, :users
  end
end
