require 'rails_helper'

RSpec.describe "train_statuses/new", type: :view do
  before(:each) do
    assign(:train_status, TrainStatus.new(
      :message => "MyText"
    ))
  end

  it "renders new train_status form" do
    render

    assert_select "button[action=?][method=?]", train_statuses_path, "post" do
      assert_select "button[name=?]", "train_status[message]"
    end
  end
end
