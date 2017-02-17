class Image < ActiveRecord::Base
  belongs_to :profile
  validates :image_post, attachment_presence: true
  has_attached_file :image_post, :styles => { :medium => "300x300>", :thumb => "100x100" }, :default_url => ""
  validates_attachment_content_type :image_post, :content_type => /\Aimage\/.*\Z/
end
