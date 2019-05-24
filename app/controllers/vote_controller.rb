class VoteController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]

  def create

    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.course = Course.find(params[:course_id])
      if @vote.save
          respond_to do |format|
	        format.html { redirect_to :courses }
	        format.js
	        flash[:success] = "Your Vote was successfull !"
          end
      end

  end

  def update

    @course= Course.find(params[:course_id])
  	@vote = Vote.find_by(user: current_user, course:@course )
  	@vote.update_attribute(:votetype, vote_params[:votetype])
  	redirect_to :courses
  	flash[:success] = "Your Vote was successfull changed!"


  end

  private
    def vote_params
      params.require(:vote).permit(:votetype )
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Only Logged in Users can vote!"
        redirect_to :courses
      end
    end

end
