class Changecolumntype < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :votetype, :integer
  end
end
