class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new; end

  def create
    if login(session_params[:email], session_params[:password])
      redirect_to root_url, success: 'Welcome!'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, success: 'Ok'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
