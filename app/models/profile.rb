class Profile < ActiveRecord::Base
  has_many :images
  belongs_to :user
  has_attached_file :profile_image, :styles => { :medium => "600x600>", :thumb => "100x100#" }
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
end
