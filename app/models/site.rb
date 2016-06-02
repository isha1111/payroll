class Site < ActiveRecord::Base
  has_many :employees
  belongs_to :timesheet
end
