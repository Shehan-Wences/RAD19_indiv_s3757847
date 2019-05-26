class LocationsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]
  def new
    @location = Location.new
  end


  def create
    @location = Location.new(location_params)
    if @location.save

      flash[:success] = "Location Created!"
      redirect_back(fallback_location: locationcreate_path)

    else
      render 'new'
    end
  end
  def location_params
      params.require(:location).permit(:locationname)
  end
  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Only Logged in Users can create Locations!"
        redirect_to root_path
      end
    end
end
