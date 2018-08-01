require 'rails_helper'

RSpec.describe "text_messages/new", type: :view do
  before(:each) do
    assign(:text_message, TextMessage.new(
      :to => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new text_message form" do
    render

    assert_select "form[action=?][method=?]", text_messages_path, "post" do

      assert_select "input[name=?]", "text_message[to]"

      assert_select "textarea[name=?]", "text_message[body]"
    end
  end
end
