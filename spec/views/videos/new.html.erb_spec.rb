require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :uri => "MyString",
      :topic => nil
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input[name=?]", "video[uri]"

      assert_select "input[name=?]", "video[topic_id]"
    end
  end
end
