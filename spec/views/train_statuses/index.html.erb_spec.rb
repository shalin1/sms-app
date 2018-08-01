require 'rails_helper'

RSpec.describe "train_statuses/index", type: :view do
  before(:each) do
    assign(:train_statuses, [
      TrainStatus.create!(
        :message => "MyText"
      ),
      TrainStatus.create!(
        :message => "MyText"
      )
    ])
  end

  it "renders a list of train_statuses" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
