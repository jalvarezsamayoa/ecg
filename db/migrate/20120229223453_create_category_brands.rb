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



    
  end
end
