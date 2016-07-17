class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :username, :age, :location, :interest, :password)
    @user = User.create
    redirect_to "/users"
  end
end
