require "date"

class TimesheetController < ApplicationController

  def new
    @employees = Employee.all
    @sites = Site.all
  end

  def create
    timesheet = Timesheet.new
    timesheet.hours = params[:hours]
    timesheet.day = params[:day]
    timesheet.employee_id = params[:ename]
    timesheet.site_id = params[:site]
    timesheet.save
    redirect_to '/admin/login'
  end

  def view
    @employee = Employee.find(params[:id])
    @timesheets = @employee.timesheets
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

end
