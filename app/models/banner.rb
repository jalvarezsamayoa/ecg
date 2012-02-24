class Banner < ActiveRecord::Base
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100>", 
      :original => "400x400>" },
     
      
      :url => "/system/banners/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/banners/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
    
    
    before_validation :clear_photo

    def delete_photo=(value)
      @delete_photo = !value.to_i.zero?
    end

    def delete_photo
      !!@delete_photo
    end
    alias_method :delete_photo?, :delete_photo

    def clear_photo
      self.photo = nil if delete_photo?
    end
    
end
# == Schema Information
#
# Table name: banners
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  body               :text
#  switch             :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#  photo_updated_at   :datetime
#

