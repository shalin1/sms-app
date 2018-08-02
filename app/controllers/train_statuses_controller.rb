class TrainStatusesController < ApplicationController

  def index
    @train_statuses = TrainStatus.all
  end

  def show
    @train_status = TrainStatus.find(params[:id])
  end

  def create
    @status = MtaInfo.new.l_status
    @train_status = TrainStatus.new(message:@status)

    respond_to do |format|
      if @train_status.save
        format.html { redirect_to @train_status }
        format.json { render :show, status: :created, location: @train_status }
      else
        format.html { render :new }
        format.json { render json: @train_status.errors, status: :unprocessable_entity }
      end
    end
  end


  def create_train_status
  end

  def train_status_params
    params.require(:train_status).permit(:message)
  end
end
