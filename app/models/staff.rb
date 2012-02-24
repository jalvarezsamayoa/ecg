class Staff < ActiveRecord::Base
  
  has_attached_file :photo,
    :styles => {
      :thumb => "150x150>", 
      :original => "400x400>" },
     
      
      :url => "/system/staff/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/staff/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
    
    
    #Validations
    validates_presence_of :name, :message => "You must enter a name!"
end
# == Schema Information
#
# Table name: staffs
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  bio                :text
#  link               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#  photo_updated_at   :datetime
#

