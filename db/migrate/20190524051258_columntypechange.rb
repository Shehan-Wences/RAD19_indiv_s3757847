class Columntypechange < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :votetype, :integer, using: 'votetype::integer'
  end
end
