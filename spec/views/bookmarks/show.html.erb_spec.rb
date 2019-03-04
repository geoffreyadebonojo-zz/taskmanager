require 'rails_helper'

RSpec.describe "bookmarks/show", type: :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!(
      :name => "Name",
      :url => "Url",
      :topic => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
