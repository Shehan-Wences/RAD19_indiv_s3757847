class CategoriesController < ApplicationController
  def new
    @cat = Category.new
  end


  def create
    @cat = Category.new(cat_params)
    if @cat.save

      flash[:success] = "Category Created!"
      redirect_back(fallback_location: catcreate_path)

    else
      render 'new'
    end
  end
  def cat_params
      params.require(:category).permit(:name)
  end
end
