class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  def has_profile
    if Profile.find_by_user_id(self.id)
      true
    else
      false
    end
  end
  
  def profile
    if Profile.find_by_user_id(self.id)
      Profile.find_by_user_id(self.id)
    else
      profile = Profile.create(user_id: self.id)
      self.update(profile_id: profile.id)
      profile
    end
  end
end
