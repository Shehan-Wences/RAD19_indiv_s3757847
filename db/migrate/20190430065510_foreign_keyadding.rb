class ForeignKeyadding < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :users, index: true, foreign_key: true
  end
end
