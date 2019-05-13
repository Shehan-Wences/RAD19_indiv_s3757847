class Deletelocation < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :location
  end
end
