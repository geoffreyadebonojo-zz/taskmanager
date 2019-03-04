require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :body => "MyText",
      :bookmark_id => "Bookmark",
      :video_id => "Video"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Bookmark/)
    expect(rendered).to match(/Video/)
  end
end
