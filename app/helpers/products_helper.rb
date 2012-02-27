module ProductsHelper
  
  def product_sort_options
    options_for_select([
      ['', nil],
      ['Newest to Oldest', 'updated_at DESC'],
      ['Oldest to Newest', 'updated_at ASC'],
      ['Price: Highest to Lowest', 'price DESC'],
      ['Price: Lowest to Highest', 'price ASC'],
      ['Name', 'title ASC']
    ])#, :selected => (@search.nil? ? nil : @search.order.to_s))
  end
  
end
