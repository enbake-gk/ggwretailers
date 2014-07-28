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
      
      respond_to do |format|
        format.html
        format.csv { send_data @sale_to_customers.to_csv }
      end
  end

  # GET /sale_to_customers/1
  # GET /sale_to_customers/1.json
  def show
  end

  # GET /sale_to_customers/new
  def new
    if params[:key].present?
      @sale_to_customer = Equipment.find_by_serial_number(params[:key])
    else
      @sale_to_customer = Equipment.new
    end
    customer = @sale_to_customer.build_customer
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
    elsif current_user.is_retailer? && (@sale_to_customer.retailer_id != current_user.id)
      redirect_to new_sale_to_customer_path, notice: 'Sorry your are trying to sale Equipment that was not assigned to you.' 
      return
    end

    if @sale_to_customer.sold_to_retailer == false
       @sale_to_customer.sold_to_retailer = true
       SaleHistory.create(model_id: @sale_to_customer.model_id,brand_id: @sale_to_customer.brand_id, selling_date: Date.today, equipment_id: @sale_to_customer.id, serial_no: params[:equipment_id], buyer_id: params[:sale_to_customer][:retailer_id], seller_id: current_user.id)
    end
    
     mail_user = User.find_by_email(params[:sale_to_customer][:customer_attributes][:email])
     if mail_user.present? && mail_user.role? != 'Customer' 
        redirect_to new_sale_to_customer_path, notice: 'Sorry This Email is not Available for you'
        return 
     end

    @customer = update_customer
    @sale_to_customer.customer_id = @customer.id
    
    respond_to do |format|
      if @sale_to_customer.update(sale_to_customer_params)
      #if @sale_to_customer.update(:customer_id => @customer.id, :retailer_id => params[:sale_to_customer][:retailer_id], :purchase_date => params[:sale_to_customer][:purchase_date], :price => params[:sale_to_customer][:price])
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
      @customer = update_customer
      @sale_to_customer.customer_id = @customer.id
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

  def update_customer

    customer = User.find_or_initialize_by(:email => params[:sale_to_customer][:customer_attributes][:email], :role_id => 5)
    
   #to chnage date fomat
    event = params[:sale_to_customer][:customer_attributes]
    dob = Date.new event["dob(1i)"].to_i, event["dob(2i)"].to_i, event["dob(3i)"].to_i


    customer.update(:first_name => params[:sale_to_customer][:customer_attributes][:first_name],
       :last_name => params[:sale_to_customer][:customer_attributes][:last_name],
       :email => params[:sale_to_customer][:customer_attributes][:email],
       :mobile => params[:sale_to_customer][:customer_attributes][:mobile],
       :phone_number => params[:sale_to_customer][:customer_attributes][:phone_number],
       :address => params[:sale_to_customer][:customer_attributes][:address],
       :town => params[:sale_to_customer][:customer_attributes][:town],
       :city => params[:sale_to_customer][:customer_attributes][:city],
       :post_code => params[:sale_to_customer][:customer_attributes][:post_code],
       :dob => dob,
       :customer_note => params[:sale_to_customer][:customer_attributes][:customer_note],
       :gender => params[:sale_to_customer][:customer_attributes][:gender],
       :role_id => '5')
    
        customer
  end

  def get_customer
    @result = User.customer.where(:email => params[:email]).first
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_to_customer
      @sale_to_customer = Equipment.find(params[:id])
    end

    def sale_to_customer_params
      params.require(:sale_to_customer).permit(:purchase_date, :retailer_id,:selling_date, :name, :url, :price).merge(sold_to_customer: true)
    end
end
