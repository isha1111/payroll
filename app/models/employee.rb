class Employee < ActiveRecord::Base
  has_many :sites, through: :timesheets
  has_many :timesheets

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee|
        csv << employee.attributes.values_at(*column_names)
      end
    end
  end

end
