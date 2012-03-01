class CreateFeaturedVideos < ActiveRecord::Migration
  def change
    create_table :featured_videos do |t|
      t.string :title
      t.string :embeded_code

      t.timestamps
    end
  end
end
