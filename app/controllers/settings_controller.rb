class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = User.recent.setting.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = User.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = User.new(setting_params)
    respond_to do |format|
      if @setting.save
        UserMailer.welcome_email(@setting).deliver
        format.html { redirect_to show_user_path(@setting), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to show_user_path(@setting), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
        params.require(:setting).permit(:first_name, :last_name, :email, :admin, :role_id).merge(:password => 'U1tZyyLVTD')
    end
end
