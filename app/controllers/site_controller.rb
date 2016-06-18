class SiteController < ApplicationController

  def new
  end

  def create
    if logged_in?
      site = Site.new
      site.site_name = params[:sname]
      site.site_location = params[:slocation]
      site.save
      flash[:notice] = "Site Added Successfully"
      redirect_to '/admin/login'
    else
      redirect_to '/adminlogin'
    end
  end

  def show
  end

  def delete
    if logged_in?
      site = Site.find_by(id: params[:id])
      site.delete
      flash[:notice] = "Site deleted Successfully"
      redirect_to '/admin/login'
    else
      redirect_to '/adminlogin'
    end
  end

  def edit
    if logged_in?
      site = Site.find_by(id:params[:id])
      site.site_name = params[:sname]
      site.site_location = params[:slocation]
      site.save
      redirect_to '/admin/login'
    else
      redirect_to '/adminlogin'
    end
  end

  # def employee
  #   site = Site.find_by(id:params[:id])
  #   @employees = site.emplyees
  #   render :json => @employees
  # end

  def view_emp
    if logged_in?
      @site = Site.find_by(id:params[:id])
      @employees = @site.employees.distinct
    else
      redirect_to '/adminlogin'
    end
  end

end
