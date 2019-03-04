require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :body => "MyText",
      :bookmark_id => "MyString",
      :video_id => "MyString"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "textarea[name=?]", "note[body]"

      assert_select "input[name=?]", "note[bookmark_id]"

      assert_select "input[name=?]", "note[video_id]"
    end
  end
end
