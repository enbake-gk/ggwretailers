class SaleHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin , :except => [:equipment_list_by_srno, :equipment_detail, :retailer_list_by_srno]
  before_action :set_sale_history, only: [:show, :edit, :update, :destroy]

  # GET /sale_histories
  # GET /sale_histories.json
  def index
    @search = SaleHistory.recent.search(params[:q])
    @sale_histories = @search.result.includes(:equipment,:brand,:model,:buyer).paginate(:page => params[:page], :per_page => 12)
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
    @sale_history.model_id = @equipment.model_id
    @sale_history.brand_id = @equipment.brand_id
    @sale_history.serial_no = @equipment.serial_number
    if @equipment.sold_to_retailer == true
      redirect_to new_sale_history_path, notice: "Serial number (#{@equipment.serial_number}) has already been registered" 
      return
    end
    respond_to do |format|
      if @sale_history.save
        @equipment.sold_to_retailer = true
        @equipment.retailer_id = params[:sale_history][:buyer_id]
        @equipment.save
        format.html { redirect_to sale_histories_path, notice: 'Data was successfully created.' }
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
    @equipment = Equipment.find(params[:sale_history][:equipment_id])
    if @sale_history.equipment_id != @equipment.id and @equipment.sold_to_retailer == true
      redirect_to edit_sale_history_path(@sale_history), notice: "Serial number (#{@equipment.serial_number}) has already been registered" 
      return
    elsif @equipment.sold_to_retailer != true
      @equipment.sold_to_retailer = true
      @equipment.retailer_id = params[:sale_history][:buyer_id]
      @equipment.save
      equipment_old = @sale_history.equipment
      equipment_old.sold_to_retailer = false
      equipment_old.save
    else
    end
    respond_to do |format|
      if @sale_history.update(sale_history_params)
        format.html { redirect_to sale_histories_path, notice: 'Data was successfully updated.' }
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
      format.html { redirect_to sale_histories_path, notice: 'Data was successfully destroyed.' }
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
      if !@equipment.present?
        @equipment = Equipment.select("models.name as mname,brands.name as bname,colours.name as cname")
                  .joins(:model,:brand,:colour)
                  .where("equipment.id = ? ",id)
      end     
      respond_to do |format|
        format.json { render json: @equipment.try(:first)   }
      end
  end

  def retailer_list_by_srno
       sr_no = params[:query]
       @retailer = User.retailer.select("id,contact_person AS usr_name").where("users.contact_person LIKE ? ","%#{sr_no}%")
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
