require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

