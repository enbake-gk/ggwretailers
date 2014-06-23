class Accessoriesmodel < ActiveRecord::Base
  belongs_to :model
  belongs_to :accessory
  belongs_to :user
end
