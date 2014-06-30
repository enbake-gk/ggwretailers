class Equipment < ActiveRecord::Base
	belongs_to :model
	belongs_to :brand
	belongs_to :user
	has_many :sale_histories
  # validates :serial_number, presence: true
  # validates :serial_number, uniqueness: true
  validates_presence_of :serial_number
end
