class Columnrename < ActiveRecord::Migration[5.1]
  def change
    rename_column :votes, :type, :votetype
  end
end