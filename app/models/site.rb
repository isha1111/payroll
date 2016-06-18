class Site < ActiveRecord::Base
  has_many :employees, through: :timesheets
  has_many :timesheets

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |site|
        csv << site.attributes.values_at(*column_names)
      end
    end
  end

end
