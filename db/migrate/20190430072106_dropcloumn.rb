class Dropcloumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :userid

  end
end
