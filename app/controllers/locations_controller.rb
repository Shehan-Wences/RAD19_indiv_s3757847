class LocationsController < ApplicationController
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
end
