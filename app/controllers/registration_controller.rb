class RegistrationController < ApplicationController
  def creates_user

    if !session[:user].nil?
      @user = YAML.load(session[:user])
      if @user.get_username == params[:username]
        flash[:alert] = "That username is already taken. You copycat."
        redirect_to 'http://localhost:3000/registration/register_user'
      else
        name = params[:name]
        address = params[:address]
        city = params[:city]
        state = params[:state]
        zipcode = params[:zipcode]
        country = params[:country]
        email = params[:email]
        username = params[:username]
        password = params[:password]
        @user = User.new(name, address, city, state, zipcode, country, email, username, password)
        if !params[:phone].nil? && !params[:phone].strip.empty?
          phone = params[:phone]
          @user.assign_phone(phone)
        end
        session[:user] = @user.to_yaml
        flash.now[:alert] = "You have successfully registered."
        render '/welcome/index.html.erb'
      end
    else
      if (!params[:name].nil? && params[:name].strip.empty?) || (!params[:address].nil? && params[:address].strip.empty?) || (!params[:city].nil? && params[:city].strip.empty?) || (!params[:state].nil? && params[:state].strip.empty?) || (!params[:zipcode].nil? && params[:zipcode].strip.empty?) || (!params[:country].nil? && params[:country].strip.empty?) || (!params[:email].nil? && params[:email].strip.empty?) || (!params[:username].nil? && params[:username].strip.empty?) || (!params[:password].nil? && params[:password].strip.empty?)
        flash.now[:alert] = "Please fill out all the fields, you moron."
        render '/registration/creates_user.html.erb'
      else
        name = params[:name]
        address = params[:address]
        city = params[:city]
        state = params[:state]
        zipcode = params[:zipcode]
        country = params[:country]
        email = params[:email]
        username = params[:username]
        password = params[:password]
        @user = User.new(name, address, city, state, zipcode, country, email, username, password)
        if !params[:phone].nil? && !params[:phone].strip.empty?
          phone = params[:phone]
          @user.assign_phone(phone)
        end
        session[:user] = @user.to_yaml
        flash.now[:alert] = "You have successfully registered."
        render '/welcome/index.html.erb'
      end
    end
  end

  def register_user
    render 'creates_user.html.erb'
  end

  def redirect_to_registration
    redirect_to 'http://localhost:3000/registration/register_user'
  end
end
