class Category < ActiveRecord::Base
  has_many :brands, :through => :products, :uniq => true
  has_many :products
 # acts_as_friendly_param :name
 
 validates_presence_of :url_name
 validates_uniqueness_of :url_name
 
 def to_param
  self.url_name
 end
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  url_name   :string(255)
#

