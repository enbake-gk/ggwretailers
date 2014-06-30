class Equipment < ActiveRecord::Base
	belongs_to :model
	belongs_to :brand
	belongs_to :user
	belongs_to :retailer , :class_name=> :User , :foreign_key => "retailer_id"
  # validates :serial_number, presence: true
  # validates :serial_number, uniqueness: true
  validates_presence_of :serial_number
end
