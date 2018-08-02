namespace :ping_mta do
    task query: :environment do
        desc "pinging MTA for status #{Time.now.getlocal.zone}"
        session = ActionDispatch::Integration::Session.new(Rails.application)
        session.post "/train_statuses"
    end
end
