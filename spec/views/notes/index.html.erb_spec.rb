require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :body => "MyText",
        :bookmark_id => "Bookmark",
        :video_id => "Video"
      ),
      Note.create!(
        :body => "MyText",
        :bookmark_id => "Bookmark",
        :video_id => "Video"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Bookmark".to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
  end
end
