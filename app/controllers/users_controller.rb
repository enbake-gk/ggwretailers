class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = @users.retailer if (params[:type].try(:to_i) == 2)
    @users = @users.order("id desc")
    @users = @users.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  # POST /users.json
   def create
    resource = build_resource(sign_up_params)
    if resource.save
      UserMailer.welcome_email(resource).deliver
      format.html { redirect_to users_path(:type=>2), notice: 'Retailer was successfully created.' }
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


 
   # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path(:type=>2), notice: 'Retailer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path(:type=>2), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:contact_person, :website, :retailer_name, :phone_number, :email, :password, :password_confirmation,:role_id).merge(:role_id=>"2")
    end
end
