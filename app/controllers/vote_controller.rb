class VoteController < ApplicationController
  def create
    @vote = Vote.new(secure_params)
    @vote.course = Course.find(params[:course_id])
    if @vote.save
      respond_to do |format|
        format.html { redirect_to @vote.post }
        format.js # we'll use this later for AJAX!
      end
    end
  end

  private
    def secure_params
      params.require(:vote).permit(:user)
    end

end
