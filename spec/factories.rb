FactoryGirl.define do
  factory(:user) do
    email 'test1234@test.com'
    password 'password'
  end

  factory(:profile) do
    first_name "Michael"
    last_name "Jordan"
    user_id nil
  end
end
