class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_scope { order('created_at desc') }
  belongs_to :retailer_groups
  has_one :sale_history
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable#, :validatable  :registerable,

  scope :not_admin, -> { where.not(role_id: 1) }
  scope :admin, -> { where(role_id: 1) }
  scope :retailer, -> { where(role_id: 2) }
  scope :service_tech, -> { where(role_id: 3) }
  scope :manager, -> { where(role_id: 4) }
  scope :setting, -> { where("role_id = '4' OR role_id = '3'") }
  scope :recent, -> { order('created_at desc')  }
  #attr_accessor :user_name
  #scope :retailer, -> { where(role_id: 2) }



  ransacker :full_name do |parent|
    Arel::Nodes::NamedFunction.new('concat_ws', [' ', parent.table[:first_name], parent.table[:last_name], parent.table[:contact_person]])
  end

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
    elsif self.role_id.try(:to_i) == 1
     return 'Admin'
    elsif self.role_id.try(:to_i) == 2
     return 'Retailer' 
   end
  end 

  validates :email, :uniqueness => true
  def user_name 
  	"#{self.first_name} #{self.last_name}"
  end

end
