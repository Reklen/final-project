class StudentsController < ApplicationController

  def index
    @students = Student.all
    render :index
  end

  def new
    @student = Student.new
    @mentors = Mentor.all
    render :new
  end

# check https://github.com/Tag-Team-WDI/Tag-Team/blob/master/app/controllers/users_controller.rb for errors/flash messages   vvvv
  def create
    @student = Student.new(student_params)
    if @student.save
      login(@student, "students")
      redirect_to "/students/#{@student.id}"
    else
      redirect_to "/students/new"
    end
  end

  def mentor_list
    @mentors = Mentor.all
    render :select_mentor
  end

  def select_mentor
    student = Student.find(params[:id])
    mentor_id = params[:mentor_id]
    mentor = Mentor.find(mentor_id)
    student.mentor = mentor
    if student.save
        redirect_to "/students/#{student.id}"
    else
        redirect_to "/students/#{student.id}/mentor_list"
    end
  end

  def show
    @student = Student.find(params[:id])
    # @user = current_user
    render :show
  end

  def edit
    @student = Student.find(params[:id])
    render :edit
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(student_params)

    if @student.update_attributes(student_params)
      flash[:success] = "Updated!"
      redirect_to "/students/#{@student.id}"
    else
      render :edit
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to students_path
  end


  private

  def student_params
    params.require(:student).permit(
      :first_name, :last_name, :username, :email, :age, :interests, :password, :mentor_id
      )

  end



end
