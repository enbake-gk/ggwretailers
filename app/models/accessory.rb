class Accessory < ActiveRecord::Base
  belongs_to :user
  has_many :accessoriesmodels
  has_many :models,:through=>:accessoriesmodels
  accepts_nested_attributes_for :accessoriesmodels
end
