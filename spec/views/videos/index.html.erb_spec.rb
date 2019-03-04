require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :uri => "Uri",
        :topic => nil
      ),
      Video.create!(
        :uri => "Uri",
        :topic => nil
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
