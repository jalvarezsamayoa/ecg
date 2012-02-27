class AddSlugToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :slug, :string
    add_index :brands, :slug

    Brand.find_each(&:save)
    
  end
end
