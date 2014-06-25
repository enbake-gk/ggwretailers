class Brand < ActiveRecord::Base
  belongs_to :user
  has_many :models
  validates :name, presence: true
end
