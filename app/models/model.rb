class Model < ActiveRecord::Base
  has_many :accessoriesmodels, :dependent => :destroy
  has_many :models,:through => :accessoriesmodels
  has_one :eqipment, :dependent => :destroy
  belongs_to :brand
  belongs_to :user
  mount_uploader :image, AvatarUploader
  validates :name, presence: true
  scope :recent, -> { order('created_at desc')  }
end
