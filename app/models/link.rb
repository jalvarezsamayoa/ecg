class Link < ActiveRecord::Base
  has_attached_file :photo,
    :styles => {

      :original => "100x100>" },
     
      
      :url => "/system/visitors/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/visitors/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
end
# == Schema Information
#
# Table name: links
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :text
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#  photo_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  link_url           :string(255)
#

