class Model < ActiveRecord::Base
  has_and_belongs_to_many :accessories
  belongs_to :brand
  belongs_to :user
  mount_uploader :image, AvatarUploader
end
