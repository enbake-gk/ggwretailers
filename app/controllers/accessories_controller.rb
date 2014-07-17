class AccessoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]
 
  # GET /accessories
  # GET /accessories.json
  def index
    @search = Accessory.recent.search(params[:q])
    @accessories = @search.result.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /accessories/1
  # GET /accessories/1.json
  def show
  end

  # GET /accessories/new
  def new
    @accessory = Accessory.new
    @accessory.accessoriesmodels.build()
  end

  # GET /accessories/1/edit
  def edit
  end

  # POST /accessories
  # POST /accessories.json
  def create
    @accessory = Accessory.new(accessory_params)
    models = params[:accessory][:model_id].delete_if{ |x| x.empty? }    
    respond_to do |format|
      if @accessory.save
        models.each do |model_id|
          Accessoriesmodel.create(:model_id => model_id, :accessory_id => @accessory.id, :user_id => current_user.id )
        end
        format.html { redirect_to accessories_url, notice: 'Accessory was successfully created.' }
        format.json { render :show, status: :created, location: @accessory }
      else
        format.html { render :new }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accessories/1
  # PATCH/PUT /accessories/1.json
  def update
    respond_to do |format|
      if @accessory.update(accessory_params)
        format.html { redirect_to accessories_url, notice: 'Accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: @accessory }
      else
        format.html { render :edit }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to accessories_url, notice: 'Accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accessory_params
     params.
      require(:accessory).
      permit(:name, :url, :price, :user_id, accessoriesmodels_attributes: [:user_id,:model_id ]).
      merge(user: current_user)
    end
end
