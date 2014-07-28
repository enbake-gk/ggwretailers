class Part < ActiveRecord::Base
  belongs_to :model
  has_many :service_parts
end
