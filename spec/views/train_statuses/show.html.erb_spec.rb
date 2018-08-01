require 'rails_helper'

RSpec.describe "train_statuses/show", type: :view do
  before(:each) do
    @train_status = assign(:train_status, TrainStatus.create!(
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
