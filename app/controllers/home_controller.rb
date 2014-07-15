class HomeController < ApplicationController
  #before_action :authenticate_user!

 	def index
 		if current_user.present?
 			if ((current_user.is_admin?) || (current_user.is_manager?)) 		
 				redirect_to serialnumbers_path
 			elsif current_user.is_retailer?
 				redirect_to customers_path
 			else

 			end
 		else
 			redirect_to warrantyregistration_path
 		end
 	end

	def warrantyregistration
     	@search = Equipment.recent.search(params[:q])
 	end
 	
 	def warrantyregistration_edit
 		if params[:q].present?
 	    	@result = Equipment.find_by_serial_number(params[:q][:serial_number_eq])
 	    end
 	    if !@result.present?
 	   	  redirect_to warrantyregistration_path, notice: 'No Record Found.'
 	   	  return
 	   	elsif @result.present? && @result.is_registered == 'true'
 	   	  redirect_to warrantyregistration_path, notice: 'Your Product is Already registered'
 	   	  return
 	   	end
 	end

 	def warrantyregistration_update
	 puts params
	  @equipment = Equipment.find(params[:id])
	  @equipment.is_registered = true
	    respond_to do |format|
	      if @equipment.update(equipment_params)
	      	UserMailer.registrered_mail(@equipment).deliver!
	        format.html { redirect_to warrantyregistration_path, notice: 'Serial Number was successfully updated.' }
	        format.json { render :show, status: :ok, location: @equipment }
	      else
	        format.html { render :edit }
	        format.json { render json: @equipment.errors, status: :unprocessable_entity }
	      end
	    end		
 	end

 	def get_customer
 		@result = Equipment.where(:email => params[:email]).first
 		respond_to do |format|
	    	format.js
		end
 	end	

 	def equipment_params
      # ,:brand=>Brand.find(params[:equipment][:model_id])
      params.require(:equipment).permit(:purchase_date, :retailer_id,:selling_date, :name, :url, :price,  :first_name, :last_name, :address, :town, :city, :post_code, :telephone, :mobile, :email, :dob, :customer_note).merge(sold_to_customer: true)
    end

end
