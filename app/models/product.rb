class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  #Relationships
  belongs_to :category
  belongs_to :brand
  has_one :spotlight
  

  has_many :photos, :order => "position"
  has_one :front_photo, :class_name => 'Photo', :conditions => {:front => true}, :autosave => true

  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes["data"].blank? }

  has_attached_file :audioclip,      
      :url => "/system/product_audio/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/product_audio/:id/:basename_:style.:extension"

  after_save :update_category_brands
  
  def self.per_page
      6
  end
  
  def self.new_spotlight=(a_product)
    spotlight = Spotlight.find_by_name("New")
    spotlight.product = a_product
    spotlight.save
  end
  def self.vintage_spotlight=(a_product)
    spotlight = Spotlight.find_by_name("Vintage")
    spotlight.product = a_product
    spotlight.save
  end
  
  def self.find_new_spotlight
     spotlight = Spotlight.find_by_name("New")
     spotlight.product
  end
  def self.find_vintage_spotlight
     spotlight = Spotlight.find_by_name("Vintage")
     spotlight.product
  end

  private

  def update_category_brands
    CategoryBrand.find_or_create_by_category_id_and_brand_id(self.category_id, self.brand_id)
  end
  
  
end
# == Schema Information
#
# Table name: products
#
#  id                     :integer(4)      not null, primary key
#  title                  :string(255)
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#  category_id            :integer(4)
#  brand_id               :integer(4)
#  price                  :integer(4)
#  photo_file_name        :string(255)
#  photo_content_type     :string(255)
#  photo_file_size        :integer(4)
#  photo_updated_at       :datetime
#  video                  :text
#  audioclip_file_name    :string(255)
#  audioclip_content_type :string(255)
#  audioclip_file_size    :integer(4)
#  audioclip_updated_at   :datetime
#

