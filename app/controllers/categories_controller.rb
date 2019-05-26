class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]
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
  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Only Logged in Users can create Categories!"
        redirect_to root_path
      end
    end

end
