class HomeController < ApplicationController
  before_action :authenticate_user!

	def index
		if ((current_user.is_admin?) || (current_user.is_manager?)) 		
			redirect_to serialnumbers_path
		elsif current_user.is_retailer?
			redirect_to customers_path
		else
			redirect_to "/users/sign_in"
		end
	end

end

# class HomeController < ApplicationController
#   #before_action :authenticate_user!

# 	def index
# 		if current_user.present?
# 			if ((current_user.is_admin?) || (current_user.is_manager?)) 		
# 				redirect_to serialnumbers_path
# 			elsif current_user.is_retailer?
# 				redirect_to customers_path
# 			else

# 			end
# 		else
# 			redirect_to warrantyregistration_path
# 		end
# 	end

# 	def warrantyregistration
# 		puts "================================================="
# 		puts "Inside search"
# 		puts params[:q]
# 		puts "================================================="
#     	@search = Equipment.recent.search(params[:q])
# 	    if params[:q].present?
# 	    	@result = Equipment.find_by_serial_number(params[:q][:serial_number_eq])
# 	    	puts @result
# 	    end
#         #@equipment = @search.result.paginate(:page => params[:page], :per_page => 12)
# 	end

# 	def warrantyregistration_update
		
# 	end	


# end
