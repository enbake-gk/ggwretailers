class SaleHistory < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :brand
  belongs_to :model
  belongs_to :user , :foreign_key => "customer_id"
end
