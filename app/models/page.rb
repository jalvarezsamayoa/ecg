class Page < ActiveRecord::Base
  before_save :downcase_fields
#  acts_as_textiled :body
  
  def downcase_fields
    self.title.downcase! unless self.title.nil?
    self.name.downcase! unless self.name.nil?
  end
end
# == Schema Information
#
# Table name: pages
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  name       :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

