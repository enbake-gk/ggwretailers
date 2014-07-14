class SaleHistory < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :brand
  belongs_to :model
  belongs_to :seller , :class_name=> :User , :foreign_key => "seller_id"
  belongs_to :buyer , :class_name=> :User , :foreign_key => "buyer_id"

  validates :buyer_id, :presence => { :message => "Invalid Retailer Name, Please try with valid Retailer Name" }
  validates :equipment_id, :presence => { :message => "Invalid Serial Number, Please try valid Serial Number " }
  # accepts_nested_attributes_for :equipment

  scope :recent, -> { order('created_at desc')  }
end
