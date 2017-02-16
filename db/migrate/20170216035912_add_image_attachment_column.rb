class AddImageAttachmentColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :images do |t|
      t.attachment :image_post
    end
  end
end
