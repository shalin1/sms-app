class TextMessagesController < ApplicationController

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
        format.html { redirect_to @text_message, notice: 'Text message was successfully created.' }
        format.json { render :show, status: :created, location: @text_message }
      else
        format.html { render :new }
        format.json { render json: @text_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def reply
    @from_number = params['From']
  end

  private

  def text_message_params
    params.require(:text_message).permit(:to, :body)
  end
end
