class SaleHistory < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :brand
  belongs_to :model
end
