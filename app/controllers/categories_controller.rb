class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save

      flash[:success] = "Category Created!"
      redirect_back(fallback_location: catcreate_path)

    else
      render 'new'
    end
  end
  def category_params
      params.require(:category).permit(:name)
  end
end
