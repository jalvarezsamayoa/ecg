class Visitor < ActiveRecord::Base

  has_attached_file :photo,
    :styles => {
      :thickbox => "400x400>",
      :visitor => "150x150>", # Image to be the Visitor Potfolio
      :original => "258x198#" }, # Image to fit the homepage recents 258px x 198px
      :big => "1000x1000>",
      
      :url => "/system/visitors/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/visitors/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']

end
# == Schema Information
#
# Table name: visitors
#
#  id                 :integer(4)      not null, primary key
#  caption            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#  photo_updated_at   :datetime
#  second_caption     :string(255)
#

