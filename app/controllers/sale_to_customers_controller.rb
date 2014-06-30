class SaleToCustomersController < ApplicationController
  before_action :set_sale_to_customer, only: [:show, :edit, :update, :destroy]

  # GET /sale_to_customers
  # GET /sale_to_customers.json
  def index
    @search = Equipment.search(params[:q])
    @sale_to_customers = @search.result.sold_to_customer.includes(:brand, :model, :user).paginate(:page => params[:page], :per_page => 12)
    #@search = Equipment.search(params[:q])
    #@supervisors = @search.result.includes(:department, :employees)
   # @sale_to_customers = Equipment.sold_to_customer.paginate(:page => params[:page], :per_page => 12)
    # abort @sale_to_customers.to_sql
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_to_customer
      @sale_to_customer = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_to_customer_params
      params.require(:sale_to_customer).permit(:retailer_id,:selling_date, :name, :url, :price,  :first_name, :last_name, :address, :town, :city, :post_code, :telephone, :mobile, :email, :dob, :customer_note).merge(sold_to_customer: true)
    end
end
