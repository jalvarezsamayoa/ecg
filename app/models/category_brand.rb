class CategoryBrand < ActiveRecord::Base
  acts_as_list
  belongs_to :brand
  belongs_to :category

  def name
    category.name
  end
end
