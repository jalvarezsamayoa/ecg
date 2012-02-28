class AddPositionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :position, :integer
    add_index :photos, :position

    Product.all.each do |product|
      i = 1
      product.photos.order("front desc").each do |photo|
        photo.position = i
        photo.save

        i += 1
      end
      
    end
  end
end
