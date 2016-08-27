class UserController < ApplicationController
  def get_info
    if session[:user].nil?
      flash[:alert] = "Register first, you jackass."
      redirect_to 'http://localhost:3000/registration/register_user'
    else
      @user = YAML.load(session[:user])
      if @user.get_username == params[:username] && @user.get_password == params[:password]
        flash.now[:alert] = "You have successfully logged in, you hamster."
      else
        flash.now[:alert] = "Your credentials are incorrect. Please sign in again. You fail!"
        redirect_to 'http://localhost:3000/'
      end
    end
  end
end
