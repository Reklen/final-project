class SessionsController < ApplicationController

  # def logout
  #   @current_user = session[:user_id] = nil
  # end
  def new
    render :new
  end

  def create
    user = params.require(:user).permit(:email, :password)
    @user = Mentor.find_by_email(user[:email])
    if @user != nil
      @user = Mentor.confirm(user)
      user_t = "mentors"
    else
      @user = Student.confirm(user)
      user_t = "students"
    end


    if @user
      login(@user, user_t)
      redirect_to "/#{user_t}/#{@user.id}"
      else

      redirect_to "/sessions/new"
    end
  end



   def destroy
    logout
    redirect_to '/'
  end
end
