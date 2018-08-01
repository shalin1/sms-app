class TwilioTextMessenger
  attr_reader :body, :to

  def initialize(body, to)
    @body = body
    @to = to
  end

  def send
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: to,
      body: body,
    })
  end
end
