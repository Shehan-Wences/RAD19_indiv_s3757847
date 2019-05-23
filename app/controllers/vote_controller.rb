class VoteController < ApplicationController
  def create
    @vote = Vote.new(secure_params)
    @vote.course = Course.find(params[:course_id])
    if @vote.save
      respond_to do |format|
	  	format.html { redirect_to :courses }
	  	format.js
      end
    else

    end
  end


  private
    def secure_params
      params.require(:vote).permit( :user_id, :votetype )
    end

end
