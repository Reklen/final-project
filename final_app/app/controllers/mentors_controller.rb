class MentorsController < ApplicationController

  def index
    @mentors = Mentor.all

    render :index
  end

  def new
    @mentor = Mentor.new

    render :new
  end

  def create
    mentor_params = params.require(:mentor).permit(:email, :first_name, :last_name, :username, :age, :location, :expertise, :availability, :password)
    @mentor = Mentor.create(mentor_params)
    redirect_to "/mentors"

  end

  def show
    @user = User.find(params[:id])
    render :show
  end
# added the above from users_controller


end
