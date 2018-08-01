require 'rails_helper'

RSpec.describe "text_messages/edit", type: :view do
  before(:each) do
    @text_message = assign(:text_message, TextMessage.create!(
      :to => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit text_message form" do
    render

    assert_select "form[action=?][method=?]", text_message_path(@text_message), "post" do

      assert_select "input[name=?]", "text_message[to]"

      assert_select "textarea[name=?]", "text_message[body]"
    end
  end
end
