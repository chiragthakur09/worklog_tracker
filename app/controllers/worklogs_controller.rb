class WorklogsController < ApplicationController
  before_action :set_worklog, only: %i[ show edit update destroy ]

  # GET /worklogs or /worklogs.json
  def index
    @worklogs = Worklog.all
  end

  # GET /worklogs/1 or /worklogs/1.json
  def show
  end

  # GET /worklogs/new
  def new
    @worklog = Worklog.new
  end

  # GET /worklogs/1/edit
  def edit
  end

  # POST /worklogs or /worklogs.json
  def create
    @worklog = Worklog.new(worklog_params)

    respond_to do |format|
      if @worklog.save
        format.html { redirect_to worklog_url(@worklog), notice: "Worklog was successfully created." }
        format.json { render :show, status: :created, location: @worklog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worklog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worklogs/1 or /worklogs/1.json
  def update
    respond_to do |format|
      if @worklog.update(worklog_params)
        format.html { redirect_to worklog_url(@worklog), notice: "Worklog was successfully updated." }
        format.json { render :show, status: :ok, location: @worklog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worklog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worklogs/1 or /worklogs/1.json
  def destroy
    @worklog.destroy

    respond_to do |format|
      format.html { redirect_to worklogs_url, notice: "Worklog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worklog
      @worklog = Worklog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worklog_params
      params.require(:worklog).permit(:user_id, :date, :hours, :notes)
    end
end
