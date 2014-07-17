class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:new, :create, :show, :check_serial_key]

  # GET /jobs
  # GET /jobs.json
  def index
    #@jobs = Job.all
     @jobs = Job.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @search = Equipment.recent.search(params[:q])
  end

  def check_serial_key 
    @search = Equipment.recent.search(params[:q])
      if params[:q].present?
        @result = Equipment.find_by_serial_number(params[:q][:serial_number_eq])
      end
      if !@result.present?
        redirect_to new_job_path, notice: 'No Record Found.'
        return
      else
        redirect_to new_jobs_with_params_path(:key => @result.serial_number)
      end
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to new_job_path, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        puts "=================================================="
        puts job_params
        puts "=================================================="
        puts params
        puts "cost" 
        puts @job.cost
        puts "==================================================="
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:cost, :serial_number, :claim_amount, :date_of_job, :service_notes, :time_spent, :claimed, :warrenty_job, :servicetech)
    end
end
