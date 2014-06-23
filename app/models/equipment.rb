class Equipment < ActiveRecord::Base
	belongs_to :model
	belongs_to :brand
	belongs_to :user
end
