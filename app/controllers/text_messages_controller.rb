class TextMessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

  def index
    @text_messages = TextMessage.all
  end

  def show
     @text_message = TextMessage.find(params[:id])
  end

  def new
    @text_message = TextMessage.new
  end

  def create
    @text_message = TextMessage.new(text_message_params)

    respond_to do |format|
      if @text_message.save
        TwilioTextMessenger.new(@text_message.body,@text_message.to).send
        redirect_to @text_message, notice: 'Text message was successfully created.'
      else
        respond_to do |format|
            format.html { render :new }
            format.json { render json: @text_message.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def reply
    @from = (params['From'])
    @status_message = helpers.parse_sms(params)
    @text_message = TextMessage.new({to:@from,body:@status_message})

    if @text_message.save
        response = Twilio::TwiML::MessagingResponse.new do |r|
            r.message body: @status_message
        end
        render xml: response.to_s
      else
        respond_to do |format|
            format.html { render :new }
            format.json { render json: @text_message.errors, status: :unprocessable_entity }
        end
      end
  end

  private

  def text_message_params
    params.require(:text_message).permit(:to, :body)
  end
end
