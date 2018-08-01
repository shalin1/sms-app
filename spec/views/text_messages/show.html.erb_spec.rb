require 'rails_helper'

RSpec.describe "text_messages/show", type: :view do
  before(:each) do
    @text_message = assign(:text_message, TextMessage.create!(
      :to => "To",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/To/)
    expect(rendered).to match(/MyText/)
  end
end
