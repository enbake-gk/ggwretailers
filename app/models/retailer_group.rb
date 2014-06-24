class RetailerGroup < ActiveRecord::Base
 has_many :retailers,->{where("role_id=2")},class_name: :User,:foreign_key=>:retailer_group_id
end