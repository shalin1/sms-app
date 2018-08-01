class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
    @to ="+16789367721"
  end


  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: "+16789367721",
      body: message,
    })
  end
end
