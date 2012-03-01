class AddAttachmentImageToFeaturedVideo < ActiveRecord::Migration
  def self.up
    add_column :featured_videos, :image_file_name, :string
    add_column :featured_videos, :image_content_type, :string
    add_column :featured_videos, :image_file_size, :integer
    add_column :featured_videos, :image_updated_at, :datetime
  end

  def self.down
    remove_column :featured_videos, :image_file_name
    remove_column :featured_videos, :image_content_type
    remove_column :featured_videos, :image_file_size
    remove_column :featured_videos, :image_updated_at
  end
end
