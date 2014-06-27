class AddSellerIdtoSellHistory < ActiveRecord::Migration
  def change
  	 add_column :sale_histories, :seller_id,:integer
  	 add_column :sale_histories, :buyer_id,:integer
  	 add_index :sale_histories, :seller_id
  	 add_index :sale_histories, :buyer_id
  end
end
