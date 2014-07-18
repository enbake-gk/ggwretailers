class Equipment < ActiveRecord::Base
	belongs_to :model
	belongs_to :brand
	belongs_to :user
  belongs_to :colour
	belongs_to :retailer , :class_name=> :User , :foreign_key => "retailer_id"
  # validates :serial_number, presence: true
  # validates :serial_number, uniqueness: true
  validates_presence_of :serial_number
  scope :sold_to_customer, -> { where(sold_to_customer: true) }
  scope :sold_to_retailer, -> { where(sold_to_retailer: true) }
  scope :recent, -> { order('created_at desc')  }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end 

end
