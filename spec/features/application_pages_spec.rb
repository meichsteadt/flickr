require 'rails_helper'

describe "Redirect at login" do
  it "Will redirect user after login" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in "user[email]", :with => "test1234@test.com"
    fill_in "user[password]", :with => "password"
    click_button "Log in"
    expect(page).to have_content "Spruce"
  end
end
