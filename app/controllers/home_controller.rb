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
