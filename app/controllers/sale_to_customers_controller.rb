class SaleToCustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale_to_customer, only: [:show, :edit, :update, :destroy]

  # GET /sale_to_customers
  # GET /sale_to_customers.json
  def index
    @search = Equipment.search(params[:q])
    if current_user.is_retailer?
      @search = Equipment.where(:retailer_id => current_user.id).search(params[:q])
    end
     @sale_to_customers = @search.result.sold_to_customer.includes(:brand, :model, :user).paginate(:page => params[:page], :per_page => 12)
  end

  # GET /sale_to_customers/1
  # GET /sale_to_customers/1.json
  def show
  end

  # GET /sale_to_customers/new
  def new
    @sale_to_customer = Equipment.new
  end

  # GET /sale_to_customers/1/edit
  def edit
  end

  # POST /sale_to_customers
  # POST /sale_to_customers.json
  def create
    @sale_to_customer = Equipment.find_by_serial_number(params[:equipment_id])
    @history = SaleHistory.find_by_equipment_id(params[:equipment_id])
    if @sale_to_customer.sold_to_customer == true
      redirect_to new_sale_to_customer_path, notice: 'Equipment Was already Sold.' 
      return
    elsif current_user.is_retailer? && (@sale_to_customer.id != current_user.id)
      redirect_to new_sale_to_customer_path, notice: 'Sorry your are trying to sale Equipment that was not assigned to you.' 
      return
    end
     if @sale_to_customer.sold_to_retailer == false
          @sale_to_customer.sold_to_retailer = true
          SaleHistory.create(selling_date: Date.today, equipment_id: @sale_to_customer.id, serial_no: params[:equipment_id], buyer_id: params[:sale_to_customer][:retailer_id], seller_id: current_user.id)
        end
     respond_to do |format|
      if @sale_to_customer.update(sale_to_customer_params)
        format.html { redirect_to  sale_to_customers_path, notice: 'Sale to customer was successfully created.' }
        format.json { render :show, status: :ok, location: @sale_to_customer }
      else
        format.html { render :new }
        format.json { render json: @sale_to_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_to_customers/1
  # PATCH/PUT /sale_to_customers/1.json
  def update
    respond_to do |format|
      if @sale_to_customer.update(sale_to_customer_params)
        format.html { redirect_to  sale_to_customers_path, notice: 'Sale to customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_to_customer }
      else
        format.html { render :edit }
        format.json { render json: @sale_to_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_to_customers/1
  # DELETE /sale_to_customers/1.json
  def destroy
    @sale_to_customer.destroy
    respond_to do |format|
      format.html { redirect_to  sale_to_customers_path, notice: 'Sale to customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_customer
    @result = Equipment.where(:email => params[:email]).first
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_to_customer
      @sale_to_customer = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_to_customer_params
      params.require(:sale_to_customer).permit(:purchase_date, :retailer_id,:selling_date, :name, :url, :price,  :first_name, :last_name, :address, :town, :city, :post_code, :telephone, :mobile, :email, :dob, :customer_note).merge(sold_to_customer: true)
    end
end
