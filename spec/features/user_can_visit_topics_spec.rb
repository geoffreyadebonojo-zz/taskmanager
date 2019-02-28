require 'rails_helper'

RSpec.describe "User" do
  it "can visit Topics Index" do
    user = create(:user)

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Please Log In')

    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Log In'

    click_on 'topics'
    expect(page).to have_content("Topics")

    click_on 'New Topic'
    fill_in 'topic[name]', with: "Ruby on Rails"
    click_on 'Create Topic'

    expect(page).to have_content("Ruby on Rails")

  end
end
