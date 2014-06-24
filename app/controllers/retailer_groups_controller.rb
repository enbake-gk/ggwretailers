class RetailerGroupsController < ApplicationController
  before_action :set_retailer_group, only: [:show, :edit, :update, :destroy]

  # GET /retailer_groups
  # GET /retailer_groups.json
  def index
    @retailer_groups = RetailerGroup.all
  end

  # GET /retailer_groups/1
  # GET /retailer_groups/1.json
  def show
  end

  # GET /retailer_groups/new
  def new
    @retailer_group = RetailerGroup.new
  end

  # GET /retailer_groups/1/edit
  def edit
  end

  # POST /retailer_groups
  # POST /retailer_groups.json
  def create
    @retailer_group = RetailerGroup.new(retailer_group_params)

    respond_to do |format|
      if @retailer_group.save
        format.html { redirect_to @retailer_group, notice: 'Retailer group was successfully created.' }
        format.json { render :show, status: :created, location: @retailer_group }
      else
        format.html { render :new }
        format.json { render json: @retailer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retailer_groups/1
  # PATCH/PUT /retailer_groups/1.json
  def update
    respond_to do |format|
      if @retailer_group.update(retailer_group_params)
        format.html { redirect_to @retailer_group, notice: 'Retailer group was successfully updated.' }
        format.json { render :show, status: :ok, location: @retailer_group }
      else
        format.html { render :edit }
        format.json { render json: @retailer_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retailer_groups/1
  # DELETE /retailer_groups/1.json
  def destroy
    @retailer_group.destroy
    respond_to do |format|
      format.html { redirect_to retailer_groups_url, notice: 'Retailer group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer_group
      @retailer_group = RetailerGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailer_group_params
      params.require(:retailer_group).permit(:name)
    end
end
