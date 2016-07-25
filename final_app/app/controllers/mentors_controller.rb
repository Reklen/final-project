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
    @mentor = Mentor.new(mentor_params)
    if @mentor.save!
      login(@mentor, 'mentors')
      flash[:success] = "Profile created!"
      redirect_to "/mentors/#{@mentor.id}"
    else
      flash[:error] = @mentor.errors.full_messages.join("---")
      redirect_to "/mentors/new"
    end
  end

  def show
    @mentor = Mentor.find(params[:id])
    render :show
  end
# added the above from users_controller

  def edit
    @mentor = Mentor.find(params[:id])
    render :edit
  end

  def update
    @mentor = Mentor.find(params[:id])
    @mentor.update_attributes(mentor_params)

    if @mentor.update_attributes(mentor_params)
      redirect_to "/mentors/#{@mentor.id}"
      flash[:notice] = "Profile Updated!"
    else
      flash[:error] = @doctor.errors.full_messages.join("---")
      render :edit
    end


  end

def destroy
    Mentor.find(params[:id]).destroy
    redirect_to mentors_path
  end


  private

  def mentor_params
    params.require(:mentor).permit(
     :email, :first_name, :last_name, :username, :age, :location, :expertise, :availability, :password, :password_digest, :description
      )

  end


end
