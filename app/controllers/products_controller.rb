# encoding: utf-8
class ProductsController < ApplicationController
  include SweetaErrors
  before_filter :unpublish_pages, except: [ :show, :new ]
  before_filter :only_user_allow, :only => [:new, :edit, :create]
  skip_before_render :set_seo_word_hash, only: :create

  add_breadcrumb "home", :root_path
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.where(["id = ?", params[:id].to_i]).first
    raise NoProductError if @product.blank?

    @providers = @product.providers
    @product_contents = @product.contents

    @shop = @product.shop
    raise NoShopError if @shop.blank?
    
    @reviews = @product.reviews
    @review_images = @product.review_images
    
    @main_review = @reviews.first
    @main_image  = @product.images.try(:first)
    @countries = Country.all

    add_breadcrumb "#{@shop.name} - #{@product.name} 商品詳細", product_path
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @shop = Shop.where(["id = ?", params[:shop_id]]).first
    raise "お探しのお店が見つかりません" unless @shop.present?
    @product = Product.new
    @provider = Provider.new
    @product_types = ProductType.all
    @countries = Country.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    product = Product.new(params[:product])

    if params[:product].present? && params[:product][:shop_id].present? && shop = Shop.where(["id = ?", params[:product][:shop_id]])
      shop_name = shop.first.name
    end

    begin 
      Product.transaction do
        product.save!
        provider = Provider.new((params[:provider]).merge({:name => shop_name, :product_id => product.id}))
        provider.save!
        product_content = product.contents.build(params[:product_content])
        product_content.save!
      end
      saved_flg = true
    rescue
      saved_flg   = false
    end

    respond_to do |format|
      if saved_flg
        format.html { redirect_to action: :show, id: product.id }
      else
        format.html { redirect_to :action => :new, :shop_id => params[:product][:shop_id] }
        # redirect_to :action => :new, :shop_id => params[:shop_id]
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
