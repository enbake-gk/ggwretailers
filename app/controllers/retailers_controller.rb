class RetailersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  
  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = User.retailer
                .order("id desc")
                .paginate(:page => params[:page], :per_page => 5)
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
  end

  # GET /retailers/new
  def new
    @retailer = User.new
  end

 
  # GET /retailers/1/edit
  def edit
  end

  # POST /retailers
  # POST /retailers.json
  def create
    @retailer = User.new(retailer_params)
    respond_to do |format|
      if @retailer.save
        UserMailer.welcome_email(@retailer).deliver
        format.html { redirect_to retailers_url, notice: 'Retailer was successfully created.' }
        format.json { render :show, status: :created, location: @retailer }
      else
        format.html { render :new }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retailers/1
  # PATCH/PUT /retailers/1.json
  def update
    respond_to do |format|
      if @retailer.update(retailer_params)
        format.html { redirect_to retailers_url, notice: 'Retailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @retailer }
      else
        format.html { render :edit }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retailers/1
  # DELETE /retailers/1.json
  def destroy
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, notice: 'Retailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer
      @retailer = User.retailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailer_params
      params.require(:user).permit(:contact_person, :website, :retailer_name, :phone_number, :email, :password, :password_confirmation,:role_id).merge(:role_id=>"2")
    end
end
