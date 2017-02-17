class Profile < ActiveRecord::Base
  has_many :images
  belongs_to :user
  has_attached_file :profile_image, :styles => { :medium => "600x600>", :thumb => "100x100#" }, :default_url => "https://www.cs.bham.ac.uk/people/images/placeholder.png"
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
end
