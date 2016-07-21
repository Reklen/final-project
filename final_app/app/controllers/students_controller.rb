class StudentsController < ApplicationController

  def index
    @students = Student.all
    render :index
  end

  def new
    @student = Student.new
    render :new
  end

# check https://github.com/Tag-Team-WDI/Tag-Team/blob/master/app/controllers/users_controller.rb for errors/flash messages   vvvv
  def create
    student_params = params.require(:student).permit(:first_name, :last_name, :username, :email, :age, :interests, :password)
    @student = Student.new(student_params)
    if @student.save
      login(@student, "students")
      redirect_to "/students/#{@student.id}"
    else
      redirect_to "/students/new"
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



end
