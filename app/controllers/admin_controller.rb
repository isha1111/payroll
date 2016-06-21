require "pony"

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

def employee_data
  @employees = Employee.all
  # exporting data to csv
  respond_to do |format|
    format.html
    format.csv { send_data @employees.to_csv }
    format.xls { send_data @employees.to_csv(col_sep: "\t") }
  end
end

def site_data
  @sites = Site.all
  # exporting data to csv
  respond_to do |format|
    format.html
    format.csv { send_data @sites.to_csv }
    format.xls { send_data @sites.to_csv(col_sep: "\t") }
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
    admin.email_id = params[:email]
    admin.save
    flash[:notice]= "Account Successfully Created. Please Login to Continue"
    redirect_to '/'
  end
end

def submit
  Pony.mail({
	:from => 'isha.negi19@gmail.com',
  :to => params[:email],
  :subject => "Enquiry has been submitted!",
  :body => "#{params[:fname]} has made an enquiry. Context of Enquiry - #{params[:enquiry]} Please contact on number #{params[:phone]}",
  :via => :smtp,
  :via_options => {
   :address              => 'smtp.gmail.com',
   :port                 => '587',
   :enable_starttls_auto => true,
   :user_name            => 'johnmann778@gmail.com',
   :password             => 'password18*',
   :authentication       => :plain,
   :domain               => "localhost.localdomain"
   }
  })
	flash[:notice] = "Your Enquiry has been submitted successfully!!"
	redirect_to '/'
end

def confirm
  admin = Admin.find_by(email_id: params[:email])
  Pony.mail({
  :from => 'isha.negi19@gmail.com',
  :to => params[:email],
  :subject => "Password recovery mail from East-West Security ",
  :body => "Dear Admin, Your username is #{admin.username} , please visit http://payrollmanage.herokuapp.com/resetPassword/#{params[:email]} to reset your password.",
  :via => :smtp,
  :via_options => {
   :address              => 'smtp.gmail.com',
   :port                 => '587',
   :enable_starttls_auto => true,
   :user_name            => 'johnmann778@gmail.com',
   :password             => 'password18*',
   :authentication       => :plain,
   :domain               => "localhost.localdomain"
   }
  })
  flash[:notice] = "Reset password/username email has been sent to your email"
  redirect_to '/'
end

def update_password
  admin = Admin.find_by(username: params[:username])
  if admin
    admin.password = params[:password]
    admin.save
    flash[:notice] = "Password updated Successfully"
    redirect_to '/'
  else
    flash[:notice] = "Unable to find User"
  end
end

end
