module TextMessagesHelper
   def parse_sms(sms)
    body = sms[:Body]&.strip&.upcase
    from = sms[:From]

    case body

    when 'START'
        subscriber = Subscriber.create(phone_number: from)
        return "The number #{from} has been subscribed to L train service fails!"

    when 'STOP'
        subscriber = Subscriber.find_by(phone_number: from)
        if subscriber
            subscriber.destroy
            return "The number #{from} has been unsubscribed."
        else
            return "You are already unsubscribed"
        end

    when 'STATUS'
        return "L train status: #{TrainStatus.last.message}"

    else
        return "Welcome to the L train hotline! Send START or STOP to manage your subscription, or just send STATUS to see how the L is doing!"
    end
end

end
