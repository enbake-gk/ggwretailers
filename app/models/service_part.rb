class ServicePart < ActiveRecord::Base
  belongs_to :part
  belongs_to :job
  belongs_to :equipment, :primary_key => "serial_number", :foreign_key => "serial_number"

end
