class ApplicationController < ActionController::Base
  protect_from_forgery
   
   before_filter :meta_defaults
   private

   def meta_defaults
     @meta_title = ""
     @meta_keywords = "Vintage Guitars, Seattle Vintage Guitars, Guitars, Used Guitars, Seattle Used Guitars"
     @meta_description = "Seattle's Best Vintage and Used Guitar Shop"
   end
   
   def mobile_device?
     if session[:mobile_param]
       session[:mobile_param] == "1"
     else
       request.user_agent =~ /Mobile|webOS/
     end
   end
   helper_method :mobile_device?

   def prepare_for_mobile
     session[:mobile_param] = params[:mobile] if params[:mobile]
     request.format = :mobile if mobile_device?
   end
   
   def redirect_mobile 
       redirect_to '/mobile.html' if mobile_device?
   end
   
    
   protected 
    def find_categories
      @categories = Category.find(:all)
    end
end
