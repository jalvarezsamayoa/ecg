class Brand < ActiveRecord::Base
  has_many :products
  belongs_to :category

  has_many :category_brands, :order => "position"

  extend FriendlyId
  friendly_id :name, :use => :slugged

  #Validations
  validates_presence_of :name
  def <=> other
    self.name <=> other.name
  end
end
# == Schema Information
#
# Table name: brands
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

