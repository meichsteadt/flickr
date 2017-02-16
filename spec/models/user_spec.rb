require 'rails_helper'

describe User do
  it { should have_one :profile}
  it "will have an email" do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq 'test1234@test.com'
  end
  it "will have an password" do
    user = FactoryGirl.create(:user)
    expect(user.password).to eq 'password'
  end
  it "will return the profile of the user if it doesn't have one" do
    user = FactoryGirl.create(:user)
    expect(user.profile).to eq Profile.find_by_user_id(user.id)
  end
  it "will return the profile of the user if it does have one" do
    user = FactoryGirl.create(:user)
    profile = Profile.create(user_id: user.id)
    expect(user.profile).to eq Profile.find_by_user_id(user.id)
  end
end
