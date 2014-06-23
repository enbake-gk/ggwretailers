class RetailersController  < ApplicationController
  
  def index
    @user = User.all
  end

  def new
    @user = User.new()
  end

  def registration
  
  # abort user_params.email.to_json

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to models_path, notice: 'Retailers was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end 
  end



private
 def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password_confirmation,:password,:contact_person,:website,:role_id).merge(:role_id=>"2")
 end
end