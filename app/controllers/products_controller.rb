class ProductsController < ApplicationController
   before_filter :find_categories
   before_filter :authenticate_user!, :only => [ :index, :new, :edit ]
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @meta_title = "#{@product.title}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

   # @spotlight = Spotlight.find(:all)
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

   # respond_to do |format|
       if @product.save
          unless params[:spotlight] == "None"
            spotlight = Spotlight.find_by_name(params[:spotlight])  # step 1
            spotlight.product = @product                            # step 2
            spotlight.save                                          # step 3
          end
          redirect_to product_url(@product)
        else
          render :action => :new
      end
    end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    params[:photo_ids] ||= []
        @product = Product.find(params[:id])
        unless params[:photo_ids].empty?
          Photo.destroy_pics(params[:id], params[:photo_ids])
        end
    
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
          unless params[:spotlight] == "None"
            spotlight = Spotlight.find_by_name(params[:spotlight])  # step 1
            spotlight.product = @product                            # step 2
            spotlight.save                                          # step 3
          end
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(products_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end

