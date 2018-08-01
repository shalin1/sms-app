require 'rails_helper'

RSpec.describe "TrainStatuses", type: :request do
  describe "GET /train_statuses" do
    it "works! (now write some real specs)" do
      get train_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
