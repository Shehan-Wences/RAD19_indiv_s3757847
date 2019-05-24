class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit]

  def index
    @users = User.all
    if params[:name]
      val=Category.find_by(:name=>params[:name])
      @courses=Course.where(:category_id=>val.id)
    elsif params[:locationname]
      val = Location.find_by(:locationname => params[:locationname])
      @courses = Course.includes(:locations).where(locations: { id: val })
    else
     @courses = Course.all
    end

  end

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

  def show
  end

  def new
    @course = Course.new
    @category = Category.new
    @location = Location.new
  end


  def edit
    @course = Course.find(params[:id])
  end

  def create

    @course = current_user.courses.build(course_params)

      if @course.save
        flash[:success] = "Course Created"
        redirect_to @course
      else
        render 'new'
      end

  end

  def update

   if @course.update_attributes(courseupdate_params)
    flash[:success] = "Course updated"
    redirect_to @course
   else
      render 'edit'
   end

  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :prerequisite,:description,:picture,:category_id,:location_ids => [])
    end
    def courseupdate_params
      params.require(:course).permit(:name, :prerequisite,:description,:category_id,:location_ids => [])
    end

    def correct_user
      @course = Course.find(params[:id])
        unless @course.user == current_user
          redirect_to( @course.user)
          flash[:danger] = "Only the Coordinator who created can edit the course"
        end
    end

end
