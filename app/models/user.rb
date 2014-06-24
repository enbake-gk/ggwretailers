class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  belongs_to :retailer_groups
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable#, :validatable  :registerable,

  scope :retailer, -> { where(role_id: 2) }
  validates :email, :uniqueness => true
  def user_name 
  	"#{self.first_name} #{self.last_name}"
  end
end
