class Renamesomething < ActiveRecord::Migration[5.1]
  def change
     rename_column :courses, :categories_id, :category_id
  end
end
