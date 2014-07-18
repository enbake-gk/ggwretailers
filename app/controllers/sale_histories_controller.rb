class SaleHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin , :except => [:equipment_list_by_srno, :equipment_detail, :retailer_list_by_srno]
  before_action :set_sale_history, only: [:show, :edit, :update, :destroy]

  # GET /sale_histories
  # GET /sale_histories.json
  def index
    @sale_histories = SaleHistory.recent.includes(:equipment,:brand,:model,:buyer).paginate(:page => params[:page], :per_page => 12)
  end

  # GET /sale_histories/1
  # GET /sale_histories/1.json
  def show
  end

  # GET /sale_histories/new
  def new
    @sale_history = SaleHistory.new
  end

  # GET /sale_histories/1/edit
  def edit
  end

  # POST /sale_histories
  # POST /sale_histories.json
  def create
    @sale_history = SaleHistory.new(sale_history_params)
    @equipment = Equipment.find(params[:sale_history][:equipment_id])
    if @equipment.sold_to_retailer == true
      redirect_to new_sell_to_retailer_path, notice: 'Equipment Was already Sold.' 
      return
    end
    respond_to do |format|
      if @sale_history.save
        @equipment.sold_to_retailer = true
        @equipment.retailer_id = params[:sale_history][:buyer_id]
        @equipment.save
        format.html { redirect_to sell_to_retailer_path, notice: 'Data was successfully created.' }
        format.json { render :show, status: :created, location: @sale_history }
      else
        format.html { render :new }
        format.json { render json: @sale_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_histories/1
  # PATCH/PUT /sale_histories/1.json
  def update
    respond_to do |format|
      if @sale_history.update(sale_history_params)
        format.html { redirect_to sell_to_retailer_path, notice: 'Data was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_history }
      else
        format.html { render :edit }
        format.json { render json: @sale_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_histories/1
  # DELETE /sale_histories/1.json
  def destroy
    @sale_history.destroy
    respond_to do |format|
      format.html { redirect_to sell_to_retailer_path, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def equipment_list_by_srno

      sr_no = params[:query]
      @equipment = Equipment.select("equipment.id,equipment.serial_number")
                  .where("equipment.serial_number LIKE ?","%#{sr_no}%")

      respond_to do |format|
        format.json { render json: @equipment   }
      end

  end

  def equipment_detail
      id = params[:id]
      @equipment = Equipment.select("users.contact_person as rname, models.name as mname,brands.name as bname,colours.name as cname")
                  .joins(:model,:brand,:colour,:retailer)
                  .where("equipment.id = ? ",id)
      puts "===================================="
      puts @equipment
      puts "================================="
      if !@equipment.present?
        @equipment = Equipment.select("models.name as mname,brands.name as bname,colours.name as cname")
                  .joins(:model,:brand,:colour)
                  .where("equipment.id = ? ",id)
      puts @equipment
      end     
      puts "========================"             
      respond_to do |format|
        format.json { render json: @equipment.try(:first)   }
      end
  end

  def retailer_list_by_srno
       sr_no = params[:query]
       @retailer = User.retailer.select("id, CONCAT(first_name, ' ', last_name) AS usr_name ")
                  .where("users.first_name LIKE ?  or users.last_name  LIKE ?","%#{sr_no}%","%#{sr_no}%")

      respond_to do |format|
        format.json { render json: @retailer }
      end
   
  end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_history
      @sale_history = SaleHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_history_params
      params.require(:sale_history).permit(:equipment_id, :buyer_id, :selling_date).merge(seller_id: current_user.id)
      # .merge(seller_id: current_user.id,equipment_attributes: [:sold_to_retailer=>true ])
    end
end
