class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

# check https://github.com/Tag-Team-WDI/Tag-Team/blob/master/app/controllers/users_controller.rb for errors/flash messages   vvvv
  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :username, :age, :location, :interest, :password)
    @user = User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    # @user = current_user
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

end
