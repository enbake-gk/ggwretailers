class Colour < ActiveRecord::Base
  belongs_to :user
  has_many :equipment
  validates :name, presence: true

end
