json.extract! train_status, :id, :message, :created_at, :updated_at
json.url train_status_url(train_status, format: :json)
