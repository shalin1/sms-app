class TrainStatusesController < ApplicationController

  # GET /train_statuses
  # GET /train_statuses.json
  def index
    @train_statuses = TrainStatus.all
  end

  # GET /train_statuses/1
  # GET /train_statuses/1.json
  def show
    @train_status = TrainStatus.find(params[:id])
  end

  # GET /train_statuses/new
  def new
    @train_status = TrainStatus.new
  end

  # POST /train_statuses
  # POST /train_statuses.json
  def create
    @status = MtaInfo.new.l_status
    @train_status = TrainStatus.new(message:@status)

    respond_to do |format|
      if @train_status.save
        message = "How is the L doing? #{@train_status.message}!"
        format.html { redirect_to @train_status, notice: "How is the L doing? #{@train_status.message}!" }
        format.json { render :show, status: :created, location: @train_status }
      else
        format.html { render :new }
        format.json { render json: @train_status.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def train_status_params
    params.require(:train_status).permit(:message)
  end
end
