task :ping_mta => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.post "/train_statuses"
  end
