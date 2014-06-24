class Equipment < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  belongs_to :model
  belongs_to :accessory
end
