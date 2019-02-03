require 'rails_helper'

describe 'User' do
  it "can register" do

    visit '/'

    click_on "Register"

    expect(current_path).to eq(registration_path)

    fill_in 'user[email]', with: "creativeEmail@gmail.com"
    fill_in 'user[username]', with: "Geefy"
    fill_in 'user[password]', with: "#1kewlguy"
    fill_in 'user[password_confirmation]', with: "1kewlguy"

    click_on "Register"
    expect(current_path).to eq(profile_path)
  end

  it "can sign in" do

    user = create(:user)

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Please Log In')

    fill_in 'username', with: user.username
    fill_in 'password', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content(user.username)
  end

  it "can log out" do

    user = create(:user)

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Please Log In')

    fill_in 'username', with: user.username
    fill_in 'password', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content(user.username)

    click_on 'Logout'

    expect(page).to have_content("Welcome")

  end

end
