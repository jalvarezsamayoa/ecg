class CreateCategoryBrands < ActiveRecord::Migration
  def change
    create_table :category_brands do |t|
      t.integer :category_id
      t.integer :brand_id
      t.integer :position

      t.timestamps
    end

    add_index :category_brands, :category_id
    add_index :category_brands, :brand_id
    add_index :category_brands, [:category_id, :brand_id], :unique => true


    Category.all.each do |category|
      i = 1
      category.brands.each do |brand|
        cb = CategoryBrand.find_or_initialize_by_category_id_and_brand_id(category.id, brand.id)
        cb.position = i
        cb.save
        i += 1
      end
    end
    
  end
end
