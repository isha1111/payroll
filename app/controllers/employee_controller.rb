class EmployeeController < ApplicationController

  def new_emp
  end

  def create

    employee = Employee.new
    employee.name = params[:fname]
    employee.dob = params[:dob]
    employee.email= params[:email]
    employee.address= params[:address1]
    employee.PhoneNumber= params[:phone]
    employee.save
    flash[:notice] = "Employee Added Successfully"
    redirect_to '/admin/login'

  end

  def show
  end

  def edit
    employee = Employee.find_by(id: params[:id])
    employee.name = params[:fname]
    puts params
    employee.dob = params[:dob]
    employee.email = params[:email]
    employee.PhoneNumber = params[:phone]
    employee.address = params[:address]
    employee.save
    redirect_to '/admin/login'
  end

  def delete
    employee = Employee.find_by(id: params[:id])
    employee.delete
    redirect_to '/admin/login'
  end

end
