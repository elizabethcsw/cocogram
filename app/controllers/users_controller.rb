class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Cocogram, #{@user.name}!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
