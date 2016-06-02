class UserController < ApplicationController

def user
end

def new_user
end

def login_user
end

def create
  if User.find_by(username: params[:username])
    flash[:notice]= "Username Already Exists"
    redirect_to '/user/new'
  else
    user = User.new
    user.username = params[:username]
    user.password = params[:password]
    user.save
    flash[:notice]= "Account Successfully Created. Please Login to Continue"
    redirect_to '/'
  end
end

end
