require 'twilio-ruby'
Twilio.configure do |config|
    config.account_sid = ENV['TWILIO_ACCOUNT_SID']
    config.auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

# this sends a text message
#   client = Twilio::REST::Client.new
#   client.messages.create({
#     from: ENV['TWILIO_PHONE_NUMBER']
#     to: '+16789367721',
#     body: 'This is your L Train News Bulletin!'
#   })
