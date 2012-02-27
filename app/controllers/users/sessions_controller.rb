class Users::SessionsController < Devise::SessionsController

  def new
    @categories = Category.find(:all) 
    super      
  end
  
  
end
