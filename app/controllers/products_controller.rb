# encoding: utf-8
class ProductsController < ApplicationController
  include SweetaErrors
  before_filter :get_user, :only => [:new, :edit, :create]

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
    @product_contents = @product.contents

    @shop = @product.shop
    raise NoShopError if @shop.blank?
    
    @reviews = @product.review
    @review_images = ReviewImage.where(["product_id = ?", @product.id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @shop_id = params[:shop_id]
    raise "お探しのお店が見つかりません" unless @shop_id.present?
    @product = Product.new
    @product_types = ProductType.all
    @flavors = Flavor.all

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
    @product = Product.new(params[:product])
    content_params = params[:product_content]
    flavors     = params[:product_flavor]
    saved_flg   = false
    Product.transaction do
      @product.save!
      flavors.each do |flavor_id, quantity|
        if quantity.to_i != 0
          product_content = ProductContent.new(content_params.merge(:product_id => @product.id, :flavor_id => flavor_id, :quantity => quantity))
          product_content.save!
        end
      end
      saved_flg = true
    end

    respond_to do |format|
      if saved_flg
        format.html { redirect_to :controller => "reviews", :action => "new", :product_id => @product.id }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
