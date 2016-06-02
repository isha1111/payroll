class Employee < ActiveRecord::Base
  has_many :timesheets
end
