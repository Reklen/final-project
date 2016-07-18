class UserMentorsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @mentors = @user.mentors

    @mentors = Mentor.all
    current_user

    render :index
  end

  def create
    @user = current_user
    @mentor = Mentor.find(params[:mentor_id])
    @user.mentors.push(@mentor)

    redirect_to user_mentors(@user)
  end

end
