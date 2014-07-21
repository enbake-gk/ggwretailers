class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin, :except => [:index]

  # GET /equipment
  # GET /equipment.json
  def index
    # puts Brand.delete_all
    # puts Model.delete_all
    # puts Equipment.delete_all
    @search = Equipment.recent.search(params[:q])
    @equipment = @search.result.paginate(:page => params[:page], :per_page => 12)
    @product_import = EquipmentImport.new
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
    @jobs = Job.where('serial_number = ?', @equipment.serial_number)
  end

  # GET /equipment/new
  def new                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end
  
  def get_models
    @models = Model.where("brand_id=?",params[:id])
    respond_to do |format|
      format.json { render json: @models }
    end
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to serialnumbers_path, notice: 'Serial Number was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to serialnumbers_path, notice: 'Serial Number was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to serialnumbers_path, notice: 'Serial Number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def import 
    # @equipment=Equipment.import(params[:file],current_user.id)
    # redirect_to equipment_index_path, notice: 'Equipment was successfully created.'
     @product_import = EquipmentImport.new(params[:equipment_import])
    if @product_import.save
      redirect_to serialnumbers_path, notice: "Imported products successfully."
    else
      render :import
    end
  end

  private

    def import_file
      params.require(:file).permit(:model_id,:brand_id,:serial_number)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      # ,:brand=>Brand.find(params[:equipment][:model_id])
      params.require(:equipment).permit(:model_id,:brand_id,:colour_id,:serial_number)
    end
end
