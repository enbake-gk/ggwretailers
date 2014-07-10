class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :accessoriesmodels, :dependent => :destroy
  has_many :models,:through => :accessoriesmodels
  accepts_nested_attributes_for :accessoriesmodels
  scope :recent, -> { order('created_at desc')  }
   
end
