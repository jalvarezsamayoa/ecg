class AddSlugToProducts < ActiveRecord::Migration
  def change
    add_column :products, :slug, :string
    add_index :products, :slug

#    Product.find_each(&:save)
    
  end
end
