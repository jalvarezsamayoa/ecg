class CategoriesController < ApplicationController
require 'will_paginate/array'
  before_filter :login_required, :only => [ :index, :edit ]
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
     @category = Category.find_by_url_name(params[:id])
     @brands = @category.brands
     @categories = Category.find(:all)
     @meta_title = "#{@category.name}"

    respond_to do |format|
      format.html do |wants|
              @brand = @brands.first     
              @search = Product.find(:all, :conditions => {:brand_id => @brand.id, :category_id => @category.id})
              @products = @search.paginate :page => params[:page]
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
end
