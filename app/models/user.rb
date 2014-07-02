class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_scope { order('created_at desc') }
  belongs_to :retailer_groups
  has_one :sale_history
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable#, :validatable  :registerable,

  scope :admin, -> { where(role_id: 1) }
  scope :retailer, -> { where(role_id: 2) }
  scope :service_tech, -> { where(role_id: 3) }
  scope :manager, -> { where(role_id: 4) }
  #attr_accessor :user_name
  #scope :retailer, -> { where(role_id: 2) }

  def is_admin?
  		self.role_id.try(:to_i) == 1
  end

  def is_retailer?
 		self.role_id.try(:to_i) == 2
  end

  def is_manager?
    self.role_id.try(:to_i) == 4
  end

  def is_service_tech?
 		self.role_id.try(:to_i) ==3
  end

  def role?
    if self.role_id.try(:to_i) == 4
     return 'Manager' 
    elsif self.role_id.try(:to_i) ==3
     return 'ServiceTech'
   end
  end 

  validates :email, :uniqueness => true
  def user_name 
  	"#{self.first_name} #{self.last_name}"
  end

end
