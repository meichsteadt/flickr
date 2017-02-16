class Image < ActiveRecord::Base
  belongs_to :profile
  has_attached_file :image_post, :styles => { :medium => "300x300>", :thumb => "100x100" }
  validates_attachment_content_type :image_post, :content_type => /\Aimage\/.*\Z/
end
