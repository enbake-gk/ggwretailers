class Job < ActiveRecord::Base

  belongs_to :equipment, :primary_key => "serial_number", :foreign_key => "serial_number"
  has_many :service_parts, :dependent => :destroy

  accepts_nested_attributes_for :service_parts, :reject_if => lambda { |a| a[:quantity].blank? }, :allow_destroy => true

  TIME_SPENT = ["1/2 hr", "1 hr","1 1/2 hr", "2 hr","2 1/2 hr", "3 hr"]
scope :recent, -> { order('created_at desc')  }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end 
 
end
