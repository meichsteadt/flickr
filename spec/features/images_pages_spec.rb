require 'rails_helper'

describe "the add a list process" do
  it "shows all images on index path" do
    user = FactoryGirl.create(:user)
    profile = Profile.create(user_id: user.id)
    visit new_profile_image_path(profile.id)
    page.attach_file "image[image_post]", "spec/fixtures/images/elon.jpg"
    click_button "Upload"
    expect(page).to have_content "Photo successfully uploaded"
  end
end
