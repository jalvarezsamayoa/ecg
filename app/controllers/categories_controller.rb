class CategoriesController < ApplicationController

  before_filter :authenticate_user!, :only => [ :index, :edit ]
  before_filter :find_categories

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    @brands = @category.category_brands.includes(:brand)
    @categories = Category.find(:all)
    @meta_title = "#{@category.name}"

    respond_to do |format|
      format.html do |wants|
        @brand = @brands.first.brand
        @search = Product.where("brand_id = ? and category_id = ?" , @brand.id, @category.id)
        @products = @search.paginate(:page => params[:page], :per_page => 12)
        #.order(params[:order] || :descend_by_price)

        render :template => 'brands/show'
      end
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find_by_url_name!(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(@category) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find_by_url_name!(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { render :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  #def destroy
  # @category = Category.find(params[:id])
  #  @category.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(categories_url) }
  #    format.xml  { head :ok }
  #  end
  #end

  def sort_brands
    @category = Category.find(params[:id])

    @category.category_brands.each do |cb|
      cb.position = params['category_brand'].index(cb.id.to_s) + 1
      cb.save
    end

    render :nothing => true
  end
end
