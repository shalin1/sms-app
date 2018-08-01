require 'rails_helper'

RSpec.describe "train_statuses/edit", type: :view do
  before(:each) do
    @train_status = assign(:train_status, TrainStatus.create!(
      :message => "MyText"
    ))
  end

  it "renders the edit train_status form" do
    render

    assert_select "form[action=?][method=?]", train_status_path(@train_status), "post" do

      assert_select "textarea[name=?]", "train_status[message]"
    end
  end
end
