class TrainStatusesController < ApplicationController
    skip_before_action :verify_authenticity_token

  def index
    @train_statuses = TrainStatus.all
  end

  def show
    @train_status = TrainStatus.find(params[:id])
  end

  def new
    @train_status = TrainStatus.new
  end

  def create
    create_train_status

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

  def reply
    create_train_status
    if @train_status.save
        @from_number = (params['From'])
        TwilioTextMessenger.new(@train_status.message, @from_number).send
        render @train_status, notice: @train_status.message
        return
    else
        format.html { render :new }
        format.json { render json: @train_status.errors, status: :unprocessable_entity }
     end
    end

  def create_train_status
    @status = MtaInfo.new.l_status
    @train_status = TrainStatus.new(message:@status)
  end

  def train_status_params
    params.require(:train_status).permit(:message)
  end
end
