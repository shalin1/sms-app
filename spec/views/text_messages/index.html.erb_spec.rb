require 'rails_helper'

RSpec.describe "text_messages/index", type: :view do
  before(:each) do
    assign(:text_messages, [
      TextMessage.create!(
        :to => "To",
        :body => "MyText"
      ),
      TextMessage.create!(
        :to => "To",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of text_messages" do
    render
    assert_select "tr>td", :text => "To".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
