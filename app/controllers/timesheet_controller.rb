require "date"
require "pony"
class TimesheetController < ApplicationController

  def new
    if logged_in?
      @employees = Employee.all
      @sites = Site.all
    else
      redirect_to '/adminlogin'
    end
  end

  def create
    if logged_in?
      timesheet = Timesheet.new
      timesheet.hours = params[:hours]
      timesheet.startTime = params[:stime]
      timesheet.endTime = params[:etime]
      timesheet.day = params[:day]
      timesheet.employee_id = params[:ename]
      timesheet.site_id = params[:site]
      timesheet.site_name = Site.find(params[:site]).site_name
      timesheet.save
      flash[:notice] = "Timesheet Added Successfully"
      redirect_to '/admin/login'
    else
      redirect_to '/adminlogin'
    end
  end

  def view
    if logged_in?
      @employee = Employee.find(params[:id])
      @timesheets = @employee.timesheets
    else
      redirect_to '/adminlogin'
    end
  end

  def hours
    employee = Employee.find_by(id:params[:id])
    days = []
    day = Date.parse(params[:sweek])
    while day <= Date.parse(params[:eweek]) do
      days.push(day)
      day = day.next
    end
    @total = 0
    days.each do |day|
      hour = Timesheet.where(employee_id:params[:id], day:day)
      if hour.length != 0
        @total = @total + hour[0].hours
      end
    end
    render :json => @total
  end

  def save
    params[:users].each do |user|
      timesheet = Timesheet.new
      timesheet.hours = user[:hours]
      timesheet.startTime = user[:stime]
      timesheet.endTime = user[:etime]
      timesheet.day = user[:day]
      timesheet.employee_id = user[:ename]
      timesheet.site_id = user[:site]
      timesheet.site_name = user[:site_name]
      timesheet.save
    end
    redirect_to '/admin/login'
  end

  def edit
    @employees = Employee.all
  end

  def check
    if logged_in?
      @timesheets = Timesheet.where(employee_id: params[:id])
      render :json => @timesheets
    else
      redirect_to '/adminlogin'
    end
  end

  def days
    @employee = Employee.find_by(id: params[:id])
    @timesheets = Timesheet.where(day: params[:sday].. params[:eday])
    render :json => @timesheets
  end

  def delete
    if logged_in?
      timesheet = Timesheet.find_by(id: params[:id])
      timesheet.destroy
      flash[:notice] = "Timesheet deleted Successfully"
      redirect_to '/admin/login'
    else
      redirect_to '/adminlogin'
    end
  end

end
