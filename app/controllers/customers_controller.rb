class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show,:create, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    #@equipments = Equipment.all.where(:retailer_id => current_user.id).uniq { |e| e[:first_name] }
                 #.order("id desc")
                 #.paginate(:page => params[:page], :per_page => 5)
    if current_user.is_retailer?
      equipments = Equipment.where(:retailer_id => current_user.id ) 
      @customers = [] 
      equipments.each do |equipment|
        @customers << equipment.customer
      end
      @customers = @customers.uniq{|x| x.id}
      @customers
    else
     @customers = User.customer  
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    #@customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_path(@customer), notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:user).permit(:email,:first_name, :last_name, :address, :town, :city, :post_code, :phone_number, :mobile, :dob, :customer_note, :gender)
    end
end
