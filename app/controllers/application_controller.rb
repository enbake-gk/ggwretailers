class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 # private
 #   def after_sign_in_path_for(user)
 #   	 abort user.to_yaml
 #        user_url(user)
 #    end
 def is_admin
    if current_user.is_retailer? || current_user.is_customer?
      flash[:error] = "You are not allowed to view this page"
      redirect_to customers_path
    end
  end

  def valid_retailer
      equipment = Equipment.find(params[:id])
  	if current_user.is_retailer? and equipment.retailer_id != current_user.id
      flash[:error] = "You are not allowed to view this page"
      redirect_to customers_path
  	end
  end
end
