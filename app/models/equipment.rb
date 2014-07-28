class Equipment < ActiveRecord::Base
	belongs_to :model
	belongs_to :brand
	belongs_to :user
  belongs_to :colour
  belongs_to :customer, :class_name=> :User, :foreign_key => "customer_id"
	belongs_to :retailer, :class_name=> :User, :foreign_key => "retailer_id"
  has_one :sale_history, :dependent => :destroy
  has_many :jobs, :primary_key => "serial_number", :foreign_key => "serial_number", :dependent => :destroy
  has_many :service_parts, :primary_key => "serial_number",:foreign_key => "serial_number", :dependent => :destroy

  validates_presence_of :colour
  validates_presence_of :model
  validates_presence_of :brand
  validates_presence_of :serial_number
  
  scope :sold_to_customer, -> { where(sold_to_customer: true) }
  scope :sold_to_retailer, -> { where(sold_to_retailer: true) }
  scope :recent, -> { order('created_at desc')  }
  
  #nested attribute for Customer create at time of sale
  accepts_nested_attributes_for :customer

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end 

end
