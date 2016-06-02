class SessionController < ApplicationController

  def create_admin
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
  		redirect_to '/admin/login'
  	else
  		#page is not redirected
  		flash[:notice] = "Username or Password is Incorrect !!"
  		redirect_to '/adminlogin'
  	end
  end

  def delete_admin
    session.delete(session[:admin_id])
    redirect_to '/'
  end

end
