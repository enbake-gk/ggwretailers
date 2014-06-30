class SaleHistory < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :brand
  belongs_to :model
  belongs_to :seller , :class_name=> :User , :foreign_key => "seller_id"
  belongs_to :buyer , :class_name=> :User , :foreign_key => "buyer_id"
  # accepts_nested_attributes_for :equipment
end
