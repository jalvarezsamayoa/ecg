# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# after updating to devise users
User.create!(:email => 'admin@emeraldcityguitars.com', :password => 'Bulldog.72', :password_confirmation => 'Bulldog.72', :name => "Administrator")

# after addding slugs to products
Product.find_each(&:save)

# after adding slugs to brands
Brand.find_each(&:save)

# after adding slugs to categories
Category.find_each(&:save)

# after adding position to photos
Product.all.each do |product|
  i = 1
  product.photos.order("front desc").each do |photo|
    photo.position = i
    photo.save

    i += 1
  end

end

# after adding categories to brands
Category.all.each do |category|
  i = 1
  category.brands.each do |brand|
    cb = CategoryBrand.find_or_initialize_by_category_id_and_brand_id(category.id, brand.id)
    cb.position = i
    cb.save
    i += 1
  end
end
