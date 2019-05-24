class VoteController < ApplicationController
  def create

    if current_user.nil?

    redirect_to :courses
    flash[:danger] = "Only Logged in Users can vote!"

    else

      @vote = Vote.new(vote_params)
      @vote.user = current_user
      @vote.course = Course.find(params[:course_id])
        if @vote.save
          respond_to do |format|
	        format.html { redirect_to :courses }
	        format.js
	        flash[:success] = "Your Vote was successfull !"
          end
        else

        end

    end

  end

  def update

    if current_user.nil?


    redirect_to :courses
    flash[:danger] = "Only Logged in Users can vote!"

    else

      @course= Course.find(params[:course_id])
    	@vote = Vote.find_by(user: current_user, course:@course )
    	@vote.update_attribute(:votetype, vote_params[:votetype])
    	redirect_to :courses
    	flash[:success] = "Your Vote was successfull changed!"

    end

  end


  private
    def vote_params
      params.require(:vote).permit(:votetype )
    end

end
