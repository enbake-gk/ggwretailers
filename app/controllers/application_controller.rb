class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
 # private
 #   def after_sign_in_path_for(user)
 #   	 abort user.to_yaml
 #        user_url(user)
 #    end
end
