class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new; end

  def create
    if login(session_params[:email], session_params[:password], session_params[:remember_me])
      redirect_back_or_to root_url, success: 'Welcome!'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to root_url, success: 'Ok'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
