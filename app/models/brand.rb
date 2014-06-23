class Brand < ActiveRecord::Base
  belongs_to :user
  has_many :models
  
end
