class FeaturedVideo < ActiveRecord::Base
  validates :title, :embeded_code, :presence => true

   has_attached_file :image,
  :url => "/system/featured_videos/:featured_video_id/:basename_:style.:extension",
  :path => ":rails_root/public/system/featured_videos/:featured_video_id/:basename_:style.:extension",
  :styles => {
    :tiny => "50x50>",
    :catalog => "140x107#",
    :original => "1000x1000>",
    :spotlight => "236x216#",
  }
  
  validates_attachment_content_type :image,
  :content_type => ['image/jpeg', 'image/pjpeg',
                    'image/jpg', 'image/png']

  
end
