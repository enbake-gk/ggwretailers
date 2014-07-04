class HomeController < ApplicationController
  before_action :authenticate_user!

	def index
		if current_user.is_admin? 	
			redirect_to brands_path
		elsif current_user.is_manager? 	
			redirect_to brands_path
		elsif current_user.is_retailer?
			redirect_to serial_key_list_users_path
		else
			redirect_to "/users/sign_in"
		end
	end

end
