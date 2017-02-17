require 'rails_helper'

describe "show user profile" do
  it "will show current user profile" do
    user = FactoryGirl.create(:user)
    profile = Profile.create(user_id: user.id, first_name: 'Henry')
    visit profile_path(profile.id)
    expect(page).to have_content "Edit"
  end
  it "allow user edit profile" do
    user = FactoryGirl.create(:user)
    profile = Profile.create(user_id: user.id, first_name: 'Henry')
    login_as(user, :scope => :user)
    visit edit_profile_path(profile)
    fill_in "profile[first_name]", :with => "Matty"
    fill_in "profile[last_name]", :with => "Boy"
    fill_in "profile[location]", :with => "Not Portland"
    page.attach_file "profile[profile_image]", "spec/fixtures/images/elon.jpg"
    click_button "SAVE IT"
    expect(page).to have_content "Successfully updated profile"
  end
end
