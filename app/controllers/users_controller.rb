class UsersController < ApplicationController
  before_filter :require_login, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to root_url, notice: 'success'
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
