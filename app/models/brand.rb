class Brand < ActiveRecord::Base
  belongs_to :user
  has_many :models, :dependent => :destroy
  validates :name, presence: true
  scope :recent, -> { order('created_at desc')  }
end
