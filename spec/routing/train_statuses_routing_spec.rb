require "rails_helper"

RSpec.describe TrainStatusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/train_statuses").to route_to("train_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/train_statuses/new").to route_to("train_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/train_statuses/1").to route_to("train_statuses#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/train_statuses").to route_to("train_statuses#create")
    end
  end
end
