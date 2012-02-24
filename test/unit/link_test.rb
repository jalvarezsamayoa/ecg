require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

