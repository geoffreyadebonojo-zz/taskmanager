require 'rails_helper'

RSpec.describe "bookmarks/edit", type: :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!(
      :name => "MyString",
      :url => "MyString",
      :topic => nil
    ))
  end

  it "renders the edit bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmark_path(@bookmark), "post" do

      assert_select "input[name=?]", "bookmark[name]"

      assert_select "input[name=?]", "bookmark[url]"

      assert_select "input[name=?]", "bookmark[topic_id]"
    end
  end
end
