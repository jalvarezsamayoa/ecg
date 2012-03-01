class FeaturedVideosController < ApplicationController
  inherit_resources
  
  before_filter :authenticate_user!
  before_filter :find_categories
  
  respond_to :html
  
end
