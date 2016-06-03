class AdminController < ApplicationController

def index
end

def login
end

def main
  if logged_in?
    @employees = Employee.all
    @sites = Site.all
  else
    redirect_to '/adminlogin'
  end
end

def login_admin
end

def new_admin
end

def create
  if Admin.find_by(username: params[:username])
    flash[:notice]= "Username Already Exists"
    redirect_to '/admin/new'
  else
    admin = Admin.new
    puts params
    admin.username = params[:username]
    admin.password = params[:password]
    admin.save
    flash[:notice]= "Account Successfully Created. Please Login to Continue"
    redirect_to '/'
  end

end

end
