class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @search = User.not_admin.search(params[:q])
    @users = @search.result.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @equipments =Equipment.all.where(:retailer_id => params[:id]).uniq { |e| e[:first_name] }
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save!
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to users_path(:type=>2), notice: 'Retailer was successfully created.' }
      else
        format.html { render :new }
      end
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

  def serial_key_list
     # @serial_keys = SaleHistory.where("customer_id=?", current_user.id)
      @serial_keys = SaleHistory.where("buyer_id=?", current_user.id)

      @search = Equipment.recent.search(params[:q])
      @equipment = @search.result.paginate(:page => params[:page], :per_page => 12)
      @product_import = EquipmentImport.new
 
  end

  def check_email_uniq
    id = params[:id]
    email = params[:user][:email]
    check_email = User.where("email =?",email)
    if check_email.present? && check_email.first.try(:id) != id.try(:to_i)
      render :status => :ok,:text => "false"
    else
      render  :status => :ok,:text=>"true"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:retailer_group_id, :retailer_name,:contact_person, :website, :retailer_name, :phone_number, :email, :first_name,:last_name).merge(:role_id=>"2",:password => '12345678')
    end
end
